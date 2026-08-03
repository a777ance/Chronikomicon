# .claude — synced harness (from localDNS)

This directory is the shared A777ance Claude Code harness, replicated from the
reference repo **localDNS**. It is repo-agnostic except for two tuned spots — the
briefing **manifest** and the next-actions **queue** — set near the top of the hook
scripts.

## Hooks (`.claude/settings.json`)

- **SessionStart → `hooks/refeed.sh`** — on a fresh start or `/clear`, fetches and
  (guarded) fast-forwards the latest **seed** onto disk, then injects the standing
  context **lazy-anchor-first**: the session opens by acting on the top queue item,
  loading the rest of the seed as the work demands it (queue-less repos lead with
  "load, then wait"). The hook file keeps its `refeed.sh` name.
- **Stop → `hooks/momentum.sh`** — OFF by default. `touch .claude/.momentum-on`
  arms a guarded, self-disarming auto-continue burst; `rm` it to stop. Hard-capped,
  stops on no-progress, and tells the agent to disarm itself the moment it's
  blocked — it cannot run away.

## Commands (`.claude/commands/`)

- **/reseed** — pull the latest seed (`git pull --ff-only`) then regenerate the
  briefing from it, mid-session, no clear.
- **/refresh** — front-door refresh: ask keep-history vs. clear, then pull+reseed.
- **/cardio**, **/workout** — keyless in-harness self-consistency jury: empanel the
  `juror` subagent several times over and take a plurality. No API key, no spend.

## Agent (`.claude/agents/juror.md`)

- **juror** — one independent juror for the jury commands above.

The statistical, tool-backed jury (`/form`, `/diet`, `/strength`, backed by
`jury_claude.py`) is product infrastructure and lives only in **localDNS** under
`04-user-services/ai-orchestration/jury-claude/`.

The momentum arm/state files (`.claude/.momentum-on`, `.claude/.momentum-state`)
are per-session and git-ignored.
