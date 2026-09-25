# Chief of Marketing

A lead agent, peer to the [Executive Assistant](../executive-assistant/README.md) —
not subordinate to it. The EA owns daily ops (Portal refresh, decision triage). The COM
owns campaigns and creative direction: Austin brings an idea, the COM comes back with a
full brief.

## What it owns

**Turning an idea into a campaign brief.** Austin brings a rough concept — a promo, a
launch angle, a seasonal push. The COM asks clarifying questions only if the idea is
genuinely too thin to act on, then writes a full brief covering:

- Website layout direction
- SEO (coded like the standing action checklist)
- Email marketing (planning and copy direction — Klaviyo itself stays external)
- Content ideas, each tied to one of the six social pillars

Every brief runs through the `jackman-brand-guidelines` guardrails and a `humanizer`
pass before it's handed back.

**Filling a real gap along the way.** The department's own workflow doc already assumed
a campaign brief template existed in `11 Marketing Operations/06 Templates and Forms` —
it never had been built. This agent's first deliverable was
[`jackman-campaign-brief-template.md`](../../11%20Marketing%20Operations/06%20Templates%20and%20Forms/jackman-campaign-brief-template.md),
styled on the one fully-realized precedent in the repo (the Off-Road Expo email doc's
header → content → build notes → rationale → `FILE →` shape).

## How it runs

| | Where | When | Behavior |
|---|---|---|---|
| **On-demand skill** | [`.claude/skills/chief-of-marketing/SKILL.md`](../../.claude/skills/chief-of-marketing/SKILL.md) | Whenever Austin brings an idea | Interactive. No scheduled job — campaign ideas aren't a daily rhythm. |

## What it explicitly does not do

- **Doesn't create or modify Asana tasks.** It proposes a task checklist in the brief;
  Austin decides which Asana project it lands in. This matches the same cautious
  default already used for Meta access (read-only first, revisit later), and avoids a
  real ambiguity Austin has flagged himself — Campaign Planning, Marketing Tasks/Needs,
  and the H2 2026 Marketing Plan currently overlap in Asana with no hard line drawn
  between them yet.
- **Doesn't touch the Jackman Marketing Portal.** That's the EA's database to write to.

## What's next

All four specialists originally named for the COM now exist:
- **[Content agent](../content-agent/README.md)** — drafts blog posts, social captions,
  and scripts against the Blog Roadmap or a COM brief's Content Ideas section.
- **[Website agent](../website-agent/README.md)** — drafts landing page and PDP copy
  against a COM brief's Website Layout Direction section (or a CRO note's fix
  recommendation).
- **[Email agent](../email-agent/README.md)** — drafts Klaviyo campaign and flow emails
  against a COM brief's Email Marketing section or an EA-flagged dormancy problem.
- **[SEO agent](../seo-agent/README.md)** — the most capable specialist so far: audits
  the live site directly rather than only drafting from a brief, and owns the standing
  SEO checklist's accuracy.

The COM no longer has to do any of that work itself. See
[`../README.md`](../README.md) for the full roster.
