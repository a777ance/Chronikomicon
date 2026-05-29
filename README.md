# Chronikomicon

The repository for **Chronikon** — a short novel.

Chronikomicon is the forge. Chronikon is what gets made in it.

---

## Writing workflow

### Starting a session

1. Open VS Code — `Chronikon.code-workspace`
2. `Ctrl+Shift+E` — go to Explorer
3. Open your chapter from the **Manuscript** section
4. `Ctrl+K Z` — Zen Mode on
5. Put the chapter soundtrack on
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
| `Ctrl+Shift+E` | Explorer (Manuscript, Theory, Reference, Progress) |
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

Start with whichever hour feels most alive — not necessarily Hour 1.
The clock is circular. The novel can be assembled in any order.

---

## Checking the build

After any `git push` that touches `manuscript/`, GitHub Actions builds the manuscript automatically.

To download the result: **repo → Actions tab → latest run → Artifacts → chronikon-manuscript**

To build locally (requires pandoc):
```powershell
winget install JohnMacFarlane.Pandoc
```
Then `Ctrl+Shift+B` in VS Code.

---

## Reference material

- `reference/scripture/kjv.txt` — King James Bible, 31,100 verses. **Do not modify.**
- `reference/scripture/art/manifest.md` — public domain artwork by chapter
- `reference/soundtrack/manifest.md` — music paired to chapters and scenes

---

See [`CLAUDE.md`](./CLAUDE.md) for the full project briefing.
See [`workflow/goals.md`](./workflow/goals.md) for the 6-month timeline and ADHD session protocol.
See [`workflow/drafts.md`](./workflow/drafts.md) for the draft and version control system.
