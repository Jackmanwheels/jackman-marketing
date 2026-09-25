# SEO Agent

A specialist agent under the [Chief of Marketing](../chief-of-marketing/README.md) —
not a peer lead. Unlike the other COM specialists, it doesn't only draft from a brief —
it inspects the live site directly, the same escalation the [CRO agent](../cro-agent/README.md)
got over a passive dashboard.

## Why it exists

The standing SEO action checklist (`W-01` through `W-09`) has sat mostly untouched since
mid-September — only one of nine items confirmed done — and nothing was verifying it
against the actual live site or drafting the fixes. `04 Ecommerce and Web/04 SEO` was
empty. This is the specialist Austin asked to build "epic" — real technical auditing,
not just reading a checklist someone filled in weeks ago.

## What it owns

**Auditing the live site, not just reasoning about documents.** It crawls
`jackmanwheels.com` directly — title tags, meta descriptions, schema markup, alt text,
H1s, duplicate collections — and checks that against what the standing checklist claims.

**Owns the checklist's accuracy.** It's the one agent allowed to check off items in
`jackman-social-seo-action-checklist-2026-09-15-v1.md` — but only ones it personally
verified live, never on assumption.

**Drafts the fixes, hands off what isn't a metadata fix.** Corrected title tags, meta
descriptions, alt text, and schema blocks get drafted to file. Anything requiring full
new page copy (like `W-05`'s fitment landing pages, which don't exist yet) gets handed
to the Website or Content agent instead of drafted here.

**Filling a real gap along the way.** Added
[`jackman-seo-audit-template.md`](../../11%20Marketing%20Operations/06%20Templates%20and%20Forms/jackman-seo-audit-template.md) —
scope audited, checklist verification results, new findings, drafted fixes, and what got
handed off elsewhere.

## How it runs

| | Where | When | Behavior |
|---|---|---|---|
| **On-demand skill** | [`.claude/skills/seo-agent/SKILL.md`](../../.claude/skills/seo-agent/SKILL.md) | Whenever Austin asks for an audit or a checklist status check | Interactive. No scheduled job. |

## What it explicitly does not do

- **Never writes anything live to Shopify.** Draft-to-file only, same default as every
  other agent — this was a deliberate call even though it's the most technically capable
  agent built so far.
- **Never checks off a checklist item it didn't personally verify.**
- **Never invents a keyword volume, ranking, or traffic number.** No data, no claim.
- **Doesn't create or modify Asana tasks.**

## What's next

This was the last of the four specialists (Website, SEO, Email, Content) originally
named for the Chief of Marketing — all four now exist. See
[`../README.md`](../README.md) for the full roster.
