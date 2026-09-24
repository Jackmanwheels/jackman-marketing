# Executive Assistant

The lead agent of the Marketing Crew. Every future agent gets built underneath this one,
one at a time.

## What it owns

**1. The daily Portal refresh.** Every morning at 6:30am, it pulls yesterday's Shopify
and Klaviyo numbers and writes a fresh diagnosis (wins / watch / fixes) into the
[Jackman Marketing Portal](https://claude.ai/code/artifact/765dbcc2-6ed2-413a-9e3e-65683f2bb34a)
— sessions, conversion, orders, email performance, top pages, a 14-day trend. This isn't
new work; it absorbed the task that used to just be called "the daily marketing
refresh."

**2. Decision & task triage.** Same daily run, same silent write to the Portal: it reads
the [decisions inbox](../../00%20Marketing%20Command%20Center/06%20Standards%20and%20Conventions/jackman-decisions-inbox.md)
for anything still `OPEN`, and checks Asana for overdue and undated tasks. This is new —
it's the first thing the EA does that the old refresh task never did.

## How it runs

| | Where | When | Behavior |
|---|---|---|---|
| **Scheduled job** | `~/.claude/scheduled-tasks/jackman-daily-marketing-refresh/SKILL.md` (outside this repo — Claude Code scheduled tasks are user-global, not project files) | Daily, 6:30am | Silent. Writes to the Portal's `dashboard/latest` and `dashboard/triage` docs. Never messages Austin directly. |
| **On-demand check-in** | [`.claude/skills/executive-assistant/SKILL.md`](../../.claude/skills/executive-assistant/SKILL.md) (in this repo) | Whenever Austin asks | Interactive. Answers directly in chat instead of writing to the Portal. |

## What it explicitly does not touch

The Portal's `portal/` collection — weekly social entries, the CRO change log, portal
tasks, competitor notes, meeting records, Playbook standing — is Austin's own
manually-maintained data. Neither the scheduled job nor the on-demand skill writes to
it.

## Known gap

The Portal's dashboard UI doesn't yet render `dashboard/triage` — the data is being
written, but there's no panel showing it when Austin opens the artifact. Until the
Portal's HTML is updated to add that panel, the on-demand skill (`.claude/skills/executive-assistant`)
is the reliable way to see triage output; the scheduled job's copy is only visible via
the database directly.

## What's next

Specialist agents get added under `agents/` one at a time, as Austin decides to build
them — see [`../README.md`](../README.md) for the roster.
