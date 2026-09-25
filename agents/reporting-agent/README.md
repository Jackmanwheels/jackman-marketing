# Reporting Agent

A specialist agent under the [Executive Assistant](../executive-assistant/README.md) —
not a peer lead. Where the [CRO agent](../cro-agent/README.md) diagnoses funnel
problems as they come up, this agent builds the one thing the department's own
operating guide says compounds quietly over time: a monthly numbers record.

## Why it exists

The operating guide is explicit: *"Build the thing once. Check in monthly. Do not
tinker... one thing, and it's enough: a monthly one-pager, filed consistently, becomes
a twelve-month record."* Its own "put in it first" instruction — a monthly report
template — had never been built, and `10 Analytics and Insights` was completely empty
across all five of its subfolders.

## What it owns

**Exactly five numbers, every month, nothing else** — per the operating guide's own
explicit constraint:
- Sessions
- Conversion rate
- Orders
- Revenue (net sales)
- Email list growth (new subscribers)

Each with a month-over-month comparison. No narrative, no extra metrics, no commentary
— the operating guide is explicit that adding more defeats the point (a report that
takes effort to produce stops getting produced consistently).

**Deliberately scoped to what's already connected.** These five draw only from Shopify
and Klaviyo, both already wired up. Social metrics (sends-per-reach, non-follower
reach) from the SEO checklist's "steering wheel" table were left out for now, since
that would depend on the social/Meta connector actually working reliably month over
month — worth adding later once that's confirmed, not guessed at now.

**Filling a real gap along the way.** Added
[`jackman-monthly-report-template.md`](../../11%20Marketing%20Operations/06%20Templates%20and%20Forms/jackman-monthly-report-template.md)
— the operating guide's own "put in it first" instruction, never previously built.

## How it runs

| | Where | When | Behavior |
|---|---|---|---|
| **Scheduled task** | `~/.claude/scheduled-tasks/jackman-monthly-analytics-report/SKILL.md` (outside this repo — Claude Code scheduled tasks are user-global, not project files) | 1st of every month, 7:15 AM | Silent. Writes the report file and commits it locally (never pushes). Never messages Austin directly. |

Unlike the other specialists, this one runs on a schedule rather than on demand — a
monthly record only works if it happens automatically, without needing to be
remembered.

## What it explicitly does not do

- **Doesn't touch the Jackman Marketing Portal.** That's the daily refresh's territory.
- **Doesn't create or modify Asana tasks.**
- **Doesn't push to git** — commits locally so the record exists, but Austin controls
  when it goes to GitHub.
- **Doesn't add a sixth metric or a narrative section**, even if there's something
  interesting to say about a given month — that's what the separate narrative review in
  `00 Marketing Command Center/04 Weekly and Monthly Reviews` is for, and it stays
  Austin's own writing.

## First run

Registered 2026-09-25; next run is 2026-10-01, covering September 2026. Since it's a
new scheduled task, Austin may want to click "Run now" once to pre-approve the Shopify
and Klaviyo connectors so the real monthly run doesn't pause on a permission prompt.

## What's next

See [`../README.md`](../README.md) for the full roster.
