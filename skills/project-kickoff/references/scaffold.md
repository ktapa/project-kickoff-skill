# Set up the repo (step 5)

Creating a remote or changing settings on a code host affects other people: ask the owner first. If the repo or team already has checks or a review process, use theirs and skip what it covers.

## Order

1. `git init` with a `main` branch. Write `.gitignore` and `.env.example` before the first commit.
2. Write the documents and the rules file.
3. Make one command run the project's build, tests and lint, and put it in AGENTS.md "Commands".
4. Only if the trigger holds (someone else will run, use, or contribute; or it will live more than about a month): add the automated checks, dependency alerts, secret scanning, and `main` protection below.
5. **Fresh-clone check.** Clone into a scratch directory, follow only the README, and run the tests. Fix the README until it passes. This is the successor test made mechanical.
6. Tell the owner what was set up, which protections are on, and which need a click on a settings page.

## Always

`.gitignore`:

~~~~gitignore
.env
.env.*
!.env.example
*.pem
*.key
secrets/
CLAUDE.local.md
.claude/settings.local.json
~~~~

`.env.example` holds names only, never values.

If a secret leaks, revoke and rotate it at once; rewriting history is often unnecessary once it is revoked.

## When the trigger holds

- **Secret scanning.** On GitHub, turn on secret scanning and push protection where the plan allows (free for public repositories; private ones need a paid plan). Otherwise run a local scanner in a pre-commit hook and in the checks. Check which applies before promising it.
- **Automated checks** on every change and on `main`, running the same commands as AGENTS.md: a read-only token, versions pinned to a full commit hash, a 10-minute time limit. (On GitHub, that is a small Actions workflow; adapt for another host.)
- **Dependency alerts.** Enable them on the host and commit the lockfile. Check the host's current configuration reference before writing any config file.
- **Protect `main`** (a settings page, not a file): require a pull request and the passing check, and block force-pushes and deletion. On a solo repo don't require approvals, because the only author can't give one. Availability depends on the host plan; check first.
- **Claude Code only:** a committed `.claude/settings.json` limited to a deny and ask list turns two rules from advice into enforcement. Deny rules cover the tool's file reads, not a shell command, so keep real secrets out of the working directory too. Don't commit settings that redirect the tool (endpoints, keys).

~~~~json
{
  "permissions": {
    "deny": ["Read(./.env)", "Read(./secrets/**)"],
    "ask": ["Bash(git push *)"]
  }
}
~~~~

Drop the `ask` line once `main` protection is on. Codex's protection is its sandbox and approval settings; AGENTS.md rules are advice on top.

- **Backups** (the project holds data): `docs/runbooks/backup-restore.md` says what is backed up, where (a place the app's own credentials can't delete), how often, the restore steps, and the date and result of the last restore test, re-tested every quarter and after any storage change.

## Leave out (ceremony for a small project)

Git Flow or long-lived branches; coverage-percentage targets; end-to-end tests for everything; commit-message tooling, semantic releases, signed commits, changelogs; SBOMs and artifact signing; a formal definition-of-done artifact or story points; an architecture decision entry for every choice; skills, hooks or MCP servers up front; multi-agent setups at kickoff; a per-session handoff file or any command that pushes it to `main`.
