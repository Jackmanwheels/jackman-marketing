# Website Agent

A specialist agent under the [Chief of Marketing](../chief-of-marketing/README.md) —
not a peer lead. The COM decides what a campaign needs; this agent drafts the actual
page copy and structure. It's a sibling to the
[Content agent](../content-agent/README.md) (which drafts blog/social/scripts) — this
one drafts what lives on the website itself.

## Why it exists

The COM's ambassador program brief called for a landing page, PDP-level fixes have come
up from CRO investigations, and nobody was drafting that copy systematically. Both
`04 Ecommerce and Web/01 PDP Copy and Merchandising` and `05 Performance Marketing/03
Landing Pages` were empty, and no page-draft template existed either.

## What it owns

**Drafting page copy and structure, not deciding what pages should exist.** It works
from:
- A Chief of Marketing brief's Website Layout Direction section.
- A CRO note's recommendation — the CRO agent diagnoses *why* a page underperforms or
  what's wrong on it; this agent drafts the actual replacement copy.
- A direct ask from Austin for a specific page.

**Checks for an existing page first.** If a page already exists, the useful work is
usually reviewing it against the brief or note it should match, not drafting a
duplicate from scratch.

**Filling a real gap along the way.** Added
[`jackman-website-page-draft-template.md`](../../11%20Marketing%20Operations/06%20Templates%20and%20Forms/jackman-website-page-draft-template.md)
— on-page SEO, section-by-section copy, and Shopify build notes, flexible enough to
cover a landing page, a PDP fix, or a collection page without forcing one rigid shape.

## How it runs

| | Where | When | Behavior |
|---|---|---|---|
| **On-demand skill** | [`.claude/skills/website-agent/SKILL.md`](../../.claude/skills/website-agent/SKILL.md) | Whenever Austin asks, or from a COM brief/CRO note | Interactive. No scheduled job. |

## What it explicitly does not do

- **Doesn't create or publish anything in Shopify.** Draft-to-file only — same as every
  agent so far. Austin builds the page himself.
- **Doesn't diagnose why a page underperforms.** That's the CRO agent, under the EA —
  this agent drafts the fix once CRO has found the problem, it doesn't investigate the
  problem itself.
- **Doesn't create or modify Asana tasks.**

## What's next

SEO and Email are still the remaining specialists named for the Chief of Marketing —
see [`../README.md`](../README.md) for the full roster.
