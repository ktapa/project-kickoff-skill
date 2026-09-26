---
name: project-kickoff
description: Turn a new idea for software, an automation, or infrastructure into a working start. Runs a fast brainstorm that converges on a one-page concept, writes the project documents (PRD, architecture, decisions, roadmap, rules file), then builds a first thin working slice. Use when someone has a new project idea or asks to start or set up a new project. Not for changes to an existing project.
user-invocable: true
---

# project-kickoff

Turn an idea into a project someone else could pick up: a fast brainstorm that converges, proper documents, then a first working slice. Ask as little as possible.

If you were started by conversation rather than the command, first confirm in one line that this is a new project, not a change to an existing one. If a brainstorming or planning skill is also installed, this one replaces it for kickoff; don't invoke it as well.

## How to work with the owner

- Plain language. Assume the owner may not be a developer: define a technical term in one clause the first time. They know their problem and users; the gap is vocabulary, not judgment.
- Recommend; don't hand over menus. For a decision that matters, say what changes for users, what it costs, and whether it is cheap or hard to undo. If the owner overrules you, it is settled.
- "I don't know" never blocks. Say what the question is really asking, pick the reversible default, say you picked it, log it as assumed, and move on.
- Push back, with a reason, on scope creep and on choices that will hurt later.

## Steps

1. **Start from what they have.** Use any notes, handoff, spec, or repo the owner supplies (the command's argument, or files you find) and skip what they settle; otherwise start from the idea as described. Say your mode aloud (idea or supplied material; spike needed or not) so the owner can override it. You may step up to a heavier mode if the work proves bigger, never down.
2. **Brainstorm and converge** (`references/brainstorm.md`). Restate the idea, propose angles to keep, change, or drop, and ask at most three questions in one message, each with your proposed answer. At most two rounds of reaction, then converge. Read `references/project-shapes.md` and pick the closest shape. If the project stores data, holds people's data, ingests content it didn't write, runs for others or unattended, or costs money, also read `references/risk-traps.md`.
3. **Checkpoint - the one mandatory stop.** Re-read the concept once for placeholders, contradictions, more than one first slice, and requirements that read two ways; fix inline, don't loop. Show it in plain language with its numbered decision list, and say what approval covers: setting up the repo and building the first slice locally on a branch, not creating a remote, pushing, deploying, or adding paid services, which you will ask about separately. The owner approves or corrects once; don't reopen it.
4. **Prove the risky part.** Only if the concept lists an unproven mechanism: spike it first (`references/first-slice.md`). Record what it taught.
5. **Write the documents and set up the repo.** `references/documents.md` says what each document holds, `references/templates.md` gives exact wording, `references/agents-md.md` builds the rules file, and `references/scaffold.md` sets up the repo. Write the whole set in one pass with no per-document sign-off, then run the fresh-clone check in `scaffold.md` and fix the gaps.
6. **Build the first slice** (`references/first-slice.md`), following the AGENTS.md you just wrote.
7. **Close out.** Report what works and the evidence you saw, remaining risks, and the next smallest slice; update "Where we left off" in the roadmap; print the hand-over prompts from `first-slice.md`.

## Always

- Existing material wins: link to it and update it; never duplicate it.
- Add only what the project needs: no database, login, UI, hosting, design system, or extra agents unless the concept calls for it.
- If the repo or team already has checks or a review process, use theirs. If not, the rules you write into AGENTS.md are the safety net.
- Ask before anything irreversible or shared: force-pushing, deleting data or branches, publishing, deploying, spending money.
- "Done" means you observed it working and can state what you saw. A green build proves only that the code is well-formed.
- No per-document or per-phase sign-off. Decide gaps and conflicts yourself and record each in DECISIONS.md as a ruling: what, why, what it costs if wrong. Stop for the owner only for a product choice, real cost, security or privacy exposure, possible data loss, or something expensive to undo.
- Stop planning as soon as a safe first slice is possible. Then build.
