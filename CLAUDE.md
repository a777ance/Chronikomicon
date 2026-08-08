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

---

## Branch policy — Yggdrasil and the Well of Mimir

<!-- branch-policy:start — GENERATED from localDNS/04-user-services/ai-orchestration/branch-policy-block.md by tools/sync-briefings.py. Do not hand-edit; edit the canonical file and re-run. -->

**`Yggdrasil` is the one standing working branch. Always push there, never to `main`.**
Founder's standing instruction (2026-08-08), superseding "push to `main`, no branches"
(2026-06-05).

- **One super-branch for the whole portfolio**, in every repo — no per-session branches.
  The branch-per-session habit is what produced 337 stale `claude/*` branches, 226 of them
  carrying commits that exist nowhere else.
- **`main` is the Well of Mimir** — vetted knowledge. It moves only by a pull request the
  founder approves. No cadence, no auto-merge: the Well fills when the founder decides it
  does. This is the Bifrost one-way door at portfolio scale — `main` is the outermost `*`,
  and no inner gate may release past it.
- **The spring is the founder, and it is out of scope for the machine.** An analog signal
  nothing here can sample or verify against. Yggdrasil and the Well are *channels*, not
  sources; every file in a repo is **transmission**, and transmission never promotes. A
  green check proves transcripts agree with **each other** — never that they agree with the
  founder. Only asking closes that gap.
- **Never overwrite doctrine.** Pull with `--ff-only` and nothing else — a fast-forward can
  only *add* commits, where a merge, rebase, or reset can silently rewrite founder-authored
  text. A session transcribes doctrine; it does not author it.
- **The tree is bigger than GitHub.** Yggdrasil spans the interacting systems — the t630
  stack, the LLM router, the NotebookLM bridge, Stripe, Setmore, the CRM — and GitHub is
  one root-well it drinks from.

**Push:** always `git push -u origin Yggdrasil`; retry with backoff on network failure.
Never `git push` to `main`, and never force-push either branch.

<!-- branch-policy:end -->

---

## Proxies — what actually refuses, and what only asks

<!-- proxy-doctrine:start — GENERATED from localDNS/04-user-services/ai-orchestration/proxy-block.md by tools/sync-briefings.py. Do not hand-edit; edit the canonical file and re-run. -->

**A proxy is anything that sits in a path, sees what crosses it, and can refuse or
transform it.** Not just HTTP forward-proxies: a firewall, a resolver, a `PreToolUse` hook,
a secret vault, and a credential-injecting middlebox are all the same shape. Adopted
2026-08-08.

**Why it outranks every other kind of rule.** An invariant in briefing prose has an author
and no site; a static check has a site but sits in the run's *given-set*, so a run that
never invokes it is unbound. A proxy sits in the run's **world** — it cannot be ignored by
not reading it. That makes it the strongest form available, and also a liability worth
writing down: an unregistered proxy is a wiretap and a single point of failure that nobody
recorded.

- **Three kinds, and the difference is not cosmetic.** **Enforced** — an intermediary
  refuses; the caller cannot proceed. **Declared** — written down, and the caller is asked
  to comply; binding only on a run that reads and honours it. **Ambient** — in the path but
  refuses nothing; it routes or transforms, and is still a wiretap. **Never write a declared
  boundary in the language of an enforced one** — it buys the confidence of a control
  without the behaviour of one. Bifrost's `@`/`#` mount table is *declared*: honoured by a
  compliant run and by nothing else. That is fine for a composition schema and fatal if
  taught as a sandbox.
- **Scope by reversibility, not by verb.** The agent git proxy blocks `git push --delete`
  and **permits `git push --force`** — proven 2026-08-08 by a successful forced update. Both
  orphan commits; only one is refused. Never reason "this verb sounds dangerous"; ask **"can
  this destroy something that exists nowhere else?"** and then find every verb that reaches
  that effect.
- **Therefore: never force-push `Yggdrasil` or `main`.** The environment will not stop you.
  Pull `--ff-only`; if a push is rejected as non-fast-forward, `git fetch` and rebase *your*
  commits onto theirs — never rewrite the shared ref. Expect company on `Yggdrasil`.
- **A refusal must be legible, and answerable in advance.** A bare `403` with no reason
  converts a safety control into a debugging expense. If you build an intermediary, make it
  say *what* it refused and *why*, and make its policy readable before the attempt rather
  than only after the failure.
- **Bypassable means convention, not control.** A proxy the caller can route around
  provides no guarantee against a caller who doesn't want one. That is sometimes correct —
  `gate.sh`'s bypass is deliberate — but it must be *known*, and the bypass should say that
  the invariant is unsited while it is on.
- **Fail-closed on the security path, fail-open on the plumbing path.** A failing *check*
  should block; a *broken hook* should not wedge the repo. Choose deliberately and record
  which you chose.
- **Know whether you hold the credential.** This session's `GITHUB_TOKEN` is the literal
  string `proxy-injected` — the real credential is minted per request and never enters the
  environment, so it cannot be exfiltrated, logged, or replayed. Prefer proxy-held authority
  for anything an agent touches over a caller-held scoped token.

**Register an intermediary before relying on it**, answering: what it mediates · who holds
the authority · what it can refuse · whether refusal is legible · bypassable · fail-open or
fail-closed · scoped by verb or by effect. Full register and the worked gap audit:
`localDNS/docs/architecture/proxies.md`.

<!-- proxy-doctrine:end -->
