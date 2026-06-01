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

## The DIFF Command

At any point in a session — including deep inside write mode — the user may request a DIFF.

### What DIFF does

1. **Full repo read — no zoom restrictions, no limitations.** Read whatever files are necessary to establish ground truth. This temporarily suspends the write-mode lockout.
2. **Compare against the current session bubble.** The bubble is the accumulated gist from all prior compacts — lossy, intentionally distorted, possibly drifted.
3. **Report hard discrepancies only.** A hard discrepancy is a factual contradiction between the bubble and the repo:
   - Bubble says chapter is unwritten / repo file has content
   - Bubble says deadline is December / README says November 30
   - Bubble has a character as unnamed / map file has a name
   - **Not** a discrepancy: tone differences, creative interpretation, emphasis shifts — those are intentional lossy artifacts, ignore them

### DIFF output format

```
DIFF — [date / session context]

[1] Bubble: ch01 is unwritten
    Repo:   manuscript/chapters/ch01.md exists, 800 words
    → Vote: original / bubble

[2] Bubble: deadline is December
    Repo:   README.md — "November 30, 2026"
    → Vote: original / bubble

[3] (no further discrepancies)
```

Only list actual contradictions. If the bubble and repo agree on a fact, do not list it.

### The vote

For each discrepancy, the user chooses:

- **Vote original** → the repo is right. Correct the session bubble in-conversation. No file write. Session continues with accurate gist.
- **Vote bubble** → the bubble is right. The repo is behind. Claude proposes the specific file edit needed to bring the repo in line with the bubble. User approves before any write occurs.

### After DIFF

DIFF does not compact. DIFF does not seal any zoom level. Once votes are collected and applied, the journal bubble resumes exactly where it left off — now corrected or with repo updates queued.

DIFF can be called multiple times in a session. There is no limit.

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
