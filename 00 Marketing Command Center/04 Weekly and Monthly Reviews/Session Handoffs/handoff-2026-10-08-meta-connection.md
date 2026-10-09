# Handoff — Meta connection build — 2026-10-08

**Next step:** Austin taps the Instagram bio link, then check tomorrow's snapshot row —
if `ig_profile_links_taps` is still 0 after a known tap, the metric is broken; if it
reads 1, then 30,188 views with zero taps is real and is the biggest finding we have.

## Decided
- **Read-only access** (`D-12`) — forces every recommendation through Austin, which is
  the review loop that catches a bad read before it becomes a bad post.
- **Custom local MCP server for organic**, not a hosted third party — the token for
  Jackman's Page and IG never leaves this machine.
- **Use-case path, not "Other"**, when creating the Meta app — Meta badged "Other" as
  *going away soon*, and this connection is meant to run unattended for years.
- **Support the existing `social-review` skill rather than build a new one** — its
  weakest line (`SENDABLE?`) is now measurable, and a new skill would fragment judgment
  across three overlapping skills. Discussed and agreed, not yet started.

## Shipped
- **Server live**: `C:\Users\AustinFitzgerald\jackman-meta-mcp` — 8 read-only tools,
  Node 22, smoke test passes. Token in Windows env var `JACKMAN_META_TOKEN`.
- **Both Meta halves connected**: official ads connector verified; organic server
  returning real data (IG @jackmanwheels 946 followers, FB page 34).
- **Metric contract**: `metric-contract.json` — 20 live, 1 empty, 8 dead. Caught 8
  deprecated Facebook metric names, three of which were columns in the snapshot script.
- **Bug fixed**: Page insights need the Page's own token, not the system user token.
  Facebook went 0/8 → 8/8.
- **Daily snapshot scheduled and verified** — Windows task "Jackman social snapshot",
  07:00 daily, `Last Result: 0`. First row written to
  `10 Analytics and Insights\01 Dashboards and Reports\jackman-social-daily-snapshot.csv`.
- **Runbook rewritten against reality**:
  `11 Marketing Operations\04 SOPs and Process\jackman-meta-connection-runbook-2026-09-17-v1.md`
- **Decisions inbox**: `D-12`–`D-15` propagated, `D-16` added (ad account had no payment
  method), `D-02`/`D-11` corrected for the page-ID namespace error.
- **Published page**: https://claude.ai/artifact/FPihzvZwyTZg26e8peBrPz (setup checklist)
- **14-day Instagram read** delivered in chat — not filed anywhere.

## Open
- **Tap the bio link** (10 sec, Austin) — settles whether zero link taps is real.
- **Unassign Page B** `1154414221086645` from the system user. Both pages were assigned
  to discover which was live; Page A `1139927732536365` won.
- **`D-16` — ad account can spend and has zero campaigns.** Card added today; paid
  launch decided 2026-09-14 and still has not started.
- **`D-11` — confirm Page B *is* the dark duplicate** before merging or deleting. It is
  the only other page the portfolio owns, so probably — but nobody has matched the two
  ID namespaces directly.
- **Quarterly review calendar item** (runbook Phase 3) — never scheduled.
- **`social-review` upgrade** — discussed, not done.
- **The 14-day read is chat-only.** If Austin wants it to persist, it needs shipping as
  .docx/.pdf — he cannot open .md.
- **Three access tokens were exposed in chat** during setup. All revoked; the live one
  (4th) was never pasted. No action needed, noted for the record.

## Context the next chat needs
- Server lives **outside OneDrive** deliberately — `node_modules` would sync, and the
  token must never be one `git add .` from a commit. Don't move it into the repo.
- The server reads `JACKMAN_META_TOKEN` **directly**; `.mcp.json` `${VAR}` substitution
  did not work and was removed. Don't reintroduce it.
- `615…` IDs in `D-02`/`D-11` are **URL/profile IDs, not Graph page IDs**. The real ones
  are in runbook section 2.6a.
- Ad account `87976982` is visible but **is not Jackman's** — it holds another
  business's campaigns. Always name `1537776554750013` explicitly.
- Nothing in the repo is committed. `git status` is dirty by design; Austin commits.
- Re-run `npm run probe` after any Graph API version bump. A dead metric reports zero,
  and zero reads as bad performance rather than a broken call.
