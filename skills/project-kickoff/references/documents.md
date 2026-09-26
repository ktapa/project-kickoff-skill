# Documents (step 5)

Write the whole set in one pass, from the approved concept and whatever the spike taught. Apply one test to each: could a stranger, or a fresh agent session with no memory of this conversation, make the right call from it alone? If a section wouldn't change what someone does, delete it. A few fresh documents beat many stale ones: update docs in the same change as the code, and delete dead ones. Skip anything that already exists and is accurate; keep supplied notes or a handoff unchanged under `docs/`, linked rather than rewritten. Exact wording is in `templates.md`.

## Core set (every project)

- **README.md** - what it is, the exact command to run or use it (run it to confirm it works), how to check it, where things are.
- **docs/PRD.md** - the product requirements, in plain language, one to two pages: the problem in the users' terms; who it is for; goals and how we will know it worked; the core outcomes; features by priority (must, should, later); what is out of scope for v1; assumptions and open risks. Add the sections in `templates.md`: "Done means", "Constraints", "Risks and blast radius", "How we will verify".
- **docs/ARCHITECTURE.md** - the technical foundation: shape and stack with the reason for each and what was rejected; how the parts fit; what it stores and who or what changes each thing (enough of a data model to build from); how it is run and how failure shows; security and privacy boundaries; costs; where accounts, secrets, and setup live so someone else could rebuild it.
- **DECISIONS.md** - seeded from the concept's decision list. The rejected alternatives are the most valuable part. Write a new consequential decision here before building it. Append corrections and supersede old entries; never edit history away.
- **ROADMAP.md** - "Where we left off" first, then Now / Next / Later. Update it at the end of every work session and in the same commit that finishes or reorders an item. When a decision closes or supersedes an item, reconcile it in the same commit.
- **AGENTS.md** - the single rules file for every AI tool, built from `agents-md.md`; **CLAUDE.md** contains only `@AGENTS.md`. Confirm the tool loaded it (in Claude Code, run `/context`).

## Add when the concept needs it

- **docs/DATA_MODEL.md** - split out of ARCHITECTURE when there are more than a handful of stored things: every object, field, type, owner, allowed values.
- **docs/DESIGN.md** - when there is a screen: look and feel, type, colour tokens, spacing, components, accessibility.
- **docs/runbooks/** - short plain-English steps for anything the owner must repeat without you (restore a backup, add an item, cut a release).
- A registry doc, if configuration would otherwise be hardcoded across many files; a policy doc, if a non-programmer will want to change rules without touching code.

## Don't create

A second rules file, per-session handoff files or commands, or documents for layers the project doesn't have.
