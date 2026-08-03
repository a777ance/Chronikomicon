---
description: Your full WORKOUT (bodybuilding schema) — hand it any normal prompt and it runs the in-harness Jury routine end to end: warm up, empanel, report a verdict. Keyless. (The statistical, tool-backed lift lives in the localDNS repo.)
argument-hint: <any question or judgment call, in plain language — no special format>
allowed-tools: Task
---

Run the in-harness Jury routine on whatever the user handed you. **Be forgiving
about the input** — a math problem, a factual call, a design decision, or
open-ended prose are all fair game. Do NOT make the user reformat anything, and do
NOT ask clarifying questions unless the prompt is truly unintelligible.

**Prompt:** $ARGUMENTS

### 1. Warm-up — size the question (instant)

Read the prompt and decide its shape:

- **Discrete answer** (a number, a name, a label, yes/no, "which of these") →
  votable. Make sure the question ends with a canonical `End with 'ANSWER: <x>'.`
  instruction (append it if it's missing) so draws tally by exact match.
- **Open-ended prose** (explain, design, weigh trade-offs) → self-consistency
  voting is weaker (answers won't cluster on exact match). Still empanel a panel
  for the judgment, but report the result as *where the panel leans*, not a hard
  verdict — and say so.

### 2. Empanel the in-harness jury

Empanel **5** concurrent `juror` subagents (Task tool, `subagent_type: "juror"`)
on the prompt in a **single message**, **each with a different answer-preserving
framing** (plain / skeptic / restate / cross-check / avoid-the-trap) so the draws
decorrelate by construction. Collect their `ANSWER:` lines, normalize, and take
the plurality. On a 3–2 / no-majority split, empanel **4 more** (to 9, varying
framings) once, then stop.

> For a **measurable or repeatable** task — where you'd want a measured jury size
> and a Dirichlet stopping rule rather than a fixed fan-out — the statistical jury
> tool (`jury_claude.py`) lives in the **localDNS** repo under
> `04-user-services/ai-orchestration/jury-claude/`. Use it there; this command is
> the keyless, in-harness routine.

### 3. Cool-down — report honestly

Give the **verdict**, the **tally**, and a one-line confidence read (unanimous /
strong majority / split). If it hit the 9-juror ceiling or split, say so plainly —
a jury that won't converge means the question is genuinely contested, and that
*is* the finding; never dress a split as a clean verdict. If the panel agrees
strongly but you suspect it's confidently wrong, flag possible **systematic
bias** — a vote can't fix that.
