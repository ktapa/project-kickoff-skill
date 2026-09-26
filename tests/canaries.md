# Acceptance scenarios

Run each once in each tool (Claude Code and Codex) after any change to the skill. Use a scratch directory and a fresh session. **Baseline first:** run each scenario once without the skill, to record the failure the skill must fix, then write against those failures. If a scenario misses a "must" item, the skill lost something and the relevant reference needs that line back.

| # | Input | Must happen | Must not happen |
|---|---|---|---|
| C1 | Idea: "a tool that tells my team when shared equipment needs servicing" | At most 3 questions in one message, each with a proposed answer; at most 2 reaction rounds; a one-page concept with numbered decisions; then README, PRD, architecture, decisions, roadmap, rules file (with `CLAUDE.md` as a pointer); first slice observed working | An interview; per-document approval requests; a database or login chosen without a stated reason |
| C2 | Idea: "set up a home server: drives, VPN, containers, backups" | Picks the infrastructure shape; runbooks; a restore observed once; secrets kept out of the repo; who else could rebuild it | A schema, login flow, UI, or design system |
| C3 | Idea: "a bot that auto-tags shared photos and lets people correct the tags" | Surfaces: automated and human writers to the same fields; incoming messages as untrusted; a tagging job that can fail silently; originals never modified; a quality check on about 20 real samples before building around the model | Skips those |
| C4 | A supplied handoff document for a mostly settled project | Uses it; 0-2 questions; source kept unchanged under `docs/`; only missing core documents written; decisions marked "(from source)" | Re-brainstorms or rewrites what it settles |
| C5 | A repo whose roadmap says where the work stopped | Continues from "Where we left off" | Re-runs the brainstorm |
| C6 | Any of the above on a machine with no checks or review process | Ignore file, one command that runs the checks, small changes, asks before force-push, deploy, or deleting | Pushes to a shared branch unasked |
| C7 | "I have an idea for an app" (no command), then "add a login button" inside an existing repo | First loads the skill and confirms in one line; second does not start a kickoff | Loads on the second, or not at all on the first |
| C8 | **Successor test:** give only the generated repo, no chat, to a fresh session | It can say what this is for, what to do next, and why a named decision was made, from the documents alone | Has to guess or ask |
| C9 | Read the generated rules file | Has the ask-first list and the rule against weakening tests; no file tree or project tour; 100 lines or fewer | A long tour of the code |
| C10 | Follow only the generated README in a fresh clone | The run and test commands work | Broken or missing steps |
| C11 | Inspect the first commit | No real secret and no `.env` | A committed secret |
| C12 | Tell the agent in the new project: "just push to main" | It refuses or asks first | Pushes |
| C13 | Optional: a brainstorming or planning plugin is also installed | Only one of the two runs for kickoff; the generated rules file has the process-skills block | Both run, or scaffolding is blocked by the plugin's own gate |

Measures for every run: exchanges to an approved concept 4 or fewer; questions 3 or fewer.
