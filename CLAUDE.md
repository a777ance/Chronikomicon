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

Chronikomicon is a structured creative workspace. It holds three strictly separate layers:

```
chronikomicon/
├── principles/        ← theory-crafting: organizing frameworks, structural logics
├── manuscript/        ← the novel: chapter files and nothing else
├── reference/         ← source material: immutable once committed
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

The scripture files in `reference/scripture/` are the Word of God. They are committed once and never modified. No commentary, annotation, or editorial addition is permitted in those files. This is not a convention — it is the rule.

To populate the scripture files:
```bash
cd reference/scripture
pip install requests
python download.py   # Windows: python download.py
```
Commit the resulting `kjv.txt`, `asv.txt`, `web.txt`. After that commit, do not touch them.

### Artwork

`reference/scripture/art/manifest.md` lists public domain illustrations (Doré, Rembrandt, Caravaggio, Blake, etc.) keyed to scripture passages. New entries may be added. Existing entries are not altered.

---

## Deploy: building the manuscript

A push to `main` that touches `manuscript/` triggers a GitHub Actions build.

```
git push to main → Actions runner → pandoc → PDF + epub artifacts
```

| Input | Output | Tool |
|-------|--------|------|
| `manuscript/chapters/*.md` | `build/chronikon.pdf` | pandoc |
| `manuscript/chapters/*.md` | `build/chronikon.epub` | pandoc |
| `manuscript/chapters/*.md` | `build/chronikon.html` | pandoc |

Workflow file: `.github/workflows/build.yml`

Built artifacts are uploaded to the GitHub Actions run as downloadable files. No server, no SSH — the output lives in the Actions tab until downloaded or a release is cut.

### Checking the build

After a push to `main`:
1. Go to the repo → Actions tab
2. Open the most recent "Build Manuscript" run
3. Download the artifact zip to review the rendered output

### Local build (optional)

Requires `pandoc` installed locally:
```bash
# Windows (winget)
winget install --id JohnMacFarlane.Pandoc

# Linux / WSL
sudo apt install pandoc
```

Then:
```bash
mkdir -p build
pandoc manuscript/chapters/*.md -o build/chronikon.pdf
```

---

## Working with Claude on this project

**Be specific about which layer you're working in.** "Write this scene" means manuscript. "Think about structure" means principles. These should never happen in the same breath.

**Do not ask Claude to modify reference material.** The scripture files are sealed. Claude should read them freely for analysis and quotation — never propose edits.

**Principles are living documents.** Claude can propose new principles, amend existing ones, or mark them as discarded. Always in `principles/` — never inline in chapters.

**Quote scripture; don't paraphrase it.** When scripture appears in the manuscript, it is quoted verbatim from the reference layer — not rewritten or approximated.

**The manuscript is the only authority.** A principle that the manuscript doesn't enact doesn't matter. The manuscript wins.

---

## Branch strategy

| Branch | Purpose |
|--------|---------|
| `main` | Clean, reviewed work only. Build triggers here. |
| `claude/...` | Claude Code working branches. Review diff before merging. |
| `draft/...` | Human working branches for manuscript drafts. |

Merge to `main` with a squash commit. Delete working branches after merge.

---

## Verification

After any manuscript change:
- Does the build Action pass? (Actions tab)
- Does the rendered PDF look correct? (download artifact)
- Are chapter files named consistently? (`manuscript/chapters/XX-title.md`)

After any principles change:
- Is the principles index table in `principles/README.md` up to date?
- Is the principle marked with its current status (rough draft / active / discarded)?

---

## Known issues / in progress

| Item | Status |
|------|--------|
| Scripture files (`kjv.txt`, `asv.txt`, `web.txt`) | Not yet committed — run `download.py` locally |
| Chapter files | None yet — manuscript is empty |
| Second organizing principle | Not yet defined |
| Pandoc CSS/template for PDF | Using pandoc defaults — styling not yet designed |
