# Brainstorm and converge (step 2)

Goal: from a raw idea to a concept the owner can approve in about three exchanges. Propose and let them react; don't interview.

## The loop

1. **Capture.** The idea in the owner's words. If already said, don't ask again.
2. **Play back and open it up, in one message.**
   - Restate it in two sentences: "You want X, for Y, so they can Z." If it is several independent subsystems, say so, pick the one to build first, and give each later piece its own concept.
   - Propose, for the owner to keep, change, or drop: the smallest version that would already help; two or three things they may not have thought of (a user, a feature, a pitfall); one thing to leave out of v1; what already exists and how this differs (say so if unsure); the riskiest assumption and a cheap way to test it.
   - Ask at most three questions, each with your proposed answer so "ok" works. On a blank start: the user and outcome; what the first useful result must show; hard constraints (work or personal, deadline, sensitive data, tools that must or must not be used).
3. **Converge.** Fold in their reactions. If a real fork remains, give a recommendation, what it costs, and how hard it is to undo. At most two rounds of reaction, then stop: whatever is unresolved becomes a marked assumption or an open risk.
4. **Write the concept**, one page: what it is, who for, the problem today; 3-5 outcomes a user can observe, and what is not in v1; what it stores, who or what changes each thing, what must never be lost; how failure shows, and anything sensitive or ingested that we didn't write; shape and recommended tools with a one-line reason each, and cost and reversibility for the two or three choices that matter (optimize for speed of development, simplicity at this team size, low cost that survives the next step, long-term maintainability; prefer what the owner already uses); the first slice and what will be observed; the riskiest assumption; and numbered decisions, `D-001 - decision - why - rejected alternatives`, marking `(default)` on any made by assumption and `(from <source>)` on any carried in.

## Lenses

Shape proposals with these, not questions: the user and their pain; the smallest helpful version; what exists already; what it stores and who changes it; what must never be lost; how failure shows; sensitive or untrusted data; cost and account ownership; what is out of scope.

## Default assumptions (state them; the owner overrides)

Personal or small-team scale; no deadline; free or low-cost tools; nothing deleted without the owner's say; every unattended job reports failure somewhere the owner reads; no visual design unless there is a screen; the owner runs it and reads error messages with your help. Ask instead of assuming when the project is for a company or the public, holds money or sensitive personal data, or commits ongoing cost.

## Keep it fast

Anything not needed for the first slice goes to "Later". "I don't know" is an answer: pick the reversible default and say so. If supplied material settles a topic, carry its decisions in as `(from <source>)` and raise only contradictions, missing acceptance checks, and safety gaps.
