# Risk traps to raise in the brainstorm (step 2)

Raise only the ones that apply. Each is cheap now and expensive to retrofit. The rules that end up in AGENTS.md are the blocks in `agents-md.md`; this file is what to surface while shaping the concept.

Triggers. Each "yes" adds a block to AGENTS.md and a line to the PRD's "Risks and blast radius":

- stores data worth keeping: Data
- holds real people's data: Users and personal data
- takes or spends money: Money
- runs for someone else, or unattended: Production
- reads content it didn't write: Ingesting outside content
- someone else will run or contribute, or it lives more than about a month: automated checks and repo protections (`scaffold.md`)

Two traps the blocks don't cover:

1. **Two kinds of writers.** If an automated process and a person can change the same data (an import job and a user editing the same record), name who owns which fields and enforce the boundary in the data layer (permissions, constraints, one gateway function), not by remembering to be careful. On platforms that auto-grant access to default roles, revoke by name; removing it from the public or default role alone can leave the hole open.
2. **Never-lost data.** If anything must be kept (history, past decisions, originals), design retention up front: archive or retire rather than delete, and never let an automated process modify originals in place. Retrofitting after deleting is impossible.
