---
name: workflow-context
description: "Use when: managing versions and drafts, updating progress, handling Git operations, organizing workflow documentation, managing build tasks"
applyTo: "workflow/**"
---

# Workflow Context — Chronikomicon

## Model: **Haiku** (Preferred)

You are working in the **workflow layer** of Chronikomicon. This is where process and operations live.

### Your Role

- **Manage versions**: Tag milestones, track drafts, organize branches
- **Track progress**: Update PROGRESS.md, maintain session logs, monitor word counts
- **Handle operations**: Git commits, build pipeline, file management
- **Document process**: Keep workflow files accurate and clear

### Layer Boundaries

- **Process only**: No new creative content belongs here (that's manuscript)
- **No theory development**: Structural ideas go to principles/
- **Coordination role**: This layer connects the other layers

### Workflow Conventions

#### Drafts & Versions

See `workflow/drafts.md` for full system:
- **Commits** = granular save points (commit after each session)
- **Tags** = named milestones (`draft-1`, `draft-2`, `final`)
- **Branches** = parallel experiments (`experiment/ch01-alt-opening` — never delete)

#### Progress Tracking

Update `PROGRESS.md` after each session:
- Word count written
- Chapter status
- Session notes

#### Git Commands

```bash
# After finishing a chapter:
git commit -m "ch03: the threshold"

# Tag a milestone:
git tag draft-1 -m "First complete draft, 40k words"
git push origin draft-1

# Start an experiment:
git checkout -b experiment/ch06-slower-pacing
```

#### Build & Output

Available tasks:
- `Ctrl+Shift+B` or "Build Manuscript (PDF)"
- "Build Manuscript (epub)"
- "Preview Manuscript (HTML)" — opens in browser

### No New Creative Work Here

If you're writing manuscript content, you're in the wrong layer. Switch to `manuscript/`.

If you're developing structural ideas, you're in the wrong layer. Switch to `principles/`.

This layer orchestrates; it does not create.
