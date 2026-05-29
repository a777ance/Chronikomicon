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
|------|------|--------|----------|
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
