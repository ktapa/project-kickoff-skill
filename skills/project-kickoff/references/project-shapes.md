# Project shapes (step 2)

Pick the closest shape and say so; it sets what "first slice", "done evidence", and "docs" mean. If none fits, say what you're adapting.

## App with screens and stored data

- First slice: one real screen that creates and reads back one real record.
- Done evidence: the record, seen in the stored data, not just on screen.
- Docs: ARCHITECTURE covers data and screens; split out a data model if it grows. The Data and Users blocks usually apply.

## Pipeline, bot, or integration (runs on events or a schedule; calls models or outside services)

- First check: quality on about 20 real samples before building anything around it. If the model or API isn't good enough, that changes the design.
- First slice: one real input through the whole path to one visible result, plus the failure path (what happens when a step errors or returns nothing).
- Done evidence: the actual outputs on real inputs.
- Docs: ARCHITECTURE for inputs, outputs, and who owns what; a runbook for re-running and recovering. The Data, Production, and Ingesting outside content blocks usually apply, plus the two-writers and never-lost traps.

## Infrastructure, server, or home lab (machines, disks, network, containers, backups)

- No schema, login, or UI to design. Configuration lives in files in the repo so the setup can be rebuilt; secrets never do.
- First slice: one service reachable the intended way, configured from the repo, with one backup taken and one restore observed.
- Done evidence: command output and the restore result.
- Docs: runbooks first (rebuild from scratch, restore, routine upkeep). Change one thing at a time, with a way to roll back. The Data and Production blocks usually apply.

## Command-line tool or library

- First slice: one command, end to end, on real input.
- Done evidence: the actual output.
- Docs: README usage. Skip the traps unless it reads untrusted input or stores data.
