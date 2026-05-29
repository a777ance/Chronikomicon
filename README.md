# Chronikomicon

The repository for **Chronikon** — a short novel.

**Chronikomicon** is the forge. **Chronikon** is what gets made in it. These are different things.

---

## Repo map

```
chronikomicon/
├── manuscript/                  ← the novel — chapters and nothing else
│   ├── chapters/                ← chapter files: XX-title.md
│   │   └── TEMPLATE.md          ← copy this to start a new chapter
│   ├── metadata.yaml            ← pandoc book metadata (title, author, date)
│   └── styles/chronikon.css     ← PDF/HTML typography
│
├── principles/                  ← theory: structural and thematic frameworks
│   └── 01-twelve-hour-clock.md  ← The Twelve-Hour Clock (rough draft)
│
├── reference/                   ← immutable source material
│   ├── scripture/
│   │   ├── kjv.txt              ← King James Bible, 31,100 verses — DO NOT MODIFY
│   │   └── art/manifest.md      ← public domain artwork keyed to scripture
│   └── soundtrack/
│       └── manifest.md          ← music paired to chapters and scenes
│
├── mindmap/                     ← worldbuilding incubator: loose, hyperlinked, generative
│   ├── hub.md                   ← central index / navigation
│   ├── clock.md
│   ├── characters.md
│   ├── worldbuilding.md
│   ├── themes.md
│   └── scene-seeds.md
│
├── workflow/                    ← process documentation
│   ├── drafts.md                ← version control and milestone system
│   ├── layers.md                ← layer structure guide
│   ├── goals.md                 ← 6-month timeline and session protocol
│   └── story-outline.md        ← narrative outline
│
├── PROGRESS.md                  ← running word count log
├── DRAFTS.md                    ← log of all tagged milestones
├── CLAUDE.md                    ← briefing for Claude Code (do not delete)
└── README.md                    ← this file
```

---

## Writing workflow

### Starting a session

1. Open VS Code — `Chronikon.code-workspace`
2. `Ctrl+Shift+E` — go to Explorer
3. Open your chapter from the **Manuscript** section
4. `Ctrl+K Z` — Zen Mode on
5. Check `reference/soundtrack/manifest.md` for the chapter's music — put it on
6. Write

### Ending a session

1. `Esc Esc` — exit Zen Mode
2. Check word count in the status bar
3. Update `PROGRESS.md`
4. Open terminal `` Ctrl+` `` and commit:

```powershell
git add manuscript/chapters/
git add PROGRESS.md
git commit -m "ch01: what you wrote today"
git push
```

---

## Key shortcuts

| Shortcut | What it does |
|----------|--------------|
| `Ctrl+K Z` | Zen Mode — full screen focus |
| `Esc Esc` | Exit Zen Mode |
| `Ctrl+Shift+E` | Explorer |
| `Ctrl+Shift+V` | Markdown preview |
| `Ctrl+Shift+B` | Build manuscript (PDF) |
| `Alt+Q` | Rewrap paragraph |
| `` Ctrl+` `` | Open terminal |

---

## Starting a new chapter

1. Copy `manuscript/chapters/TEMPLATE.md`
2. Rename it: `01-title.md`, `02-title.md`, etc.
3. Delete the comment block at the top
4. Write the first sentence

Start with whichever hour feels most alive — not necessarily Hour 1. The clock is circular. The novel can be assembled in any order.

---

## Deploy

Push to `main` touching `manuscript/` → GitHub Actions builds PDF + epub + HTML automatically.

**Download the result:** repo → Actions tab → latest run → Artifacts → `chronikon-manuscript`

**Build locally** (requires pandoc):

```powershell
winget install JohnMacFarlane.Pandoc
```

Then `Ctrl+Shift+B` in VS Code.

---

## Active principles

| File | Name | Status | Core idea |
|------|------|--------|-----------|
| [01-twelve-hour-clock.md](principles/01-twelve-hour-clock.md) | The Twelve-Hour Clock | rough draft | 12 chapters = 12 clock positions. Circular, not linear. Each chapter is a Dispensation with its own felt duration. |

---

## Reference material

**Scripture** — `reference/scripture/kjv.txt` is the Word of God. Committed once, never modified. 31,100 verses, KJV 1611. Claude may read and quote it freely. No one may edit it.

**Artwork** — `reference/scripture/art/manifest.md` lists public domain illustrations keyed to scripture. Additive only.

**Soundtrack** — `reference/soundtrack/manifest.md` maps music to chapters and scenes. Before a session, find the chapter entry, put the song on, let it run on repeat. If a song stops working, note it — the mismatch is information. Additive only.

---

## Worldbuilding incubator

`mindmap/` is the steam room between theory and manuscript. Drop ideas, link nodes, keep it loose. When a node becomes stable, move it into `manuscript/` or `principles/`.

Start at [mindmap/hub.md](mindmap/hub.md).
