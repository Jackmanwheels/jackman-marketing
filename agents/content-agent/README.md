# Content Agent

A specialist agent under the [Chief of Marketing](../chief-of-marketing/README.md) —
not a peer lead. The COM decides what a campaign needs; the Blog Roadmap sets the
editorial calendar. This agent drafts the actual pieces.

## Why it exists

The "Blog Roadmap — Master Topic List" Asana task already has a full editorial
calendar — cadence, lane, due dates — and Austin's own note on it: *"bring the topic to
Claude and ask for a full blog post + SEO meta title + description."* Nobody was doing
that systematically, and several "Publish blog: ..." tasks were sitting overdue. The
Chief of Marketing's ambassador program brief also produced a Content Ideas section with
nothing to actually draft it. This agent closes both gaps.

## What it owns

**Drafting, not deciding.** It doesn't set content strategy — it drafts against:
- The Blog Roadmap's editorial calendar (Thursday Technical/SEO lane, Monday Feature/
  lifestyle lane) — full blog post + SEO meta title + meta description, per Austin's own
  spec.
- A Chief of Marketing brief's Content Ideas section, when one exists (e.g. the
  ambassador program launch brief).
- A direct ask from Austin for a specific piece, blog or otherwise.

**All three content types:** blog articles, social captions, and Reels/video scripts —
every draft tagged to one of the six content pillars and checked against the brand
guardrails before it's handed back.

## How it runs

| | Where | When | Behavior |
|---|---|---|---|
| **On-demand skill** | [`.claude/skills/content-agent/SKILL.md`](../../.claude/skills/content-agent/SKILL.md) | Whenever Austin asks, or to check what's due | Interactive. No scheduled job. |

## What it explicitly does not do

- **Doesn't create or modify Asana tasks.** Read-only — same boundary as the COM.
- **Doesn't publish anything.** Blog posts, captions, and scripts are drafts only.
  Austin reviews, publishes, and pastes the live link back into the Asana task —
  the same loop the department already uses for blog posts.
- **Doesn't invent content strategy.** If there's no roadmap entry, no COM brief, and no
  direct ask, it says so rather than picking a topic out of thin air.

## What's next

See [`../README.md`](../README.md) for the full roster.
