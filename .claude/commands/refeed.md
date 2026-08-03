---
description: Lossless refeed — reload the latest on-disk briefing and this repo's canonical manifest after a /clear
allowed-tools: Bash(git fetch:*), Bash(git log:*), Bash(git status:*), Read
---

You have just been cleared. Re-establish the working briefing **from disk** so this
session is running on the *latest* docs, not a stale in-context copy. Do this fast
and losslessly — read the whole manifest, drop nothing, add nothing.

## 1. Prove you have the latest

Run these (read-only — never merge or check out here):

```bash
git fetch origin --quiet 2>/dev/null || true
git log -1 --format='local  %h  %ci  %s' -- README.md
git log -1 --format='remote %h  %ci  %s' origin/HEAD -- README.md 2>/dev/null || true
git status --short -- README.md
```

If the **remote** copy is newer than **local**, stop and tell me — the on-disk copy
is behind and needs `git pull --ff-only` before the refeed means anything. If they
match (or there's no remote), the working tree is the latest — continue.

## 2. Read the lossless manifest (in one batch)

Read all of these from the working tree, in parallel:

1. `README.md` — the repo's architecture + working model (no `CLAUDE.md`; fractal shadow / bracket-toggle system).

These **are** the lossless set for this repo. Anything else is pulled on demand,
not part of the standing briefing.

## 3. Confirm ready — one line

Report exactly: the `README.md` revision you loaded (`<short-hash> <date>`), that
every manifest file was read, and any drift you noticed between them. Then stop and
wait for work. Do not summarize the manifest back to me — just confirm the feed is
fresh.
