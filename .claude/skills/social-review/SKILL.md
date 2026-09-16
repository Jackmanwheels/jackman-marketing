---
name: social-review
description: Pre-flight review for Jackman social content — takes a rough idea, a caption, a shot concept, or a finished post and reports which of the six pillars it hits, which job it does, whether anyone would send it, any never-ships violations, and how to make it better. Use whenever Austin drops in a social idea, asks "is this any good", "what pillar is this", "would this work as a post", or pastes a caption for a check. Also use before batching a shoot day, and on anything headed for Instagram or Facebook.
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

## Step 2 — Grade it

Report exactly this block, nothing above it:

```
PILLAR        <Branding | Technical · Proof | Technical · Mechanism |
               Partnerships | Heritage | Creative | None>
JOB           <Reach | Convert | De-risk | Hold | None — decoration>
SENDABLE?     <Yes/No — one line on why>
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
- **Sendable is the real test.** Not "is this a good photo of the wheel" but "would a
  guy send this to his buddy who drives the same truck." Sends per reach is what drives
  unconnected reach, and unconnected reach is the entire growth engine at 760 followers.
- **MIX IMPACT uses the live gap table**, not memory. As of strategy v2: Proof is at 0%
  against a 15% target, so proof ideas get encouragement. Heritage is at 38% against 10%
  on Instagram, so a Heritage idea is the right pillar on the wrong surface — route it
  to Facebook, where the target is 25%, and say why.

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

- Strategy Part 9 item 9 says to run `scripts/brand_check.py`. That script does not
  exist in this folder. Do the check by reading the guardrails; don't pretend to run it,
  and mention it's missing if the gap ever matters.
- This reviews content. It does not schedule, post, or file anything.
- If grading surfaces a question only Austin can answer, say so and suggest it belongs
  in the decisions inbox. Don't invent the answer.
