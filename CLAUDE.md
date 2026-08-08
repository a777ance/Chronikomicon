# CLAUDE.md

Briefing for Claude Code. Read this first; [README.md](README.md) holds this repo's full
content. This file carries the portfolio-wide A777ance conventions (below); repo-specific
detail lives in the README.

---

## House style: ordering & typography

These conventions apply across **every** A777ance repo — current and future. (Adopted 2026-06-05.)

- **Time-based content reads newest-first (reverse-chronological).** Logs, changelogs,
  decision logs (ADR / FIN), known-issues and issue trackers, FAQs, metrics and review
  logs, and "Handled For You" entries all lead with the most recent item. Apply this
  within the time-based *section* even when the whole file isn't time-based.
- **Alphabetical lists run Z → A** (descending).
- **Walkthroughs: reverse the blocks, keep the steps.** In a step-by-step guide, present
  the major sections/blocks in reverse order (last block first — it helps "block" the
  work), but keep the numbered steps *within* each block in forward order so every
  procedure stays followable. A walkthrough's table of contents mirrors the reversed
  block order. **Never renumber** — step and stage numbers stay fixed, so the intended
  execution order is always readable from the numbers.
- **Font: Gill Sans MT everywhere.** Every surface — customer-facing or internal — uses
  Gill Sans MT. Web/CSS stack:
  `'Gill Sans MT', 'Gill Sans', Calibri, 'Trebuchet MS', sans-serif`.

---

## Bifrost — active command schema (loads every session)

<!-- bifrost-briefing:start — GENERATED from localDNS/04-user-services/ai-orchestration/briefing-block.md by tools/sync-briefings.py. Do not hand-edit; edit the canonical file and re-run. -->

**Bifrost** is the A777ance command-composition schema — a keyboard-spatial notation
(`~ ! @ # $ % ^ & * ()` swept left→right, each glyph an *archetype* fulfilled by slash
commands + a plain-language sub-prompt). It is **active from the first token of every
session, in every repo:** adopt the `~` lazy-anchor posture — fire the first token ASAP
(the *model* stays high), let continuity coalesce mid-flight — and read Bifrost notation
per the schema whenever used.

- **Backbone:** `'` ignition (begins the Bifrost) · `~` continuity/lazy-anchor · `` ` ``
  descriptor (and, bare, the *expansion call*) · `!` cargo (a *manifest* — not executed on
  loading) · `@` source — **read-only** · `#` repo/destination — **write-allowed** · `$` sanity ·
  `%` compliance · `^` cars/lanes · `&` rotary — the **rabbit trail**, a nested Bifrost (also
  the sequential form) · `*` stop signal (red by default) · `()` governance (release
  conditions). Off-row `'`/`~`/`` ` `` stage; keys 1–4 **Preload** form a complete manifest —
  *what · from where · to where · against what*.
- **`@`/`#` are a permission pair, not a pair of arrows** (founder's rule, 2026-08-08). `@` is
  **read-only** — read it, never write it. `#` is **write-allowed** — what this run may create,
  modify or overwrite (still two-way). **They may overlap:** `@` alone = read-only, `#` alone =
  writable, both = read-write. Two slots, three states, one **mount table**. `@` still reads and
  `#` still writes, so every string already written stays valid — this only *adds* the guardrail,
  and gives the one-way door a question with an answer: *is every write inside `#`?*
- **`'` is always the signal to begin the Bifrost** (founder's rule, 2026-08-07 — fixes a
  mobile bug). Treat `'`, `’` (curly) and `′` as one glyph, and treat **presence and
  absence as the same string**: `' ~ !…` ≡ `~ !…`, `''` ≡ `'`. It marks *where* the Bifrost
  starts, never *what* runs — no sub-prompt, no `/how`, no intensity dial, `0` turbulence. A
  letter-flanked `'` (`don't`, `founder's`) is prose in a sub-prompt, not an ignition; only a
  free-standing `'` ignites. Never ask which apostrophe the phone chose.
- **A bare `'` (the whole message) = the reference call. Return this string and NOTHING else:**

  ```text
  ~!@#$%^&*()
  ```

  It is **the sweep itself** — exactly what sliding a finger down the row on a laptop puts on
  the screen. Not a legend, not a glossary, not a table: the row. So it is a **lookup, not a
  generation** — same bytes every call, every session, every model. No preamble, no trailing
  offer, no adaptation to the conversation. Answer *immediately*; it reads no file and fires no
  cargo. Glyph *meanings* live in the backbone above; the reference call hands back the
  **order**, which is the thing a phone cannot sweep for itself.
- **A bare descriptor — `` `…` `` with no backbone glyph in the message — is the *expansion
  call*.** The backticked text is a **seed**, and the answer is one complete, schema-compliant
  line with **every backbone slot filled in**, for the founder to read, parse and tweak:

  ```text
  ~ (fill in) ! (fill in) @ (fill in) # (fill in) $ (fill in) % (fill in) ^ (fill in) & (fill in) * (fill in) ( (fill in) )
  ```

  **The skeleton is the sweep, spaced** — strike the `(fill in)` slots and the whitespace and
  `~!@#$%^&*()` remains. `'` hands back the **order**; `` `seed` `` hands back the order **with
  the slots filled**. Echo the seed back on the `` ` `` line; fill **every** slot, never drop one
  (a complete draft is edited *down*); emit in Golden Rule order, so `K = 0` by construction;
  **`*` comes back RED, always** — an expansion is a *proposal*, nothing ran and no `#` was
  touched; and **collapse it** — where the surface renders HTML, ship it inside a `<details>`
  whose `<summary>` is the `~` requirement line. With a backbone glyph present, `` ` `` is the
  ordinary descriptor, unchanged. An empty descriptor returns the sweep. Unlike the bare `'`
  (a constant), an expansion **generates** — so the selector matters, and here it is the
  **human at the `*` gate**, not a vote.
- **`` ` `` and `&` are the same operation — nesting, at two positions** (founder's rule,
  2026-08-08). `&` is the **rabbit trail**: a digression you *come back from*, opening another
  full Bifrost inside this one. `` ` `` nests at staging, `&` nests on the road —
  `` `seed` `` ≡ `& seed` hoisted to position zero, which is why a bare descriptor can generate
  a line at all. So **expansion is recursive by construction**, and `&`'s "sequential" reading
  is just nesting seen from the parent's frame.
- **The greater traffic light is always the last bulwark** (founder's rule, 2026-08-08). Every
  nest **adds** a light; none removes one. An inner `*` going green releases its chunk **into
  its parent**, never into the world — only the outermost `*` stands between a `!` and an
  effect that cannot be recalled, however many inner gates already cleared. **Permissions
  intersect inward, gates conjoin outward:** a nested road may never write outside its parent's
  `#`, nor release past its parent's `*`. That is what lets `~` stay reckless at any depth —
  nesting multiplies the reasoning, never the exposure.
- **`*` cuts the road into Dispensations** — bounded, self-governing chunks. Governance has
  three outcomes: satisfied → green · **re-flagged** → return upstream via `&` (this is what
  lets a fixed string produce unbounded output) · unsatisfiable → eject to the shoulder.
- **The one-way door:** `~` rushes the reasoning, `*` gates the *effects* — anything
  irreversible (publish, deploy, send, push) rides past a light, which is exactly what makes
  the lazy start affordable.
- **Cars:** explicit `^` beats inferred. With no `^`, `!`'s command arity instantiates lanes
  1:1; with `^` present, `^` sets the lanes and `!`'s commands are the per-lane pipeline.
- **Guardrails survive a keyboard-mash:** `~` continuity, `$` sanity, `%` compliance — plus
  `*()` **governance**, the only one that repeats at every chunk boundary. `+` / repetition =
  more; `-` inverts into a stress test.

Canonical spec —
markdown: <https://github.com/a777ance/localDNS/blob/main/04-user-services/ai-orchestration/highway-notation.md>
· rendered page: <https://a777ance.github.io/localDNS/bifrost.html>

<!-- bifrost-briefing:end -->

### Decode table — enough to run a string without fetching the spec

| Glyph | Role | Read it as |
| :-- | :-- | :-- |
| `'` | Ignition | Begins the Bifrost. Optional by construction — presence and absence are the same string. No sub-prompt, no dial, `0` turbulence. A **bare `'`** alone is the reference call: return `~!@#$%^&*()` and nothing else. |
| `~` | Continuity / lazy anchor | The requirement, **and** carry prior context forward. Fire the first token immediately; coalesce mid-flight. More `~` = lazier. No slash command. |
| `` ` `` | Descriptor | Shaded qualifier, subordinate to `~`. **Bare** (backticked text, no backbone glyph in the message) it is the **expansion call**: a seed that returns a whole filled-in line. Same operation as `&` — nesting, at staging instead of on the road. |
| `!` | Cargo | The **manifest** — *what* is carried. **Not executed on loading**; the road decides when each item acts. |
| `@` | Source — **read-only** | Read **from** here, and **never write here**. |
| `#` | Repository — **write-allowed** | May be created, modified, **overwritten** (two-way — read back as well). May overlap `@`. |
| `$` | Sanity / tollbooth | Validate against the **known-good** baseline. |
| `%` | Compliance / weigh station | Pre-flight audit — *are we compliant?* |
| `^` | Cars | Parallel lanes. Count = width; each takes a sub-prompt, so lanes are named. |
| `&` | Rotary — the **rabbit trail** | Opens **another whole Bifrost inside this one** — a digression you *come back from*. Also the sequential/deterministic form (commands run in order), which is the same thing seen from the parent's frame. |
| `*` | Stop signal | **Red by default.** Nothing proceeds until governance clears it. |
| `()` | Governance | The release conditions — **all** must hold. |

**Intensity:** `+` or repetition = stricter (`$+++` ≡ `$$$$`). `-` inverts into a stress test.

**Cars:** explicit `^` always beats inferred. With no `^`, `!`'s command arity instantiates
lanes 1:1; with `^` present, `^` sets the lanes and `!`'s commands become the per-lane pipeline.

### Dispensations — the unit of composition

A `*` gate cuts the road into chunks, and **a chunk is a Dispensation** — the same object this
repo's [twelve-hour clock principle](shadow/principles/shadow/01-twelve-hour-clock.md) describes:
bounded, governed by its own internal logic, its **duration felt rather than measured**, and
superseded when the hour turns. A Bifrost-compliant command *is* a Dispensation, and
Dispensations string together — each hands off to the next only through a gate it satisfied.

Governance has **three** outcomes: satisfied → green · **re-flagged → back upstream for
rewrite** · unsatisfiable → eject. The re-flag path is why a fixed-length string can produce a
whole book: it states a terminal condition and loops until the gate turns green.

**The one-way door:** `~` rushes the *reasoning*; `*` gates the *effects*. Anything
irreversible — publishing, pushing to `main` (which triggers the build), sharing a draft — rides
**past** a light. Everything upstream of a light stays revisable, which is what makes rushing
the first token safe.

**The greater traffic light is always the last bulwark.** Because `&` and a bare `` ` `` both
open a whole Bifrost *inside* this one, Dispensations nest — and every nest **adds** a light,
never removes one. An inner `*` going green releases its chunk **into its parent**, not into
the world; only the outermost gate stands between a draft and a reader. For this repo that is
concrete: a chapter can satisfy its own gate all it likes and still not be published, because
the book gate (`* 12 chapters · 40,000 words`) is downstream of it and the human holds it.
**Permissions intersect inward, gates conjoin outward** — a nested road may never write outside
its parent's `#` (so a rabbit trail down a theme cannot touch the SEALED cosmological core), nor
release past its parent's `*`. That is what lets `~` stay reckless at any depth: nesting
multiplies the reasoning, never the exposure.

### The standing Chronikon string

```text
~ Chronikon — continue the novel one Dispensation at a time
  `awe enacted not announced · embodied · committed to the cosmology · never morose`
  ! /write /edit /review
  @ shadow/mindmap/shadow/worldbuilding.md @ shadow/mindmap/shadow/themes.md
  @ shadow/principles/shadow/01-twelve-hour-clock.md @ shadow/principles/shadow/03-cosmological-core.md
  # Chronikomicon → shadow/manuscript/shadow/chapters/NN-title.md
  $ access/CLAUDE.md "Chronikon voice" + the prose checklist
  $+ 03-cosmological-core.md is SEALED — read freely, never propose edits
  % scripture quoted verbatim from shadow/reference/shadow/scripture/kjv.txt, never paraphrased
  ^ cycle-and-return ^ authority-and-holiness ^ memory-loss-and-renewal
  & /wordcount /progress
  * 220 words minimum this session (human says continue or stop)
  * one Dispensation complete (human reviews and annotates; may re-flag for rewrite;
    duration is FELT — a one-page hour at 6 is correct, not a failure)
  * 12 chapters · 40,000 words · by 2026-11-30 (human approves each sequentially;
    a re-flag returns that chapter upstream) ! /share /build
```

**This string does not override the session-start protocol in
[`access/CLAUDE.md`](access/CLAUDE.md) — it encodes it.** The innermost gate *is* "write 220
words, then stop and ask." Show progress, ask one question, wait. A Bifrost string naming twelve
chapters is a **terminal condition**, never a licence to write twelve chapters unattended, and
never a reason to hand back a menu of options.

**Reading the `/how` commands.** Bifrost is **notation only — no dispatcher parses it.** Of the
commands above, only `/wordcount`-style progress is automated (the `session-start.sh` hook);
`/write`, `/edit`, `/review`, `/share`, `/build`, `/progress` and `/styleguide` are **statements
of intent**, not slash commands that exist in `.claude/commands/`. Read them as the mechanism
fulfilling the archetype and do the work directly.
