# CRO Agent

A specialist agent under the [Executive Assistant](../executive-assistant/README.md) —
not a peer lead. The EA's daily refresh flags that a funnel number moved; this agent is
the one that investigates why, combining live Shopify data with actually clicking
through the storefront itself.

## Why it exists

The EA's diagnosis had been flagging the same problem for over a week before this agent
was built: steady traffic, zero cart-adds, zero completed checkouts. A static dashboard
— including the Portal's own "CRO Lab" tab — can read the numbers but can't click
through jackmanwheels.com to check whether something is actually broken. This agent
closes that gap.

## What it owns

**Diagnosing conversion problems on the live site.** Given a funnel anomaly (from the
EA's daily flags, or Austin asking directly), it:
1. Pulls the relevant Shopify funnel data to characterize the problem precisely
2. Actually navigates jackmanwheels.com — opens a product, adds to cart, proceeds into
   checkout — to catch a broken button or a bad gate that analytics alone can't reveal
3. Writes a concrete note with evidence and a specific recommendation

It's diagnostic and advisory only — this repo has no way to change site code or run a
formal A/B test (no vendor exists for that), so any actual fix happens in Shopify,
manually, same as how Klaviyo email builds happen outside this repo.

**Filling a real gap along the way.** `04 Ecommerce and Web/03 CRO Tests and Results`
had never held a file, despite the department's own operating guide naming it as where
"test notes" belong. This agent's first deliverable was
[`jackman-cro-note-template.md`](../../11%20Marketing%20Operations/06%20Templates%20and%20Forms/jackman-cro-note-template.md)
— deliberately light, matching the operating guide's own standard ("a one-line note per
change is the whole discipline"), and using the same fields as the Portal's own CRO Lab
form so a manual entry and an agent-written note read as the same kind of record.

## How it runs

| | Where | When | Behavior |
|---|---|---|---|
| **On-demand skill** | [`.claude/skills/cro-agent/SKILL.md`](../../.claude/skills/cro-agent/SKILL.md) | Whenever Austin asks, or a funnel number looks wrong | Interactive. No scheduled job yet. |

## Hard rule

It never enters real payment, shipping, or contact information on the live site, and
never completes an actual order — it tests that the mechanism works, it doesn't
transact. This is non-negotiable regardless of what it's investigating.

## What it explicitly does not do

- **Doesn't touch the Jackman Marketing Portal.** Austin's own CRO Lab change log
  (`portal/cro`) stays his — same boundary already set for the EA and the Chief of
  Marketing.
- **Doesn't create or modify Asana tasks.**
- **Doesn't change site code or run a formal test.** No such tooling exists yet; it
  reports findings for Austin to act on in Shopify directly.

## What's next

See [`../README.md`](../README.md) for the full roster. This is the first specialist
built under the EA — more may follow the same pattern (diagnostic, on-demand, reports
rather than acts) as gaps like this one get found.
