# Chronikomicon

The repository for **Chronikon** — a short novel. **Chronikomicon** is the forge. **Chronikon** is what gets made in it.

---

## Repository Architecture: Fractal Access / Shadow with Bracket Toggles

This repo uses a **recursive two-layer memory system** with **bracket notation for state management**.

### **Core Principle**

- **No brackets** = active / working / live
- **Brackets `[name]`** = shadowed / archived / ignore
- Brackets work on **both files and folders**
- READMEs are **never bracketed** (always visible)

### **Naming Convention**

All files and folders use **breadcrumb paths in their names**:
- `access.README.md` in the access/ folder
- `manuscript.md` for a file about manuscript
- `[Judas].md` for an archived version of a Judas file
- `[Judas]/` for an archived Judas folder

This makes context immediately clear at a glance.

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

Each folder has its own access/shadow structure. For details, read each folder's breadcrumb README:

- [shadow/manuscript/manuscript.README.md](shadow/manuscript/manuscript.README.md) — Chapters, metadata, styles
- [shadow/principles/principles.README.md](shadow/principles/principles.README.md) — Theory and frameworks
- [shadow/mindmap/mindmap.README.md](shadow/mindmap/mindmap.README.md) — Worldbuilding incubator
- [shadow/reference/reference.README.md](shadow/reference/reference.README.md) — Immutable sources
- [shadow/workflow/workflow.README.md](shadow/workflow/workflow.README.md) — Process documentation

**Master README stays high-level.** It does not list subfolders. Each folder owns its own documentation.

### **Schema Rule**

**When any new folder is created, it MUST follow this structure:**
1. Create `folder-name/` (no brackets unless you want it archived)
2. Create `foldername.README.md` inside it (never bracketed)
3. Manage contents with bracket toggles on files/folders as needed
4. Do not deviate. This is non-negotiable.

### **Bracket Usage Examples**

**Archive a file:**
```
Notes/
├── notes.README.md       (always visible)
├── session-log.md        (active)
└── [session-log].md      (archived/old version)
```

**Archive a folder:**
```
Characters/
├── characters.README.md
├── Judas/                (active character folder)
└── [Judas]/              (archived character folder)
```

**Move between active/archived:** Rename by adding/removing brackets.

This keeps the working memory clean and the archive visible but distinct.


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
