# Document templates (step 5)

Fill the `<angle brackets>`; delete lines that don't apply. The PRD and architecture outlines are in `documents.md`; these are the pieces that need exact wording.

## PRD: sections to add

~~~~markdown
## Done means
For each "Must do" outcome, one check a person or script can run and observe:
- O1 <outcome> - check: <command or steps> - expected: <what you will see>
Edge cases: up to five inputs or conditions the outcomes imply but no check above covers (empty, huge, duplicate, malformed, offline, slow), most likely first. Each gets a test in the slice that owns it.
v1 is done when every check passes on a clean clone, the README is accurate, and the owner has seen it work.

## Constraints  (only if there are any)
Exact versions, limits and naming rules, copied from the source rather than paraphrased. They apply to every change.

## Risks and blast radius  (delete lines that do not apply)
- Data: what would hurt to lose or leak: <...>. Backup: <where, how often>. Last restore tested: <date | not yet>.
- Secrets: <which exist, where they are stored, who can rotate them>.
- Untrusted input: <what comes from outside and what it can trigger>.
- Money: <paid services>. Monthly cap $<n>; alert at $<n>.
- Production: <what runs where, for whom>. Agents have no production access; deploying means the owner runs `<command>`.
- Unattended jobs: <what runs alone> and where its failure shows up.

## How we will verify
Cheapest honest check first (a smoke test or spike: <what>). Automated tests cover <core rules>. By hand: <what only eyes can judge>. Evidence goes in the change description.
~~~~

## DECISIONS.md

~~~~markdown
# Decisions
Append-only, newest last. Never edit an accepted entry; add a new one that supersedes it.
Write an entry when the choice is costly to reverse, or when a future reader would ask "why is it like this?".

## D-001 <short title> - <YYYY-MM-DD> - Accepted
Context: <the forces and constraints, in 1-3 plain sentences>
Decision: We will <...>.
Rejected: <option> - <why not>; <option> - <why not>
Consequences: <what gets easier, and what gets harder>
Source: <assumed | from <supplied file> | spike result: <one line> | ruling made during the build>
~~~~

Statuses: proposed, accepted, deprecated, or superseded by D-nnn. Numbers are sequential and never reused. Not every choice needs an entry. For a decision you made during the build without asking, Consequences also say what it costs if wrong.

## ROADMAP.md (also the session handoff)

~~~~markdown
# Roadmap
Last updated: <YYYY-MM-DD> by <human | agent>

## Where we left off
- Works, and how I checked: <...>
- Broken or unverified: <...>
- Next exact step: <one action>

## Now
- [ ] <the thing in progress>
## Next
- [ ] <...>
## Later / ideas
- <...>
## Open questions for the owner
- <...>
~~~~

Keep it to one page. If several agents or people write to it at once, expect merge conflicts and keep branches short.

## README.md

One sentence on what it is, its status, and the owner. Then: **Run it** (3-5 lines that work from a clean clone); **Check it** (the test command, and where automated checks run, if anywhere); **Where things are** (one line each for `docs/PRD.md`, `docs/ARCHITECTURE.md`, `DECISIONS.md`, `ROADMAP.md`, `docs/runbooks/`); **Secrets** (copy `.env.example` to `.env`; real values live in a password manager or secret store, never in git).
