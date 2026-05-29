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
| Theory | `principles/` | Yes — freely | Organizing frameworks, structural ideas, thematic lenses. Can be discarded, recycled, reconfigured at any time. |
| Manuscript | `manuscript/` | Yes — the work | Chapter files for Chronikon. The only authority. |
| Reference | `reference/scripture/` | **No** | Public domain Bible translations (KJV, ASV, WEB). Committed once. See Sola Scriptura below. |
| Reference | `reference/scripture/art/` | Additive only | Public domain artwork manifest. New entries may be added; existing entries are not altered. |
| Workflow | `workflow/` | Yes | Process documentation: draft system, conventions, how to work. |

---

## Organizing principles (current)

Principles are instruments for thinking about Chronikon. They are not rules. Any principle can be drawn on, held in tension with another, discarded, or reconfigured.

| File | Name | Status | Core idea |
|------|------|--------|----------|
| `principles/01-twelve-hour-clock.md` | The Twelve-Hour Clock | rough draft | 12 chapters = 12 clock positions. Structure is circular, not linear. |

### Key concept: Dispensations

Each chapter (hour) is a **Dispensation** — a period governed by its own internal logic and felt duration. One Dispensation may be vast; another a single paragraph. The clock gives position; the Dispensation gives character. Duration is felt, not measured.

---

## Reference material rules

### Sola Scriptura

The scripture files in `reference/scripture/` are the Word of God. They are committed once and never modified. No commentary, annotation, or editorial addition is permitted in those files.

To populate the scripture files:
```bash
cd reference/scripture
pip install requests
python download.py   # Windows: python download.py
```
Commit the resulting `kjv.txt`, `asv.txt`, `web.txt`. After that commit, do not touch them.

### Artwork

`reference/scripture/art/manifest.md` lists public domain illustrations keyed to scripture passages. New entries may be added. Existing entries are not altered.

---

## Draft & version control

See [`workflow/drafts.md`](./workflow/drafts.md) for the full system.

Short version:
- **Commits** = granular save points. Commit often.
- **Tags** = named milestones (`draft-1`, `draft-2`, `final`). Created when a full draft is complete.
- **Branches** = parallel experiments (`experiment/ch01-alt-opening`). Never delete old experiment branches.
- **DRAFTS.md** = living log of all tagged milestones.

---

## Deploy: building the manuscript

A push to `main` that touches `manuscript/` triggers a GitHub Actions build.

```
git push to main → Actions runner → pandoc → PDF + epub + HTML artifacts
```

Workflow: `.github/workflows/build.yml` — download artifacts from the Actions tab after any push.

Local build (requires pandoc):
```bash
# Default build task in VS Code: Ctrl+Shift+B
# Or manually:
mkdir -p build
pandoc manuscript/chapters/*.md -o build/chronikon.pdf
```

---

## VS Code setup

Open this repo in VS Code. When prompted, install recommended extensions (`.vscode/extensions.json`).

Key extensions:
- **Code Spell Checker** — spell check in the editor
- **Markdown All in One** — preview, shortcuts, TOC
- **WordCount** — live word count in the status bar
- **Rewrap** — reflow paragraphs with `Alt+Q`
- **GitLens** — inline blame and history
- **Claude Code** — the writing assistant

Build the manuscript from inside VS Code: `Ctrl+Shift+B` (PDF) or open the Command Palette → Tasks: Run Task.

---

## Working with Claude on this project

**Be specific about which layer you're working in.** "Write this scene" means manuscript. "Think about structure" means principles. These should never happen in the same breath.

**Do not ask Claude to modify reference material.** Scripture files are sealed. Claude reads them freely for analysis and quotation — never proposes edits.

**Principles are living documents.** Claude can propose new principles, amend existing ones, or mark them discarded. Always in `principles/` — never inline in chapters.

**Quote scripture; don't paraphrase it.** When scripture appears in the manuscript, it is quoted verbatim from the reference layer.

**The manuscript is the only authority.** A principle the manuscript doesn't enact doesn't matter. The manuscript wins.

---

## Branch strategy

| Branch | Purpose |
|--------|---------|
| `main` | Clean, reviewed work only. Build triggers here. |
| `claude/` | Claude Code working branches. Review diff before merging. |
| `experiment/` | Trying something that might not work. Never delete. |
| `draft/` | Full-manuscript revision branch for major rewrites. |

Merge to `main` with a squash commit. Keep all experiment branches.

---

## Verification

After any manuscript change:
- Does the build Action pass? (Actions tab)
- Does the rendered PDF look correct? (download artifact)
- Are chapter files named `manuscript/chapters/XX-title.md`?

After any principles change:
- Is `principles/README.md` index table up to date?
- Is the principle's status current?

---

## Known issues / in progress

| Item | Status |
|------|--------|
| Scripture files (`kjv.txt`, `asv.txt`, `web.txt`) | Not yet committed — run `download.py` locally |
| Chapter files | None yet — manuscript is empty |
| Second organizing principle | Not yet defined |
| Pandoc CSS/template for PDF | Using pandoc defaults — styling not yet designed |
