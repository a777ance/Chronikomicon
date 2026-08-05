# CLAUDE.md

Briefing for Claude Code. Read this first; [README.md](README.md) holds this repo's full
content. This file carries the portfolio-wide A777ance conventions (below); repo-specific
detail lives in the README.

---

## House style: ordering & typography

These conventions apply across **every** A777ance repo — current and future. (Adopted 2026-06-05.)

- **Time-based content reads newest-first (reverse-chronological).** Logs, changelogs,
  decision logs (ADR / FIN), known-issues and issue trackers, FAQs, metrics and review
  logs, and "Handled For You" entries all lead with the most recent item. Apply this
  within the time-based *section* even when the whole file isn't time-based.
- **Alphabetical lists run Z → A** (descending).
- **Walkthroughs: reverse the blocks, keep the steps.** In a step-by-step guide, present
  the major sections/blocks in reverse order (last block first — it helps "block" the
  work), but keep the numbered steps *within* each block in forward order so every
  procedure stays followable. A walkthrough's table of contents mirrors the reversed
  block order. **Never renumber** — step and stage numbers stay fixed, so the intended
  execution order is always readable from the numbers.
- **Font: Gill Sans MT everywhere.** Every surface — customer-facing or internal — uses
  Gill Sans MT. Web/CSS stack:
  `'Gill Sans MT', 'Gill Sans', Calibri, 'Trebuchet MS', sans-serif`.
- **Design surfaces inherit all of the above.** The look itself — tokens, the Statement
  components, and the rules for working on them — lives in `localDNS/design-system/`, and is
  mirrored into **Claude Design** (claude.ai/design) by `/design-sync`. Take a color or a size
  from `tokens.css`; never invent one or sample it off a screenshot. Newest-first is a
  *component behavior* too: a log that renders oldest-first is a bug, not a preference.

---

## Bifrost — active command schema (loads every session)

**Bifrost** is the A777ance command-composition schema — a keyboard-spatial notation
(`~ ! @ # $ % ^ & * ()` swept left→right, each glyph an *archetype* fulfilled by slash
commands + a plain-language sub-prompt). It is **active from the first token of every
session, in every repo:** adopt the `~` lazy-anchor posture — fire the first token ASAP
(the *model* stays high), let continuity coalesce mid-flight — and read Bifrost notation
per the schema whenever used. Guardrails that survive a keyboard-mash: `~` continuity,
`$` sanity, `%` compliance. Canonical spec —
markdown: <https://github.com/a777ance/localDNS/blob/main/04-user-services/ai-orchestration/highway-notation.md>
· rendered page: <https://a777ance.github.io/localDNS/bifrost.html>
