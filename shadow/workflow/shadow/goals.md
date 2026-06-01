# Goals & Timeline

**Target:** 40,000 words (short novel)  
**Deadline:** November 2026 (6 months from May 2026)  
**Weekly minimum:** 1,540 words  
**Daily minimum:** 220 words  

220 words a day is two focused paragraphs. That's the floor, not the ceiling.

---

## ADHD session protocol

Before each writing session, ask Claude:
> "What should I work on today?"

Claude will check PROGRESS.md and give you one focused task — a single scene, a single chapter section — not a list of everything that needs doing.

During a session:
- Use **Zen Mode** (`Ctrl+K Z`) to hide everything except the file you're writing
- Set a timer: 25 minutes on, 5 minutes off (Pomodoro)
- One chapter file open at a time
- Don't edit other chapters during the session

After a session:
- Run `wc -w manuscript/chapters/*.md` to get your word count
- Update PROGRESS.md
- Commit: `git commit -m "ch0X: [what you wrote, word count]"`
- Close VS Code

---

## 6-Month milestone map

| Month | Weeks | Goal | Deliverable |
|-------|-------|------|-------------|
| 1 | 1–4 | Foundations | Principles locked, chapters 1–2 drafted (~6k words) |
| 2 | 5–8 | Rising | Chapters 3–5 drafted (~6k words) |
| 3 | 9–12 | Middle | Chapters 6–8 drafted (~6k words) |
| 4 | 13–16 | Descent | Chapters 9–12 drafted — **first complete draft** (~8k words) |
| 5 | 17–21 | Revision | Full read-through, major revisions, tag `draft-2` |
| 6 | 22–26 | Polish | Line editing, final read, tag `final` |

---

## Monthly word count checkpoints

| Checkpoint | Target cumulative words | Git tag |
|------------|------------------------|----------|
| End of Month 1 | 6,000 | `checkpoint-m1` |
| End of Month 2 | 13,000 | `checkpoint-m2` |
| End of Month 3 | 20,000 | `checkpoint-m3` |
| End of Month 4 | 30,000 | `draft-1` |
| End of Month 5 | 38,000 | `draft-2` |
| End of Month 6 | 40,000+ | `final` |

Create a checkpoint tag:
```bash
git tag checkpoint-m1 -m "Month 1 complete: X words"
git push origin checkpoint-m1
```

---

## When you're stuck

Ask Claude any of these:
- "I'm stuck on chapter 3. Give me three possible directions for the next paragraph."
- "Read chapter 2 and tell me where the energy drops."
- "What does the 12-hour clock principle suggest should happen at the 6 o'clock position?"
- "Pull a verse from the KJV that could anchor this scene."

Stuck is normal. Stuck is not stopped.

---

## When you miss a week

Don't try to catch up. Just resume at the daily minimum. A missed week behind plan is recoverable. A crash from overcompensating is not.
