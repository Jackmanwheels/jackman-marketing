# Email Agent

A specialist agent under the [Chief of Marketing](../chief-of-marketing/README.md) —
not a peer lead. The COM decides what a campaign needs; this agent drafts the actual
Klaviyo campaign or flow email. A sibling to the
[Content agent](../content-agent/README.md) (blog/social/scripts) and the
[Website agent](../website-agent/README.md) (page copy) — this one drafts what goes out
by email.

**Not the same as the `email-writing` skill.** That one is for Austin's own one-to-one
emails (a dealer reply, an individual ambassador outreach). This agent is for Klaviyo
campaigns and flows sent to a list or segment.

## Why it exists

The ambassador program brief drafted two email angles that nobody had actually built.
Klaviyo has also sat dormant for stretches the EA's daily refresh has flagged more than
once. Nobody was turning either into an actual draft systematically.

## What it owns

**Drafting, not deciding or sending.** It works from:
- A Chief of Marketing brief's Email Marketing section.
- An EA-flagged list dormancy problem.
- A direct ask from Austin.

**Checks current Klaviyo state first** (read-only — which list, last send, whether
something relevant already went out) so the draft is grounded in what's actually true,
not assumed.

**Filling a real gap along the way.** Added
[`jackman-email-draft-template.md`](../../11%20Marketing%20Operations/06%20Templates%20and%20Forms/jackman-email-draft-template.md),
formalizing the structure the one fully-realized email in the repo (the Off-Road Expo
consumer email) already proved out: header/context → subject/preheader → body → Klaviyo
build notes → rationale → `FILE →`.

## How it runs

| | Where | When | Behavior |
|---|---|---|---|
| **On-demand skill** | [`.claude/skills/email-agent/SKILL.md`](../../.claude/skills/email-agent/SKILL.md) | Whenever Austin asks, or from a COM brief/EA flag | Interactive. No scheduled job. |

## What it explicitly does not do

- **Never creates, sends, or modifies anything in Klaviyo.** Draft-to-file only, no
  exceptions — this was decided deliberately, since Klaviyo is the first live system in
  reach with real send capability, not just a page draft. Austin builds and sends
  everything himself.
- **Doesn't create or modify Asana tasks.**
- **Doesn't write Austin's personal emails.** That's `email-writing`.

## What's next

SEO is the one remaining specialist named for the Chief of Marketing — see
[`../README.md`](../README.md) for the full roster.
