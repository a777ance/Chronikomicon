# CLAUDE.md

Briefing for Claude Code. This repo is the workspace for writing **Chronikon** — a short novel.

---

## Terminology

| Term | Meaning |
|------|---------|
| **Chronikomicon** / the repo | This repository. The tool. The forge. |
| **Chronikon** | The novel itself. The narrative. The work being produced. |

These are different things. Never confuse them.

---

## Session start protocol (every session)

At the start of every session, Claude must:

1. **Show progress** — state the current word count, % toward 40,000, days to Nov 30 2026, and words/day needed. The session-start hook provides this automatically in remote sessions; read the chapter files directly if needed.
2. **Ask one question** — "What do you want to work on today?" If the manuscript state makes the next task obvious (e.g. a chapter is clearly mid-scene), suggest it instead.
3. **Stop.** Wait for direction before doing anything else.

Keep the briefing to 3 lines. Do not pad it with options or suggestions beyond the one question. The user has ADHD — one clear prompt is enough. Overwhelming with choices is a failure mode.

**Minimum daily target: 220 words.** If the user says they only have a few minutes, the answer is always: write 220 words, then stop.

---

## What this repo is

Chronikomicon is a structured creative workspace. VS Code is the writing environment. Claude Code is the writing assistant and ghostwriter. The repo is the single source of truth — for all drafts, all versions, all theory, all reference material.

No Word documents. No separate backup folders. No numbered `.docx` files. Everything lives here.

```
chronikomicon/
├── principles/        ← theory-crafting: organizing frameworks, structural logics
├── manuscript/        ← the novel: chapter files and nothing else
├── reference/         ← source material: immutable once committed
├── workflow/          ← process docs: how we work (drafts, conventions)
└── .github/workflows/ ← build pipeline: renders manuscript into output formats
```

**The layers do not bleed into each other.** Theory belongs in `principles/`, not in chapter prose. Reference material is never edited after initial commit. The manuscript contains only the work.

---

## Layer table

| Layer | Directory | Mutable? | Purpose |
|-------|-----------|----------|---------|
| Theory | `principles/` | Yes — freely | Organizing frameworks, structural ideas, thematic lenses. |
| Manuscript | `manuscript/` | Yes — the work | Chapter files for Chronikon. The only authority. |
| Reference | `reference/scripture/` | **No** | KJV Bible (31,100 verses). Committed once. Sola Scriptura. |
| Reference | `reference/scripture/art/` | Additive only | Public domain artwork manifest. |
| Reference | `reference/soundtrack/` | Additive only | Music paired to chapters and scenes. |
| Workflow | `workflow/` | Yes | Process documentation. |

---

## Organizing principles (current)

| File | Name | Status | Core idea |
|------|------|--------|-----------|
| `principles/01-twelve-hour-clock.md` | The Twelve-Hour Clock | rough draft | 12 chapters = 12 clock positions. Circular, not linear. |

### Key concept: Dispensations

Each chapter (hour) is a **Dispensation** — a period governed by its own internal logic and felt duration. One Dispensation may be vast; another a single paragraph. The clock gives position; the Dispensation gives character. Duration is felt, not measured.

---

## Reference material rules

### Sola Scriptura

The scripture files in `reference/scripture/` are the Word of God. They are committed once and never modified. No commentary, annotation, or editorial addition is permitted.

`kjv.txt` is committed and sealed. **Do not modify it.**

Claude may read it freely for analysis, quotation, and thematic research. Claude may never propose edits to it.

### Artwork

`reference/scripture/art/manifest.md` lists public domain illustrations keyed to scripture. New entries may be added; existing entries are not altered.

### Soundtrack

`reference/soundtrack/manifest.md` maps music to chapters and scenes. Additive only.

---

## Draft & version control

See [`workflow/drafts.md`](./workflow/drafts.md) for the full system.

- **Commits** = granular save points. Commit often.
- **Tags** = named milestones (`draft-1`, `draft-2`, `final`).
- **Branches** = parallel experiments (`experiment/ch01-alt-opening`). Never delete.
- **DRAFTS.md** = living log of all tagged milestones.

---

## Deploy: building the manuscript

Push to `main` touching `manuscript/` → GitHub Actions builds PDF + epub + HTML.

Workflow: `.github/workflows/build.yml`. Download artifacts from the Actions tab.

Local build: `Ctrl+Shift+B` in VS Code (requires pandoc installed).

---

## Automation

| System | What it does | When it runs |
|--------|-------------|-------------|
| `session-start.sh` | Word count briefing + progress bar + nudge | Every Claude Code session start |
| `build.yml` | Renders manuscript → PDF + epub + HTML | On push to `manuscript/` |
| `wordcount.yml` | Word count progress bar in Actions summary | On push to `manuscript/chapters/` |
| `monthly-checkin.yml` | Opens a GitHub Issue with monthly progress | 1st of every month, 9am UTC |

To trigger the monthly check-in manually: Actions → Monthly Check-in → Run workflow.

---

## VS Code setup

Open `Chronikon.code-workspace` in VS Code (File → Open Workspace from File).
Install recommended extensions when prompted.

Key shortcuts:
- `Ctrl+K Z` — Zen Mode (hides everything, full focus on current file)
- `Ctrl+Shift+B` — Build manuscript (PDF)
- `Alt+Q` — Rewrap paragraph (Rewrap extension)

---

## Working with Claude

- **"Write this scene"** → manuscript layer
- **"Think about structure"** → principles layer
- **Never** ask Claude to modify `reference/scripture/kjv.txt`
- Quote scripture verbatim from the reference layer — never paraphrase
- The manuscript is the only authority. A principle the manuscript doesn't enact doesn't matter.

---

## Branch strategy

| Branch | Purpose |
|--------|---------|
| `main` | Clean, reviewed work. Build triggers here. |
| `claude/` | Claude Code working branches. Review diff before merging. |
| `experiment/` | Parallel experiments. Never delete. |
| `draft/` | Full-manuscript revision branches. |

---

## Verification

- Build Action passing? (Actions tab)
- `principles/README.md` index current?
- Chapter files named `manuscript/chapters/XX-title.md`?
- No edits to `reference/scripture/kjv.txt` since initial commit?

---

## Known issues / in progress

| Item | Status |
|------|--------|
| `reference/scripture/kjv.txt` | **Committed and sealed** (31,100 verses) |
| Chapter files | None yet — manuscript is empty |
| Second organizing principle | Not yet defined |
| Pandoc CSS/template for PDF | Using pandoc defaults — not yet styled |
| Switch remote to SSH | Run: `git remote set-url origin git@github.com:a777ance/Chronikomicon.git` |
