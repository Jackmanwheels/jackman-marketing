# 2. Pre-flight pillar review for social content

**Date:** 2026-09-15
**Status:** Accepted

---

## Context

The September audit found that **32% of the Instagram grid belongs to no pillar and does
no job.** Strategy v2 Part 6 calls that the real finding, and our own Reels confirm it:
no-pillar posts floor at 718–1,900 views. The target for that row is 0%.

Two supporting numbers make it worse. Technical · Proof sits at 0% against a 15% target —
the pillar that answers both of the purchase fears in our audience profile has never once
been posted. And Heritage sits at 38% against a 10% Instagram target, which is not wrong
content, just four times overweight on the surface where it costs the most.

Strategy Part 9 already contains a nine-item pre-flight checklist. It is not being run.
Not through negligence — it lives at the end of a 22,000-character document and depends
on remembering it exists at the moment an idea shows up, which is usually in a truck.

A checklist that depends on discipline, run by one person with no second reviewer, is a
checklist that runs when things are calm and stops when they aren't. Those are the same
weeks the bad posts ship.

## Decision

Adopt a **pre-flight review step** for social content, implemented as a `social-review`
skill invoked with `/social-review`.

- Input is anything — a half-formed idea, a shot concept, a caption, a finished post.
- Output is fixed: pillar, job, sendable, never-ships violations, mix impact, then two
  or three concrete rewrites.
- **The skill reads the strategy and playbook live on every run.** The pillar definitions
  are not copied into it. This is the load-bearing part of the decision: the pillars
  already changed once, v1's six retired for v2's six in a single day, and a tool with
  rules baked into it would now be confidently grading against a framework we abandoned.
- **"No pillar" is an explicit, expected verdict**, not a failure of the tool. Being
  willing to return None on a beautiful photo is the entire point.
- One pillar, one job, per post.

## Consequences

**What this buys.** The Part 9 checklist stops depending on memory. The no-pillar rate
becomes visible at the moment of creation rather than in a quarterly audit. Ideas get
caught while they're still cheap — before a shoot day, not after. And the routing advice
is specific rather than general: a Heritage idea comes back as "right pillar, wrong
surface, put it on Facebook," which is a sentence nobody thinks to say to themselves.

**What it costs.** One more step between idea and post, and a tool that is only as good
as the documents it reads. It reviews content; it does not create any. The bottleneck in
the ninety-day targets is proof posts and sends, and a filter does not shoot a truck.

**The failure mode to watch.** Grading becomes a substitute for shipping. If a week
produces six reviews and no posts, the tool is now the problem. The weekly check in
Part 9 is the guard: two vehicle posts, one proof post, or the fix is always the same —
shoot a truck.

**Open.** Strategy Part 9 item 9 instructs running `scripts/brand_check.py`. That script
does not exist anywhere in this folder. Either it gets written or the checklist item gets
struck; until then the brand check is a human read of the guardrails.

**Note on numbering.** ADR-0001 suggested that reconciling the `docs/` directory against
the folder and naming conventions "should be ADR-0002." That question was not taken up
first and is now ADR-0003 when it is. ADR-0001 is accepted and therefore not edited to
match — the sequence is a record of what actually happened, not a plan.
