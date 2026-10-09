---
name: social-review
description: Pre-flight review for Jackman social content — takes a rough idea, a caption, a shot concept, or a finished post and reports which of the six pillars it hits, which job it does, whether anyone would send it, how it compares to what has actually performed on the account, any never-ships violations, and how to make it better. Use whenever Austin drops in a social idea, asks "is this any good", "what pillar is this", "would this work as a post", or pastes a caption for a check. Also use before batching a shoot day, and on anything headed for Instagram or Facebook.
---

# Social Review — Jackman pre-flight

Grades one piece of social content against the canonical strategy and returns fixes.
This is the `Pre-flight, every post` checklist from strategy Part 9, run for him.

## Step 1 — Read the source of truth. Every time. No exceptions.

The pillars changed once already — v1's six were retired for v2's six in a single day.
**Never grade from memory or from this file.** Read, in this order:

1. `00 Marketing Command Center/06 Standards and Conventions/jackman-decisions-inbox.md`
   — **read this first.** It is the living record of which rules are settled, which are
   in flux, and which have an answer that has not yet been ratified. A rule is only as
   current as this file says it is. Check the `Status:` line of any item that bears on
   what you're grading.
2. `03 Content and Social/jackman-social-strategy-2026-09-15-v2.md` — Part 5 (the six
   pillars and the four jobs), Part 6 (the current mix gap), Part 9 (pre-flight list).
3. `03 Content and Social/jackman-social-playbook-2026-09-14-v1.md` — Part 1, rules A–E.
   Section A is the never-ships list.
4. `00 Marketing Command Center/06 Standards and Conventions/jackman-claude-instructions.md`
   — the 16 brand guardrails.

If a newer strategy version exists in that folder, use it and say which file you used.

**Where the inbox and a guardrail disagree, the inbox tells you which one wins** — read
its `Status:` value. `PROPOSED` means the old guardrail still stands and the new answer
is waiting on ratification. `PROPAGATED` means the new answer is live. Never resolve
that conflict from memory, and never edit a guardrail to match.

## Step 1b — Pull what actually performed. Added 2026-10-08.

Until the Meta connection existed, this skill graded on judgment alone. It no longer has
to — and grading on judgment when measurement is available is a choice to be less useful.

Use the `jackman-meta` tools:

- `ig_media_list` — recent posts. Find the nearest comparable by **subject**, not by
  format. "Someone else's truck" is a subject; "carousel" is not.
- `ig_media_insights` — that comparable's real reach, shares and saves.

**Rates, not totals.** A post with 455 reach and 10 shares beat one with 4,980 reach and
34 shares on the measure that matters. Always compute **shares per 1,000 reach**.

Benchmarks measured 2026-10-08. Treat as a starting point and **re-measure** — these
will age:

| Shares per 1k reach | Read |
|---|---|
| ~4 | account average |
| 7+ | strong |
| 20+ | exceptional — the *37" Nittos on Machined J70* post hit 22 |

Saves per 1k reach: typical 2–3; the "shop truck" outlier hit 8.4.

**If the `jackman-meta` tools are unavailable**, say so in one line and grade on
judgment as before. Never invent numbers, and never quote the table above as though it
had just been measured.

**What the data says so far** (detail in the `project_what-performs-on-ig` memory):

- **Other people's trucks win.** Four of the top five posts were a vehicle someone wants
  to own, with the wheels on it.
- **Event logistics lose.** Four of five Off-Road Expo posts landed in the bottom half.
  The one that worked was the drive to the show, not the booth number — journey, not
  announcement.
- **Product detail shots underperform** wheels-on-vehicles, consistently. This is the
  measured version of the "decoration" verdict in Step 2.

## Step 2 — Grade it

Report exactly this block, nothing above it:

```
PILLAR        <Branding | Technical · Proof | Technical · Mechanism |
               Partnerships | Heritage | Creative | None>
JOB           <Reach | Convert | De-risk | Hold | None — decoration>
SENDABLE?     <Yes/No — one line on why>
COMPARABLE    <nearest past post by subject, its shares/1k and saves/1k,
               and whether this one looks likely to beat or miss it.
               "No comparable pulled — tools unavailable" if that is the case>
NEVER-SHIPS   <Clean, or each rule broken and the exact words that break it>
MIX IMPACT    <what this does to the Part 6 gap>
```

Rules for grading:

- **One pillar. One job.** A post doing two does neither (playbook rule 21). If it
  genuinely spans two, say so and force the choice.
- **"None" is the most useful verdict you can give.** 32% of the current grid hits no
  pillar and that is the single biggest finding in the strategy. A wheel on a surface
  with no vehicle and no explanation is decoration. Say so plainly. Don't reach for a
  pillar to be nice — the whole value of this tool is being willing to say None.
- **Sendable is the real test, and it is now measurable.** Not "is this a good photo of
  the wheel" but "would a guy send this to his buddy who drives the same truck." Sends
  per reach drives unconnected reach, and unconnected reach is the growth engine. Ground
  the verdict in the Step 1b comparable rather than asserting it: *"this resembles the
  22-per-1k post, not the 2-per-1k ones"* beats *"feels sendable."*

  Follower count moves — it was 760 when strategy v2 was written and 946 on 2026-10-08.
  Read it from `meta_whoami` rather than quoting a number from a document.

- **MIX IMPACT uses the live gap table**, not memory. As of strategy v2: Proof is at 0%
  against a 15% target, so proof ideas get encouragement. Heritage is at 38% against 10%
  on Instagram, so a Heritage idea is the right pillar on the wrong surface — route it
  to Facebook, where the target is 25%, and say why.

  **But flag the open tension rather than applying that rule blind.** Heritage is
  overweight by the gap table *and* it performs — the Billy Carter old-ad post pulled
  1,468 reach, fourth-best in the 14 days to 2026-10-08. Both can be true: a pillar can
  be over-represented while its individual posts travel. When you route a Heritage idea
  to Facebook, say that Facebook had **34 followers and 5 page views a day** at last
  measure, so "route it to Facebook" currently means "retire it." That is a real
  consequence and Austin should get to weigh it, not have it applied silently.

  This tension is Austin's to resolve, not yours. If it keeps coming up, suggest it
  belongs in the decisions inbox.

## Step 3 — Make it better

Under a `MAKE IT BETTER` heading, give **two or three concrete alternatives**, not advice.
Rewrite the idea; don't describe how it could be rewritten.

Each one names the pillar it would move into and the fear or job it serves. Prefer fixes
that keep the shot he already has — most no-pillar material is a good photo in the wrong
slot, and "put a vehicle in it" or "demote it to carousel slide three" saves the asset
instead of binning it.

If the idea is already strong, say so in one line and stop. Don't invent problems.

## Step 4 — Copy rules

Any caption or line you write in the output is Jackman copy. Apply the
`jackman-brand-guidelines` skill, then `humanizer` as the last pass. Brand rules win on
every conflict.

Never state a spec, fitment, load rating, torque value, part number, or price — in the
grade or in a suggested rewrite. If the idea depends on one, flag the gap and route it:
specs to Clyde Wheeler, dealer and MAP to Bud Jerue, claims and warranty to Kris Maya.

**Founding date is governed by `D-01` in the decisions inbox, not by this file.** Read
its `Status:` line and follow it. While it reads `PROPOSED`, guardrail #5 still stands —
no founding decade or year in copy, use "California-born." Once it reads `PROPAGATED`,
**Established 1968** / **Est. 1968** is the approved claim. Heritage-pillar ideas are the
ones this bears on, so check it before grading any of them. Do not decide this yourself.

## Notes

- **Corrected 2026-10-08: the brand-check linter exists.** This file previously said it
  did not. It is `scripts/brand_check.ps1` — PowerShell, not the `.py` Part 9 names —
  and it takes a file path:

  ```powershell
  pwsh scripts/brand_check.ps1 "path/to/copy.md"
  ```

  When grading a caption, write it to a scratch file and lint it. The script reports
  `BLOCK` (a regex cannot be wrong — "Gloss Black", "J68") and `WARN` (legitimate other
  uses — bare "bronze" might be the finish or the brand colour; read it yourself).

  **It is not the source of truth and must never become it.** It catches only what a
  regex catches. A clean run means "no mechanical violations found", never "this is on
  brand." Pillar, job, sendability and tone are not checkable there — they are the whole
  job of this skill.
- This reviews content. It does not schedule, post, or file anything.
- If grading surfaces a question only Austin can answer, say so and suggest it belongs
  in the decisions inbox. Don't invent the answer.
