# Draft & Version Control System

Chronikon uses Git natively for all versioning. No separate backup system, no numbered `.docx` files, no "final_FINAL_v3." The repo is the single source of truth at every stage.

`manuscript/` is the canonical text. All other folders are working space for notes, sticky fragments, worldbuilding, and structural experiments.

The manuscript is a protected layer: do not edit it casually. Use the other folders for loose drafts, then move only intentional, ready material into `manuscript/`.

See [`workflow/layers.md`](./layers.md) for the full working-layer model.

---

## The three layers of version control

### 1. Commits — granular save points

Commit often. Every commit is a recoverable state.

Good commit messages for prose:
```
ch03: open the 3am dispensation, rough draft
ch03: cut the inn sequence, 400 words removed
ch07: rewrite closing paragraph
ch03: restore inn sequence from before the cut
```

Commits are cheap. Use them freely. You can always go back.

---

### 2. Tags — named draft milestones

When a draft is complete — even if rough — tag it. Tags are permanent named markers in the commit history.

| Tag | Meaning |
|-----|---------|
| `draft-1` | First complete pass of all 12 chapters |
| `draft-2` | First major revision |
| `draft-3` | Line-edited |
| `final` | Locked. Done. |

Creating a tag:
```bash
git tag draft-1 -m "First complete draft, ~X words"
git push origin draft-1
```

Comparing two drafts:
```bash
# What changed in chapter 3 between draft 1 and draft 2?
git diff draft-1 draft-2 -- manuscript/chapters/03-*.md

# Word count difference across the full manuscript:
git diff draft-1 draft-2 -- manuscript/chapters/
```

Checking out an old draft to read it:
```bash
git checkout draft-1
# Read, then return:
git checkout main
```

---

### 3. Branches — parallel experiments

Use branches when you want to try something that might not work — without disturbing the main manuscript.

**Naming conventions:**

| Prefix | Use |
|--------|-----|
| `experiment/` | Trying a structural or voice change in a chapter |
| `draft/` | A full-manuscript revision branch (for major rewrites) |
| `claude/` | Claude Code working branches (auto-created) |

Examples:
```
experiment/ch01-in-medias-res
experiment/ch06-second-person
experiment/ch09-remove-narrator
draft/full-revision-2
```

If the experiment works: merge it to `main`.
If it doesn't: leave the branch. Never delete it. It's a record of what was tried.

---

## Chapter file naming

```
manuscript/chapters/01-[dispensation-name].md
manuscript/chapters/02-[dispensation-name].md
...
manuscript/chapters/12-[dispensation-name].md
```

The numeric prefix controls reading order in the build. The name is the Dispensation's title (set when the chapter is written — not before). Pad to two digits (`01`, `02`, ..., `12`).

---

## DRAFTS.md — the living log

When you tag a draft, update [`../DRAFTS.md`](../DRAFTS.md) at the repo root. One row per milestone.

---

## Inline variants (within a chapter)

For short alternatives you want to keep visible while deciding:

```markdown
<!-- VARIANT A -->
The clock struck and she did not move.
<!-- END VARIANT A -->

<!-- VARIANT B -->
She heard the clock. She did not count.
<!-- END VARIANT B -->
```

Keep inline variants short and temporary. If a variant is longer than a paragraph or lives in the file for more than one session, move it to a branch instead.

---

## Quick reference

| I want to... | Do this |
|---|---|
| Save progress | `git commit -m "ch04: ..."` |
| Mark a complete draft | `git tag draft-N -m "..."` then `git push origin draft-N` |
| Try something risky | `git checkout -b experiment/ch05-something` |
| Compare two drafts | `git diff draft-1 draft-2 -- manuscript/` |
| Read an old draft | `git checkout draft-1` (then `git checkout main` to return) |
| Recover a deleted passage | `git log --oneline manuscript/chapters/05-*.md` then `git show <sha>:manuscript/chapters/05-*.md` |
| See word count over time | `git log --oneline` then spot-check with `wc -w` |
