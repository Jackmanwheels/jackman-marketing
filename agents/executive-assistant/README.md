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

**2. Decision triage.** Same daily run, same silent write to the Portal: it reads the
[decisions inbox](../../00%20Marketing%20Command%20Center/06%20Standards%20and%20Conventions/jackman-decisions-inbox.md)
for anything still `OPEN` and writes it to the Portal's `dashboard/triage` doc, which now
renders as an "Open decisions" panel on the Portal's Today tab. This is new — it's the
first thing the EA does that the old refresh task never did.

It deliberately does **not** also triage Asana in that daily write. The Portal's own
"Tasks" tab already pulls Asana live, in-browser, in real time (its own MCP watcher,
with overdue/undated grouping) — a once-a-day snapshot would just be a staler duplicate.
Decisions triage stays here only because the Portal has no filesystem access and can't
read that file itself.

## How it runs

| | Where | When | Behavior |
|---|---|---|---|
| **Scheduled job** | `~/.claude/scheduled-tasks/jackman-daily-marketing-refresh/SKILL.md` (outside this repo — Claude Code scheduled tasks are user-global, not project files) | Daily, 6:30am | Silent. Writes to the Portal's `dashboard/latest` and `dashboard/triage` docs. Never messages Austin directly. |
| **On-demand check-in** | [`.claude/skills/executive-assistant/SKILL.md`](../../.claude/skills/executive-assistant/SKILL.md) (in this repo) | Whenever Austin asks | Interactive, in a Claude Code chat (no live Asana view there, so this one *does* pull Asana overdue/undated directly). Answers in chat instead of writing to the Portal. |

## What it explicitly does not touch

The Portal's `portal/` collection — weekly social entries, the CRO change log, portal
tasks, competitor notes, meeting records, Playbook standing — is Austin's own
manually-maintained data. Neither the scheduled job nor the on-demand skill writes to
it.

## What's next

Specialist agents get added under `agents/` one at a time, as Austin decides to build
them — see [`../README.md`](../README.md) for the roster.
