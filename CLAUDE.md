# CLAUDE.md

## Terminology

| Term | Meaning |
|------|---------|
| **Chronikomicon** | The repo. The forge. The tool. |
| **Chronikon** | The novel. The narrative. The work. |

These are different things. Never confuse them.

---

## T-Minus Zoom Protocol

Every session follows a zoom sequence. Each level is a perimeter. Once compacted, that perimeter is **sealed** — do not re-read any files from a sealed level for the remainder of the session. The bubble shrinks. The quality increases. The lossy gist that remains after each compact is the creative substrate — use it.

| Level | Read | Action | Result |
|-------|------|--------|--------|
| **T-0** | [`README.md`](README.md) | → `/compact` | T-0 sealed. Full map lives in gist. |
| **T-1** | One file from [`context/t1-*.md`](context/) | → `/compact` | T-1 sealed. Topic gist added. |
| **T-2** | One tighter slice | → `/compact` | T-2 sealed. Scene/chapter gist added. |
| **T-N** | Zoom as deep as the work demands | → `/compact` each time | Each level seals on compact. |
| **WRITE** | **Repo closed.** No further reads. | Work in conversation only. | Journal bubble. Gist of all levels in working memory. |

The zoom can go infinitely deep (T-3, T-4, ...). Each level is finer focus. Each compact seals the level and contributes its gist to the shrinking bubble. **Stop zooming when you can write.**

### Rules
- Never re-read a file from a sealed level
- Never read `reference/scripture/kjv.txt` into context — it is 31,100 verses and will consume the window
- Follow every hyperlink within a slice before compacting that level
- Do not zoom deeper than necessary — if T-1 is enough to write, write

---

## Session start (every time)

1. Read [`README.md`](README.md) → `/compact` (T-0 sealed)
2. Ask exactly one question: **"What do you want to work on today?"**
3. Wait. Do not offer options or suggestions. One question. That is enough.

**The user has ADHD. One prompt. Not a menu.**

Then follow their answer to determine how deep to zoom before writing.

---

## Layer rules

| Layer | Path | Rule |
|-------|------|------|
| Mind map | `map/` | Theory only. Never bleeds into manuscript. |
| Manuscript | `manuscript/chapters/` | Writing only. One file at a time. |
| Reference | `reference/scripture/kjv.txt` | Never read into context. Never modified. |
| Artwork | `reference/scripture/art/` | Additive only. |
| Soundtrack | `reference/soundtrack/` | Additive only. |

---

## Hard rules

- 220 words minimum per writing session
- Quote scripture verbatim. Never paraphrase.
- Never delete experiment branches.
- `reference/scripture/kjv.txt` — never read, never edit, never annotate
- The manuscript is the only authority. A principle the manuscript doesn't enact doesn't matter.

---

## Branch strategy

| Branch | Purpose |
|--------|---------|
| `main` | Clean work. Build triggers here. |
| `claude/` | Working branches. Review diff before merging. |
| `experiment/` | Parallel experiments. Never delete. |
| `v1-archive` | Previous repo structure. Read-only reference. |
