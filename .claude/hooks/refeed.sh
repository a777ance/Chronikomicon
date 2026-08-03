#!/usr/bin/env bash
# SessionStart hook — the end-to-end clear-&-reseed ritual, automatic.
#
# Synced across the A777ance repos from localDNS (the reference harness). Fires
# when a session starts fresh (source=startup) or is cleared (source=clear) and
# does the two halves the model can't guarantee on its own:
#   1. SYNC   — git fetch, then a guarded fast-forward pull, so the on-disk seed
#               is the latest before anything reads it.
#   2. RESEED — inject the standing context, LAZY ANCHOR FIRST: the very first
#               thing a fresh session reads is the cheap-reflex "do the top queue
#               item NOW" instruction, not a read-everything preamble. The
#               lossless seed load is demoted to "as the work demands it" so it
#               can't anchor the trajectory into an effortful research phase.
#               (Repos with no standing queue lead with "load, then wait.")
#
# The session opens by ACTING on the pre-computed queue (lazy anchor), loading
# the rest of the seed as it goes. On resume/compact it stays out of the way
# (no pull, no re-inject) so in-progress work isn't disturbed.
set -uo pipefail

# --- per-repo config (the ONLY lines that differ between repos) -------------
# MANIFEST ("the seed"): this repo's lossless standing-briefing set,
# space-separated, in read order (CLAUDE.md excluded — Claude Code reloads it).
MANIFEST="README.md"
# QUEUE: where this repo's "default next actions" live (the lazy anchor's first
# move). Empty = no standing queue; the session loads the briefing then waits.
QUEUE=""
# ---------------------------------------------------------------------------

payload="$(cat)"
# source is one of: startup | resume | clear | compact
src="$(printf '%s' "$payload" | sed -n 's/.*"source"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')"
[ -z "$src" ] && src="startup"

case "$src" in
  startup|clear) : ;;
  *) exit 0 ;;
esac

cd "${CLAUDE_PROJECT_DIR:-.}" 2>/dev/null || exit 0
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0

# --- 1. SYNC ---------------------------------------------------------------
sync_note="sync: no upstream tracked"
git fetch origin --quiet 2>/dev/null || true
upstream="$(git rev-parse --abbrev-ref --symbolic-full-name '@{u}' 2>/dev/null || true)"
if [ -n "$upstream" ]; then
  L="$(git rev-parse @ 2>/dev/null)"
  R="$(git rev-parse '@{u}' 2>/dev/null)"
  B="$(git merge-base @ '@{u}' 2>/dev/null)"
  if [ "$L" = "$R" ]; then
    sync_note="sync: up to date with $upstream"
  elif [ "$L" = "$B" ]; then                       # behind, fast-forwardable
    if [ -z "$(git status --porcelain)" ] && git pull --ff-only --quiet 2>/dev/null; then
      sync_note="sync: fast-forwarded to $upstream"
    else
      sync_note="sync: BEHIND $upstream (dirty tree or non-ff) — run 'git pull --ff-only' before trusting this seed"
    fi
  elif [ "$R" = "$B" ]; then
    sync_note="sync: local is AHEAD of $upstream (unpushed commits) — on-disk is latest"
  else
    sync_note="sync: DIVERGED from $upstream — reconcile manually"
  fi
fi

# --- 2. RESEED — LAZY ANCHOR FIRST, then the seed (CLAUDE.md reloads itself) --
if [ -f CLAUDE.md ]; then
  rev="$(git log -1 --format='%h %ci' -- CLAUDE.md 2>/dev/null || echo unknown)"
  seed_note="With the on-disk CLAUDE.md @ $rev (already loaded by Claude Code) plus these, the briefing is complete."
else
  seed_note="This repo has no CLAUDE.md — README.md leads the seed."
fi

if [ -n "$QUEUE" ]; then
  read -r -d '' ctx <<EOF || true
LAZY ANCHOR (low reasoning) — FIRE THIS FIRST, before anything else. Reasoning effort stays low; the first move is a cheap, honest reflex, not an effortful pre-committed plan. Do the top unblocked item in $QUEUE: read that short block and DO IT NOW. Don't re-derive the queue, don't stall asking "what next?", and don't open with a big read-everything phase — that effortful preamble is exactly the anchor to avoid. Bias to action over narrating options. Keep momentum: the moment an item ships as a coherent, verified, pushed change, tick it, promote the next unblocked item, and start it in the same turn — chain, don't yield. Cheap reflex, brakes ON — not a licence to bulldoze: the founder naming a priority always wins, and anything irreversible or outward-facing (deletes, force-pushes, external sends, real customer data) still gets a confirm first.

Then, as the work demands it (NOT as a blocking preamble), keep the session LOSSLESS by loading the rest of the standing seed: $MANIFEST. $seed_note Don't summarize them back — just load and continue.

RESEED status (auto, source=$src): $sync_note.
EOF
else
  read -r -d '' ctx <<EOF || true
RESEED (auto, source=$src). $sync_note. $seed_note To stay LOSSLESS, load the standing seed as the work demands it (not as a blocking preamble): $MANIFEST. Don't summarize them back — just load and continue. This repo has no standing action queue: load the briefing, then wait for the founder to name the work — don't invent a backlog. Brakes ON: anything irreversible or outward-facing (deletes, force-pushes, external sends, real customer data) still gets a confirm first.
EOF
fi

# Emit as SessionStart additionalContext (JSON-escape the string).
esc="$(printf '%s' "$ctx" | python3 -c 'import json,sys; print(json.dumps(sys.stdin.read()))' 2>/dev/null)"
if [ -n "$esc" ]; then
  printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":%s}}\n' "$esc"
else
  printf '%s\n' "$ctx"
fi
exit 0
