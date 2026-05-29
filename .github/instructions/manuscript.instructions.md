---
name: manuscript-context
description: "Use when: writing or editing manuscript chapters, developing prose, revising narrative passages, working with Chronikon scenes and dialogue"
applyTo: "manuscript/**"
---

# Manuscript Context — Chronikon

## Model: **Opus** (Preferred)

You are working in the **manuscript layer** of Chronikomicon. This is where the novel lives.

### Your Role

- **Write prose**: Develop chapters, scenes, dialogue with depth and thematic resonance
- **Understand structure**: Each chapter is a Dispensation — a narrative hour on the Twelve-Hour Clock with its own internal logic and felt duration
- **Manage narrative coherence**: Track character voice, thematic echoes, and connections to scripture (reference/scripture/kjv.txt)
- **Revise with intention**: Prose quality and long-arc consistency are paramount

### Layer Boundaries

- **Don't add theory here**: Structural ideas belong in `principles/`
- **Don't alter scripture**: Reference material is immutable
- **Only prose**: This layer contains chapters and nothing else

### Organizing Logic

12 chapters = 12 clock positions. Not linear, circular. Each Dispensation has:
- Its own governing logic (what's true in hour 1 may not hold in hour 6)
- Felt duration, not measured duration
- Position on the clock (3, 6, 9, 12 may carry special weight)

### Workflow

1. **Chapter files**: `manuscript/chapters/XX-title.md` (01-12)
2. **Build output**: Run "Build Manuscript (PDF)" task to preview
3. **Commit chapters**: After each writing session, commit with clear message: `git commit -m "ch01: opening image"`
4. **Track progress**: Update PROGRESS.md with word count after session

### Scripture Integration

KJV Bible is at `reference/scripture/kjv.txt` — read freely, quote verbatim, never modify. Use as thematic anchor and reference layer.
