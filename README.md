# project-kickoff

A skill for Claude Code (Anthropic) and Codex (OpenAI) that takes you from a new idea to a project someone else could pick up.

You describe an idea. It runs a short brainstorm (at most three questions and two rounds of your reactions), shows you a one-page concept to approve once, then writes the project documents (README, PRD, architecture, decisions log, roadmap, and an agent rules file that works in both tools) and builds a first thin working slice. The rules it writes into your repo bake in common engineering and AI-agent practice: small changes, tests before "done", no secrets in git, a human merges, and an ask-first list for risky actions.

It needs no other tooling, and it is plain text: nothing runs on your machine except the copy step below.

A GitHub Actions check (`.github/workflows/check.yml`) runs shellcheck on `install.sh`, a test install for both tools, and a markdown link check on every pull request.

## Install

You need Claude Code, Codex, or both. Pick one way.

**Script (macOS, Linux, WSL, Git Bash):**

```
git clone https://github.com/ktapa/project-kickoff-skill.git
cd project-kickoff-skill
./install.sh
```

It installs for each tool it finds. Use `./install.sh --claude` or `./install.sh --codex` to choose. Update with `git pull && ./install.sh`. Remove with `./install.sh --uninstall`.

**By hand:** copy the folder `skills/project-kickoff` into your tool's skills folder:

- Claude Code: `~/.claude/skills/`
- Codex: `~/.codex/skills/` (or `$CODEX_HOME/skills/`)

On Windows, `~` is your user folder.

**From inside Codex:** ask Codex to install a skill from this GitHub URL: `https://github.com/ktapa/project-kickoff-skill/tree/main/skills/project-kickoff`.

**No skills support?** `./install.sh --paste` prints the whole skill as one document you can paste into a chat.

Then start a new session in your tool.

## Use

Describe an idea ("I have an idea for a tool that tells my team when shared equipment needs servicing"), or ask to start a new project, or run it directly:

- Claude Code: `/project-kickoff`
- Codex: `$project-kickoff`

You can point it at notes, a spec, or a handoff document (`/project-kickoff notes.md`); it uses what you supply and skips what that already settles. If it starts from conversation, it first confirms in one line that this is a new project and not a change to an existing one.

## What it will and won't do

- It asks few questions and states its assumptions so you can override them.
- It stops once, at the concept. After that it only interrupts you for a product choice, real cost, a security or privacy risk, possible data loss, or something hard to undo.
- It asks before anything irreversible or shared: force-pushing, deleting, publishing, deploying, spending money, creating a remote, or changing settings on a code host.
- It does not send anything anywhere. The rules it writes say the same to future agent sessions.
- It is early. Check that it behaves on your setup with the scenarios in `tests/canaries.md`.

## How it is organised

`skills/project-kickoff/SKILL.md` is the short core the tool always reads. The files in `references/` are opened only at the step that needs them (brainstorm, project shapes, risk traps, documents, templates, the rules file, repo setup, first slice).

## Keeping it lean

Every line in the skill must change what the agent does. Prefer deleting to adding. Put detail in `references/`, opened only at the step that needs it. Write guidance as a recipe of what the output should contain, and keep "never" for discrete actions such as pushing to `main` or editing a test to make it pass.

## Acknowledgements

Several mechanisms were adapted, in our own words, from [obra/superpowers](https://github.com/obra/superpowers) (MIT, © 2025 Jesse Vincent): announcing the mode, scoping what an approval covers, edge-case lists, recording rulings instead of stalling, verification wording, and running a baseline before writing a skill. This project does not depend on it and works alongside it.

## Licence

MIT. See `LICENSE`.
