# How To

Quick reference for common commands. Run these in the VS Code terminal (`Ctrl+`` `).

---

## After every writing session

```powershell
git add manuscript/chapters/
git add PROGRESS.md
git commit -m "ch01: what you wrote today"
git push
```

---

## Check what's changed

```powershell
# See what files have changed since last commit
git status

# See the actual word changes
git diff manuscript/chapters/
```

---

## Word count

```powershell
# Count all words across all chapters
(Get-ChildItem manuscript\chapters\*.md | Where-Object {$_.Name -ne 'TEMPLATE.md'} | Get-Content | Measure-Object -Word).Words

# Count words in one chapter
(Get-Content manuscript\chapters\01-title.md | Measure-Object -Word).Words
```

---

## Tag a completed draft

```powershell
# When a full draft is done
git tag draft-1 -m "First complete draft"
git push origin draft-1

# See all tags
git tag
```

---

## Go back and read an old draft

```powershell
# Check out an old draft to read it
git checkout draft-1

# Return to current version
git checkout main
```

---

## Recover a deleted or changed passage

```powershell
# See the history of a chapter file
git log --oneline manuscript/chapters/01-title.md

# Read a chapter as it was at a specific commit
git show abc1234:manuscript/chapters/01-title.md
```

---

## Start a new experiment branch

```powershell
# Try something without affecting main
git checkout -b experiment/ch03-different-voice

# Return to main when done
git checkout main

# Merge the experiment if it worked
git merge experiment/ch03-different-voice
```

---

## Search scripture

```powershell
# Find all verses containing a word or phrase
Select-String -Path reference\scripture\kjv.txt -Pattern "dominion"

# Search for a specific book (e.g. Job)
Select-String -Path reference\scripture\kjv.txt -Pattern "^JOB"

# Search for a phrase across all of Paul's letters
Select-String -Path reference\scripture\kjv.txt -Pattern "^(ROM|1CO|2CO|GAL|EPH|PHP|COL|1TH|2TH|1TI|2TI|TIT|PHM)"
```

---

## Build the manuscript locally

```powershell
# Requires pandoc: winget install JohnMacFarlane.Pandoc

# Build PDF (or use Ctrl+Shift+B in VS Code)
mkdir -Force build
$chapters = Get-ChildItem manuscript\chapters\*.md | Where-Object {$_.Name -ne 'TEMPLATE.md'} | Sort-Object
$chapters | Get-Content | pandoc - --metadata-file=manuscript/metadata.yaml -o build/chronikon.pdf

# Preview as HTML and open in browser
$chapters | Get-Content | pandoc - --metadata-file=manuscript/metadata.yaml --standalone --css=manuscript/styles/chronikon.css -o build/chronikon.html
Start-Process build\chronikon.html
```

---

## Monthly checkpoint

```powershell
# Tag the end of a month
git tag checkpoint-m1 -m "Month 1 complete"
git push origin checkpoint-m1
```
