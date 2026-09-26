# Spike and first slice (steps 4 and 6)

## Spike

If any mechanism is unproven (a model that may not be accurate enough, an API not yet touched, hardware, a network path), build the thinnest end-to-end version of just that first. It may be throwaway; don't keep it unless it becomes the seed of the slice. Before you start, write down what result means keep, change, or drop the approach. Run it on real or representative samples, not one happy case. Record what it taught in DECISIONS.md.

## Build vertically

Build the smallest path that crosses every real boundary once (input, processing, stored result, visible output). Add a database, login, deployment, or shared component library only when this slice needs it. Do feasibility risk first; leave UI polish and breadth for last. Write the slice's acceptance check before you build it. Keep the plan to decisions the builder can't make alone (files, names, the tests with their expected values, the command that proves each step); a plan several times longer than the concept has become a transcript of the code. Then follow the AGENTS.md you wrote: branch, small changes, tests in the same change, and observe the real thing working before calling it done.

## Finish

Before you say anything works, name the command that proves it, run it fresh, read the whole output and exit code, and state the claim with that evidence. Report what works and the evidence, remaining risks, and the next smallest slice. Update only the documents the work made inaccurate, record any new consequential decision and why, and refresh "Where we left off".

## Hand over

Print these prompts for the owner to reuse.

~~~~text
Review (fresh session or a different model; give it only the diff range and the PRD, not your chat history):
  "Review `git diff <base>..<head>` against docs/PRD.md. Read-only: change nothing. Report only gaps that affect correctness or the stated requirements: every requirement implemented, listed edge cases tested, nothing outside scope changed, no tests weakened. Where the PRD is silent, judge by what a reasonable user would expect. Grade each finding Critical, Important or Minor. Then list anything you set aside as out of scope, one line each with the reason. Skip style."
Red/green:
  "Write the failing test first and show it failing. Then make it pass. Do not change the test to make it pass."
Bug:
  "Users see <symptom> in <place>. Write a failing test that reproduces it, then fix the root cause, not the symptom."
Task prompt shape:
  Goal: <what to change>. Context: <files, docs, errors>. Constraints: <standards, safety>. Done when: <observable result>.
~~~~
