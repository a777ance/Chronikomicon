# Chronikomicon

The repository for **Chronikon** — a short novel. **Chronikomicon** is the forge. **Chronikon** is what gets made in it.

---

## Repository Architecture: Access / Shadow

This repo uses a **two-layer memory system** to optimize creative work:

### **Access** — Active Working Memory
The conscious bubble. Loaded into every session. Small, focused, intentional.

**Current contents:**
- `CLAUDE.md` — AI briefing and session context
- `PROGRESS.md` — running word count log and session notes
- `Chronikon.code-workspace` — workspace configuration

**What to put here:** Active chapter you're writing, current principles you're working with, immediate reference materials, today's focus.

### **Shadow** — Episodic Long-Term Memory
The subconscious. The entire archive. Consulted deliberately, not loaded automatically.

**Complete Table of Contents:**

#### Manuscript
- `shadow/manuscript/chapters/` — All chapters (copy TEMPLATE.md to start)
- `shadow/manuscript/metadata.yaml` — Pandoc book metadata
- `shadow/manuscript/styles/chronikon.css` — PDF/HTML typography

#### Principles
The structural and thematic frameworks:
- `shadow/principles/01-twelve-hour-clock.md` — The Twelve-Hour Clock
- `shadow/principles/02-cosmology.md` — World structure
- `shadow/principles/03-cosmological-core.md` — Deep core theory
- `shadow/principles/README.md` — Overview

#### Mindmap
The worldbuilding incubator (loose, hyperlinked, generative):
- `shadow/mindmap/hub.md` — Central index and navigation
- `shadow/mindmap/clock.md` — Clock details
- `shadow/mindmap/characters.md` — Character landscape
- `shadow/mindmap/worldbuilding.md` — World details
- `shadow/mindmap/themes.md` — Thematic seeds
- `shadow/mindmap/scene-seeds.md` — Scene ideas

#### Reference
Immutable source material:
- `shadow/reference/scripture/kjv.txt` — King James Bible (31,100 verses)
- `shadow/reference/scripture/art/manifest.md` — Public domain artwork keyed to scripture
- `shadow/reference/soundtrack/manifest.md` — Music paired to chapters and scenes

#### Workflow
Process documentation:
- `shadow/workflow/drafts.md` — Version control and milestone system
- `shadow/workflow/goals.md` — 6-month timeline and session protocol
- `shadow/workflow/layers.md` — Layer structure guide
- `shadow/workflow/story-outline.md` — Narrative outline
- `shadow/workflow/HOW-TO.md` — Process guide

#### Drafts Archive
- `shadow/DRAFTS.md` — Log of all tagged milestones

---

## How the System Works

### The Creative Loop

1. **Session opens** — Claude reads this README
   - Sees what's in `access/` (the bubble)
   - Sees the TOC of `shadow/` (the subconscious landscape)

2. **Intuitions form** — Without loading shadow into context
   - "What if we pulled principle X into this scene?"
   - "Mindmap theme Y might echo this chapter"
   - "Reference material Z could reframe principle W"

3. **You decide** — Manual, intentional creative choices
   - Move files from shadow → access if they feel relevant
   - Run diffs, merge ideas, explore connections
   - Commit your progress

4. **Session ends** — Files move back
   - Archive work to shadow/ when done with a layer
   - Keep access/ clean and focused

### Token Optimization

This prevents context bloat while preserving discovery:
- Shadow contents stay archived (not loaded)
- TOC is lightweight (dimensions known, not details loaded)
- Claude thinks *about* the landscape, not within it
- User retains control over what emerges

---

## Writing Workflow

### Starting a session

1. Open VS Code — `access/Chronikon.code-workspace`
2. This README provides orientation to both layers
3. Move necessary files from shadow/ to access/ for today's work
4. `Ctrl+Shift+E` — Explorer
5. Open your chapter file
6. `Ctrl+K Z` — Zen Mode
7. Write

### Ending a session

1. `Esc Esc` — exit Zen Mode
2. Update `access/PROGRESS.md`
3. Move files back to shadow/ if you're done with them
4. Open terminal and commit:

```powershell
git add access/
git add shadow/
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

1. Move `shadow/manuscript/chapters/TEMPLATE.md` to `access/`
2. Rename it: `01-title.md`, `02-title.md`, etc.
3. Delete the comment block at the top
4. Write the first sentence

Start with whichever hour feels most alive — not necessarily Hour 1. The clock is circular. The novel can be assembled in any order.

When the chapter is complete, move it to `shadow/manuscript/chapters/`.
