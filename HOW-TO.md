# HOW-TO — Quick Reference

## Session protocol (T-minus zoom)

```
T-0  →  Claude reads README.md  →  /compact  →  T-0 sealed
T-1  →  Claude reads context/t1-[topic].md  →  /compact  →  T-1 sealed
T-2  →  tighter slice or conversation zoom  →  /compact  →  T-2 sealed
WRITE → repo closed. journal bubble. write.
```

Each compact seals the perimeter. Once sealed, those files are closed for the session. Lossy gist is intentional.

---

## After writing — save your work

```bash
git add manuscript/chapters/
git add README.md
git commit -m "ch01: [one line describing what you wrote]"
git push origin main
```

---

## Word count (PowerShell)

```powershell
Get-ChildItem manuscript\chapters\*.md -Exclude TEMPLATE.md |
  Get-Content | Measure-Object -Word
```

---

## Tag a draft milestone

```bash
git tag draft-1
git push origin draft-1
```

---

## Recover a deleted passage

```bash
git log --oneline manuscript/chapters/ch01.md
git show abc1234:manuscript/chapters/ch01.md
```

---

## Experiment branch

```bash
git checkout -b experiment/ch01-alt-opening
# write the alternative
git checkout main
# merge if it wins — never delete the branch
```

---

## Search scripture (without loading into context)

```powershell
Select-String "your search term" reference\scripture\kjv.txt
```

---

## Build PDF locally (requires pandoc)

```powershell
pandoc manuscript/chapters/ch*.md `
  --metadata-file=manuscript/metadata.yaml `
  --css=manuscript/styles/chronikon.css `
  -o chronikon-draft.pdf
```

---

## Monthly check-in (manual trigger)

Actions tab → Monthly Check-in → Run workflow

---

## Add a mind map node

1. Create `map/[category]/[node-name].md`
2. Link it from `map/[category]/README.md`
3. Link it from `README.md` if it is a primary node
4. Cross-link to related nodes

---

## Create a T-2 zoom slice

Create `context/t2-[chapter]-[scene].md`:
```markdown
# T-2 Slice — [Chapter] [Scene]
*Read after T-1 compacted. Follow links. /compact. Then write.*

→ [chapter file](../manuscript/chapters/chXX.md)
→ [relevant dispensation](../map/dispensations/XX-name.md)
→ [relevant theme](../map/themes/XX.md)

*After reading → /compact → write. Repo closed.*
```
