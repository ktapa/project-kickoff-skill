#!/usr/bin/env bash
# Install the project-kickoff skill for Claude Code and/or Codex. Re-run after `git pull` to update.
#   ./install.sh              install for each tool found on this machine
#   ./install.sh --claude     Claude Code only
#   ./install.sh --codex      Codex only
#   ./install.sh --uninstall  remove it from both
#   ./install.sh --paste      print the skill as one document, for a tool without skills
set -euo pipefail
here=$(cd "$(dirname "$0")" && pwd)
src="$here/skills/project-kickoff"
claude_skills="$HOME/.claude/skills"
codex_home="${CODEX_HOME:-$HOME/.codex}"
codex_skills="$codex_home/skills"

targets=()
case "${1:-}" in
  --paste)
    for f in "$src/SKILL.md" "$src"/references/*.md; do
      printf '\n<!-- %s -->\n' "${f#"$here"/}"
      cat "$f"
    done
    exit 0
    ;;
  --uninstall)
    for d in "$claude_skills" "$codex_skills"; do
      if [ -d "$d/project-kickoff" ]; then
        rm -rf "${d:?}/project-kickoff"
        echo "removed: $d/project-kickoff"
      fi
    done
    exit 0
    ;;
  --claude) targets=("$claude_skills") ;;
  --codex) targets=("$codex_skills") ;;
  "")
    if [ -d "$HOME/.claude" ] || command -v claude >/dev/null 2>&1; then targets+=("$claude_skills"); fi
    if [ -d "$codex_home" ] || command -v codex >/dev/null 2>&1; then targets+=("$codex_skills"); fi
    ;;
  *)
    echo "usage: $0 [--claude | --codex | --uninstall | --paste]" >&2
    exit 2
    ;;
esac

if [ "${#targets[@]}" -eq 0 ]; then
  echo "Neither Claude Code nor Codex was found. Re-run with --claude or --codex to install anyway." >&2
  exit 1
fi

for d in "${targets[@]}"; do
  mkdir -p "$d"
  rm -rf "${d:?}/project-kickoff"
  cp -R "$src" "$d/project-kickoff"
  echo "installed: $d/project-kickoff"
done
echo "Start a new session in your tool, then describe your idea or run the skill directly (see README)."
