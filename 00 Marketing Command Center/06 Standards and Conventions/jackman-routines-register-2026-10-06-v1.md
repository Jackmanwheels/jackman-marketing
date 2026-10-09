# Jackman routines register and CRM data contract

Last updated 2026-10-06. This is the one list of scheduled jobs, where each runs, and what each reads and writes in the CRM database. The CRM is currently the artifact "Jackman CRM Concept" (https://claude.ai/code/artifact/b42c6d39-4410-4a05-baf1-deb59f34bc8b); the name will change. Asana is retired as a task source.

## Read this first: the state file is the authority

The daily and monthly routines are steered by the OneDrive file `jackman-growth-metrics.json`, not by their written prompts. Where the two differ, the file wins. As of 2026-10-06:

- The live daily log is `jackman-daily-log-numeric.csv`. The older `jackman-daily-log.csv` is frozen at 2026-09-20 on purpose.
- The growth score counts sessions pace and execution only (community and engagement are not scored since 2026-09-15). The target ladder is `targets_sessions`, based on August 2026 at 1,701 sessions excluding /password landings.
- The weekly Monday community ask is retired. Email list sizes come from Klaviyo automatically. Instagram, YouTube and Facebook have no workable export on this account.
- GA4 arrives as an occasional 28-day rollup direct from Google. A September 1-30 snapshot was supplied by Austin on 2026-10-06.
- Re-baselining the ladder, re-scoring community and changing the score formula are founder decisions. Routines flag them and never change them.

Both the daily and monthly prompts were corrected on 2026-10-06 to defer to this file. Full prompt text: `jackman-routine-daily-morning-brief-2026-10-06-v1` and `jackman-routine-monthly-growth-review-2026-10-06-v1`.

## Target structure: three cadences

| Cadence | Job | Status |
|---|---|---|
| Daily | Daily morning brief | Live (rewritten 2026-10-06, test run sent) |
| Weekly | Friday week-in-review, Monday kickoff, Pit Board recap | Built 2026-10-06 (Friday and Monday not yet run) |
| Monthly | Growth review PDF, analytics one-pager, competitor pulse | Not yet merged or updated |

## Live routines (all Cowork cloud routines, run whether or not the computer is on)

| Name | Routine id | Schedule (UTC cron) | Local time | Output |
|---|---|---|---|---|
| Jackman daily growth brief | trig_01YEBaFeuJqxDj1u9ofetVen | `0 13 * * *` | 6 AM PDT | One email (spec: jackman-routine-daily-morning-brief-2026-10-06-v1.md) |
| Jackman Friday week-in-review | trig_01BK9PWEJ2DJGxxBAoGRVmUH | `0 13 * * 5` | Fri 6 AM PDT | One email, writes weekly_recaps |
| Jackman Monday kickoff | trig_01BFtmXPR8h7Mpyzj1D4h6WT | `0 13 * * 1` | Mon 6 AM PDT | One email, writes weekly_kickoffs |
| Pit Board weekly recap draft | trig_01NURE7yxWz4euZLcrAmBqEU | `0 15 * * 1` | Mon 8 AM PDT | Outlook draft only (unchanged) |
| Jackman monthly growth review PDF v2 (NEW, untested) | trig_01SMwjwiej1CBCVAmSvo638u | `0 14 1 * *` | 1st, 7 AM PDT | PDF + xlsx + cover email; adds SEO, Roadmap, Rivals and "How to read these numbers" pages; reads the CRM instead of Asana; writes monthly_reviews |
| Jackman Monthly Growth Review PDF (v1, to be disabled after v2 passes a test) | trig_019HFZbk6e4ktiEj5j2eAsnT | `0 14 1 * *` | 1st, 7 AM PDT | Old PDF; still uses Asana |

Schedules are fixed in UTC, so they run one hour earlier (local) after daylight time ends on 2026-11-01 unless the cron is changed.

## Local scheduled tasks (run only while the computer is on)

| Task id | Status |
|---|---|
| jackman-daily-marketing-refresh | DISABLED 2026-10-06 (replaced by the daily morning brief) |
| jackman-competitor-pulse-monthly | Enabled, 1st at 7:00 (to be moved to write the CRM Rivals data) |
| jackman-monthly-analytics-report | Enabled, 1st at 7:15 (to be merged into the monthly chain) |

## CRM collections

| Collection | Written by | Read by | Notes |
|---|---|---|---|
| tasks | CRM app, daily brief (approved email tasks only) | all email routines | Fields: name, project, section, due_on, completed, source, notes, subtasks[], created_at, activity[]. Sections: Backlog, Quick Tasks, In Progress, Urgent / Blocking, Done. |
| pipeline | CRM app | CRM app | Ambassador prospects and dealer leads. |
| task_suggestions | daily brief | daily brief, Monday kickoff, Friday recap | Email requests awaiting approval. Doc id S-<date>-<n>. status: pending / approved / dismissed / expired. Austin approves by replying "add 1, 3" or "skip 2" to the daily brief. |
| daily_metrics | daily brief | Friday recap | Doc id = date. Unknown fields are omitted, never zero. Mirrors the OneDrive CSV columns plus updated_at. |
| meta/daily_brief_state | daily brief | daily brief | last_run_at, last_brief_date. |
| weekly_recaps | Friday recap | Monday kickoff | Doc id = that week's Monday. Includes open_task_ids so Monday can compute what was left open. |
| weekly_kickoffs | Monday kickoff | (history) | carried_over_ids, focus_ids, counts. |
| seo_checklist | SEO agent (local) after each audit; seeded 2026-10-06 from the checklist file | monthly report | One doc per item (W-01...), plus `_meta` (last_audit, rank_tracking_connected, search_console_connected). status: open / done / wont_do. |
| monthly_inputs | Austin (pasted to Claude by the 3rd of each month); filed by Claude | monthly report | Doc id YYYY-MM. GA4, Facebook, Instagram and Google Search Console figures with provenance, caveats and a `not_supplied` list. September 2026 filed 2026-10-06. Manual until an API connection exists (a backend task). |
| monthly_reviews | monthly report | local analytics one-pager (five_numbers), next month's report (seo.items_done) | Doc id YYYY-MM. |
| rivals | competitor pulse (local, to be repointed) | monthly report | Doc `latest` plus one per month; same shape as the old `competitors` doc. |

## Still to build
- CRM Rivals and Social tabs (currently placeholders), with collections `rivals` (monthly competitor scan) and `social` (weekly community numbers).
- Monthly chain: one data pull feeding the analytics one-pager, the growth review PDF (add SEO section, roadmap, "what makes a view" callouts) and the competitor pulse.

## Notes for the backend handoff
- Task approval currently happens by email reply parsed by the daily brief. The natural backend replacement is an Approve / Dismiss button on task_suggestions in the CRM.
- completed_at is not guaranteed on tasks today; the recap routines fall back to the activity log. Adding a completed_at timestamp when a task is checked off would make this exact.
- Routines write with the ArtifactData / read_db / write_db interface; a real backend would replace that with an API, keeping the field names above.
