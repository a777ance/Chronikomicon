#!/bin/bash
# Chronikon session briefing — runs at the start of every Claude Code session.

REPO_DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"
CHAPTERS_DIR="$REPO_DIR/manuscript/chapters"
TARGET=40000

# Count words in chapter files (skip TEMPLATE.md and hidden files)
WORD_COUNT=0
if [ -d "$CHAPTERS_DIR" ]; then
  for f in "$CHAPTERS_DIR"/*.md; do
    [ -f "$f" ] || continue
    [ "$(basename "$f")" = "TEMPLATE.md" ] && continue
    WORD_COUNT=$(( WORD_COUNT + $(wc -w < "$f") ))
  done
fi

# Days remaining until deadline
TODAY_TS=$(date +%s)
DEADLINE_TS=$(date -d "2026-11-30" +%s)
DAYS_LEFT=$(( (DEADLINE_TS - TODAY_TS) / 86400 ))
[ "$DAYS_LEFT" -lt 0 ] && DAYS_LEFT=0

# Words per day needed to hit target
WORDS_LEFT=$(( TARGET - WORD_COUNT ))
[ "$WORDS_LEFT" -lt 0 ] && WORDS_LEFT=0
if [ "$DAYS_LEFT" -gt 0 ]; then
  WORDS_PER_DAY=$(( (WORDS_LEFT + DAYS_LEFT - 1) / DAYS_LEFT ))
else
  WORDS_PER_DAY=0
fi

# Progress bar (20 chars)
PCTS=$(( WORD_COUNT * 100 / TARGET ))
[ "$PCTS" -gt 100 ] && PCTS=100
FILLED=$(( PCTS / 5 ))

BAR=""
i=0
while [ $i -lt 20 ]; do
  if [ $i -lt "$FILLED" ]; then
    BAR="${BAR}#"
  else
    BAR="${BAR}."
  fi
  i=$(( i + 1 ))
done

# Motivational nudge
if [ "$WORD_COUNT" -eq 0 ]; then
  NUDGE="The page is blank. That is where every book begins. Write 220 words."
elif [ "$PCTS" -lt 10 ]; then
  NUDGE="220 words minimum today. Every brick counts."
elif [ "$PCTS" -lt 25 ]; then
  NUDGE="You have started. Keep the chain unbroken."
elif [ "$PCTS" -lt 50 ]; then
  NUDGE="Real momentum. Don't stop now."
elif [ "$PCTS" -lt 75 ]; then
  NUDGE="Past halfway. The end is closer than the beginning."
else
  NUDGE="Almost there. Finish what you started."
fi

printf '\n=== CHRONIKON ===\n'
printf '%d / %d words  [%s]  %d%%\n' "$WORD_COUNT" "$TARGET" "$BAR" "$PCTS"
printf '%d days to Nov 30  |  %d words/day needed\n' "$DAYS_LEFT" "$WORDS_PER_DAY"
printf '%s\n\n' "$NUDGE"
