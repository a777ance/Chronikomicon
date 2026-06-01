# Chronikomicon

The repository for **Chronikon** — a short novel. **Chronikomicon** is the forge. **Chronikon** is what gets made in it.

---

## Repository Architecture: Fractal Access / Shadow

This repo uses a **recursive two-layer memory system**. Every folder contains:
- `README.md` — Overview and navigation specific to that layer
- `access/` — Active working space for that context
- `shadow/` — Archive for that context

**Turtles all the way down.**

### **Root Level**

**Access** — Active Session Context
- `CLAUDE.md` — AI briefing
- `PROGRESS.md` — session log
- `Chronikon.code-workspace` — workspace config

**Shadow** — Five First-Order Folders (only these)
- `manuscript/` — The novel
- `principles/` — Structural theory
- `mindmap/` — Worldbuilding
- `reference/` — Immutable sources
- `workflow/` — Process docs

### **First-Order Folders**

Each folder has its own access/shadow structure. For details, read each folder's README:

- [shadow/manuscript/README.md](shadow/manuscript/README.md) — Chapters, metadata, styles
- [shadow/principles/README.md](shadow/principles/README.md) — Theory and frameworks
- [shadow/mindmap/README.md](shadow/mindmap/README.md) — Worldbuilding incubator
- [shadow/reference/README.md](shadow/reference/README.md) — Immutable sources
- [shadow/workflow/README.md](shadow/workflow/README.md) — Process documentation

**Master README stays high-level.** It does not list subfolders. Each folder owns its own documentation.

### **Schema Rule**

**When any new folder is created, it must follow this structure:**
1. Create `access/` subfolder
2. Create `shadow/` subfolder
3. Create `README.md` explaining the layer
4. Do not deviate. This is non-negotiable.

This keeps the archive navigable and context-aware at every level.


---

## The Creative Loop

1. **Session opens** — Read this README for orientation
   - Understand what's in root `access/`
   - Know the five first-order folders in `shadow/`

2. **Go deeper as needed** — Read the README of any folder you're entering
   - That folder's README explains its own contents
   - It guides you to its `access/` and `shadow/`

3. **Move files intentionally**
   - Pull active work into a folder's `access/`
   - Archive finished work to that folder's `shadow/`
   - Everything is under your control

4. **Session ends** — Files stay organized
   - Working files in `access/`, done files in `shadow/`
   - Clean fractal at every level
   - Ready for next session

---

## Writing Workflow

### Starting a session

1. Open VS Code — `access/Chronikon.code-workspace`
2. Read this README for high-level orientation
3. Navigate to the folder you're working in
4. Read **that folder's README** to understand its structure
5. Move necessary files to that folder's `access/`
6. Open your chapter and write

### Moving files between layers

**To access (pull in to work):**
```powershell
Move-Item -Path shadow/[file] -Destination access/
```

**To shadow (archive):**
```powershell
Move-Item -Path access/[file] -Destination shadow/
```

### Ending a session

1. Update `access/PROGRESS.md`
2. Move inactive files back to their folders' `shadow/` subdirectories
3. Commit:

```powershell
git add access/ shadow/
git commit -m "session: what you worked on"
git push
```

---

## Key Shortcuts

| Shortcut | What it does |
|----------|--------------|
| `Ctrl+K Z` | Zen Mode — full screen focus |
| `Esc Esc` | Exit Zen Mode |
| `Ctrl+Shift+E` | Explorer |
| `Ctrl+Shift+V` | Markdown preview |
| `` Ctrl+` `` | Open terminal |

---

## Starting a New Chapter

1. Navigate to `shadow/manuscript/shadow/chapters/`
2. Copy `TEMPLATE.md`
3. Rename it: `01-title.md`, `02-title.md`, etc.
4. Move to `access/` (or a folder's `access/`) while writing
5. When done, move to `shadow/manuscript/shadow/chapters/`

Start with whichever hour feels most alive. The clock is circular.
