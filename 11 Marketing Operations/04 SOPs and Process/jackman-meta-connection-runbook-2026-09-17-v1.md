# Jackman Marketing — Meta Connection Runbook (Facebook + Instagram → Claude)

**Owner:** Austin Fitzgerald · **Version:** v1 · **Date:** 2026-09-17
**Status:** Decisions D-12/13/15 answered 2026-09-17 · server **built and tested** ·
blocked only on the Meta-side clicking (Phase 0 and steps 2.1–2.6)

**Settled:** read-only access · Austin has full portfolio admin · ad account exists but
is not spending · Austin drives the browser, Claude directs.
**Related:** `project_social-ads-launch`, `project_jackman-marketing-portal`,
`03 Content and Social / jackman-social-strategy-2026-09-15-v2.md`

---

## The one thing to understand before clicking anything

There is no single "connect Meta" button, because Meta itself has split paid and
organic into two different worlds with two different levels of support:

| | Paid (ad campaigns) | Organic (your Page + IG feed) |
|---|---|---|
| Official Meta MCP server | **Yes** — shipped April 29, 2026 | **No. None. Not planned.** |
| Setup effort | ~15 minutes, no code | Custom build, ~2–3 hours once |
| Cost | Free | Free (API access is free) |
| Who holds the token | Meta | You, on this machine |

So this is **two connections, not one.** Paid is a connector you add and log into.
Organic is a small server we build and run locally. Both land in the same Claude
session, and once they are in I can read across them in one breath — which is the
actual point. "Our top three organic Reels this month all lead with the tire bite
shot, and the ad set using that same frame has the lowest CPM" is a sentence that
requires both halves.

### What this will NOT give us (read before Phase 1)

Being honest up front so we do not build a plan on air:

- **No algorithm visibility.** The API reports what happened. It never explains why
  reach dropped. Anyone whose tool claims to know is guessing with confidence.
- **No competitor data.** There is no endpoint for "what is Fuel Off-Road getting per
  post." Competitive tracking stays manual, in `02 Product Marketing / 04 Competitive
  Intelligence`.
- **Claude cannot see the image or video.** The API returns the media URL and the
  numbers, not the frame. If I am going to judge creative, you hand me the file or I
  fetch the URL separately — the connection alone makes me numerate, not visual.
- **Follower demographics have a floor.** Meta withholds audience breakdowns below
  roughly 100 followers in a given segment, so small cuts come back empty, not zero.
- **Short memory.** Several metrics only return about 30 days of daily data, and
  Meta's own UI will not hold your history either. This is why Phase 4 exists.

---

## Phase 0 — Prerequisites audit (20 minutes, no code, do this first)

Almost every failure in this kind of setup traces to one of these five things being
wrong, and each is invisible until a later step blows up. Confirm all five now.

| # | Check | Where | Must be |
|---|---|---|---|
| 0.1 | Instagram is a **Professional** account (Business or Creator) | IG app → Settings → Account type | Business preferred — Creator blocks some publishing |
| 0.2 | IG account is **linked to the Facebook Page** | Page → Settings → Linked accounts | Linked, and to the *right* Page |
| 0.3 | A **Meta Business Portfolio** (formerly Business Manager) exists and owns both | business.facebook.com → Business settings | Both Page and IG listed under *Accounts* |
| 0.4 | You are a **full admin** of that portfolio | Business settings → People → your name | Full control, not Partial or Employee |
| 0.5 | An **ad account** exists inside the portfolio | Business settings → Accounts → Ad accounts | Exists (needed for Phase 1) |

**If 0.3 is missing** — the Page and IG are personal rather than in a portfolio — stop
and fix that first. Creating the portfolio and claiming the assets is free and takes
ten minutes, but doing it *after* we mint tokens means re-minting them.

**If 0.4 is Partial** — you need whoever holds full control to either promote you or
sit with you for steps 2.1 through 2.6. This is the most common hard block.

### 0.6 Connect the *right* Facebook page — you have two

Per `D-11` in the decisions inbox, there are two Jackman pages:

| Page ID | State | Use it? |
|---|---|---|
| `61590115023694` | Live, linked from the website, posting actively | **Yes — this is the one** |
| `61560110244171` | Dark, previously listed the wrong Austin TX address | No — unresolved, see `D-11` |

Connecting the wrong one gives us a clean-looking pipeline reporting on a dead page, and
that error is nearly invisible once numbers start flowing. Verify the ID before the
system user gets its assets in step 2.4, and confirm the IG account is linked to
`61590115023694` specifically in check 0.2.

This also means **`D-11` is now upstream of the analytics build,** not just an SEO
hygiene item. If that second page is ever revived or merged, the follower history in
Phase 4 gets a discontinuity we will need to annotate.

> **Do not send me passwords, tokens, or 2FA codes in chat.** You paste one long-lived
> token into a Windows environment variable yourself in step 2.6, and I never need to
> see its value. If any step appears to ask otherwise, it is wrong — stop and ask.

---

## Phase 1 — Paid ads, via Meta's official MCP (~15 min, no code)

Meta's Ads AI Connectors launched April 29, 2026: one remote MCP endpoint, 29 tools,
covering performance reporting, campaign management, catalog health, and pixel/CAPI
signal diagnostics. No developer app, no token handling on your side.

**Steps**

1. Go to `claude.ai` → **Settings → Connectors → Add custom connector**.
2. Paste exactly: `https://mcp.facebook.com/ads`
3. Save. A Meta login window opens. Sign in with the account holding admin from 0.4.
4. When asked, select **the specific ad account and portfolio** — not "all." Least
   privilege now saves an incident later.
5. Grant scopes. If a read-only option is offered, **take read-only for now** (see D-12).
6. Verify with a read-only prompt: *"Summarize performance for the Jackman ad account
   over the last 14 days, split by campaign."*

**Caveats, in order of likelihood**

- It is **open beta.** Not every advertiser has access yet. If the connector rejects
  you, that is a Meta eligibility gate rather than a mistake on your end — we fall
  back to adding ads coverage to the Phase 2 server, since the Marketing API underneath
  is the same data.
- `ads_management` is what permits *changes.* With read scopes only, I analyze and
  recommend and you click publish. Recommended starting posture.
- Campaign writes through this connector create objects **paused by default.** A good
  guardrail, but it means "launched" always still needs a human unpause.

---

## Phase 2 — Organic Page + Instagram, via a local MCP server

This is the half with no official option, so we build it. Small: one Node project, a
handful of endpoints, read-only to start.

### Why local rather than a hosted third-party server

Several hosted "Instagram MCP" and "Meta social MCP" services exist, and they work.
Using one means handing a non-expiring token for the Jackman Page and IG account to a
third party, where it sits until revoked. For a brand whose social presence *is* the
top of the funnel, that trade is not worth the two hours saved. We run it on your
machine and the token never leaves it.

### 2.1 Create a Meta developer app

1. `developers.facebook.com` → **My Apps → Create App**
2. Use case: **Other** → Type: **Business**
3. Name: `Jackman Marketing Internal` — this name shows up in audit logs, so make it
   obvious what it is a year from now.
4. **Attach the Jackman business portfolio.** Not "no business portfolio." A detached
   app cannot use system user tokens, which is the whole plan.

### 2.2 Add the products

In the app dashboard add **Instagram** (Instagram Graph API) and **Facebook Login for
Business**. Add **Marketing API** too if Phase 1 was blocked.

### 2.3 Confirm Standard Access is enough — it is

This step saves weeks, so it is worth being precise.

Meta gates permissions at two levels. **Advanced Access** requires App Review plus
Business Verification, takes weeks, and wants a screencast justifying data use.
**Standard Access** is self-serve and instant, and it covers *accounts you own or
manage and have added to your app.*

Jackman's Page and IG are accounts you own. **Standard Access is sufficient and we do
not need App Review.** Do not let a blog post talk you into starting one.

Permissions to enable at Standard Access, read-only posture:

- `pages_show_list` — enumerate your Pages
- `pages_read_engagement` — Page content and engagement
- `read_insights` — Page insights
- `instagram_basic` — IG account and media
- `instagram_manage_insights` — IG insights (the important one)
- `business_management` — resolve assets via the portfolio
- *(only if D-12 says publish)* `instagram_content_publish`, `pages_manage_posts`

### 2.4 Create a system user

Normal user tokens expire in about 60 days, which means a connection that silently
dies every two months. System user tokens **do not expire unless revoked.** For
anything unattended this is the only sane choice.

1. `business.facebook.com` → **Business settings → Users → System users → Add**
2. Name: `jackman-marketing-automation` · Role: **Employee**, not Admin — it only needs
   to read the assets we assign it.
3. **Add assets** — the step people skip. Assign the **Facebook Page**, the
   **Instagram account**, and the **ad account** individually, each with specific task
   permissions. A system user with no assigned assets authenticates fine and then
   returns empty arrays for everything, which looks exactly like a broken token and
   costs an hour to diagnose.

### 2.5 Generate the token

1. Same screen → your system user → **Generate new token**
2. App: `Jackman Marketing Internal`
3. **Leave "token expires in 60 days" OFF.** It is on by default in some flows, and it
   is the one checkbox deciding whether we are back here in November.
4. Select every scope from 2.3.
5. Copy it once. It is never shown again.

### 2.6 Store it so it never reaches the cloud or git

**This matters more than it looks.** Your marketing department folder is inside
OneDrive *and* is a git repo. A token in a file there syncs to the cloud and is one
`git add .` from being committed. `.gitignore` already blocks `*credential*` and
`*password*` patterns, but a file named `.env` sails straight through.

So the token goes into a **Windows user environment variable**, which lives in the
registry — not synced, not in the repo, not in any folder:

```bash
setx JACKMAN_META_TOKEN "paste-the-token-here"
```

Run that in a normal terminal, not elevated. Then close and reopen the terminal and
Claude Code — `setx` only affects newly started processes.

Verify it took, without printing the value:

```bash
node -e "console.log(process.env.JACKMAN_META_TOKEN ? 'present, ' + process.env.JACKMAN_META_TOKEN.length + ' chars' : 'MISSING')"
```

### 2.7 Resolve your IDs

Two IDs are needed and neither is the number in your profile URL. I run these once the
token is in place:

- Page ID and Page token: `GET /me/accounts`
- IG Business Account ID: `GET /{page-id}?fields=instagram_business_account`

These go into a gitignored local config. IDs are not secrets, but they are
account-specific and do not belong in a synced doc.

### 2.8 Build the server — **DONE, 2026-09-17**

Built and smoke-tested at `C:\Users\AustinFitzgerald\jackman-meta-mcp`. Plain
JavaScript ESM rather than TypeScript — no build step to break on a machine where
nobody is watching a compiler, and Node 22.11 runs it directly.

**Eight read-only tools**, verified handshaking over stdio with `node
test-handshake.mjs` (passes with no credentials present, three consecutive runs).

Commands:

```bash
npm run whoami     # verify token, confirm assets are assigned, print the IDs
npm run probe      # ask Meta which metrics are live today
npm run snapshot   # append one day to the CSV history
```

The test asserts that **no write-capable tool is exposed.** If a future version gains
one, that test fails and the diff shows it — which is the point.

| Tool | Returns |
|---|---|
| `ig_account_insights` | reach, views, engagement, follower change over a window |
| `ig_media_list` | recent posts and Reels with type, caption, timestamp, permalink |
| `ig_media_insights` | per-post reach, views, saves, shares, watch time |
| `ig_audience` | follower and reached-audience demographics (above the ~100 floor) |
| `fb_page_insights` | Page impressions, engagement, follower adds and removes |
| `fb_page_posts` | recent Page posts with engagement |

**Pin the API version in one constant.** Meta ships a new Graph API version every few
months and deprecates on a schedule. A hardcoded version scattered across six
functions is a future afternoon lost. One `GRAPH_VERSION` constant, currently `v25.0`
(confirmed released February 2026 — I will check the dashboard for anything newer and
pin whatever is current at build time).

### 2.9 Probe the metric names before trusting any of them

Meta has been aggressively deprecating insight metrics, and I will not hand you a
dashboard built on names that return errors:

- `impressions` — **deprecated** on media and user insights, all versions, as of
  April 21, 2025. Replaced by `views`.
- `plays` — **deprecated** on media insights, same date. Also `views`.
- `video_views` (non-Reels), `profile_views`, `website_clicks`, `phone_call_clicks`,
  `text_message_clicks`, `email_contacts` — **deprecated** as time series,
  January 8, 2025.

`views` is now the single cross-format number: feed, carousel, Reels, Stories.

So the first thing after the token works is a probe script requesting each candidate
metric and recording which return data, which error, and which come back empty. That
output becomes the metric contract the tools are built against. Twenty minutes that
prevents a month of quietly wrong numbers.

### 2.10 Register the server with Claude

A `.mcp.json` at the department root, referencing the environment variable rather than
the value, so the file is safe to commit:

```json
{
  "mcpServers": {
    "jackman-meta": {
      "command": "node",
      "args": ["C:/Users/AustinFitzgerald/jackman-meta-mcp/src/index.js"],
      "env": { "META_ACCESS_TOKEN": "${JACKMAN_META_TOKEN}" }
    }
  }
}
```

Note the server code lives **outside** OneDrive, at
`C:\Users\AustinFitzgerald\jackman-meta-mcp`. Node projects generate thousands of
`node_modules` files, and OneDrive will try to sync every one of them — slow, and a
good way to corrupt a build.

---

## Phase 3 — Safety posture

Worth deciding deliberately rather than discovering later.

- **Read-only until proven.** Two weeks of me reading and recommending before any write
  scope is added. Cheap insurance against an agent with `ads_management` having an
  interesting afternoon.
- **Separate tokens.** The Phase 1 connector and the Phase 2 system user are
  independent credentials. Compromising or revoking one does not touch the other.
- **Run the revocation drill once, now.** Know where the button is before you need it.
  Business settings → System users → Generate new token invalidates the old one.
  Connectors revoke at `claude.ai` → Settings → Connectors.
- **Quarterly review.** Calendar item: token still works, scopes still minimal, no
  deprecated metrics gone dark.
- **Rate limits are a non-issue at our volume** but they exist (Instagram Graph API is
  roughly 200 calls per hour per user, scaled by impressions). A daily snapshot plus
  ad-hoc queries sits nowhere near the ceiling. Bulk backfills are what trip it.

---

## Phase 4 — The part that compounds: snapshot the history

This is the step to argue hardest for, because it is the only one that gets more
valuable every day it runs and is impossible to backfill if skipped.

Meta's API returns roughly 30 days of daily data for several key metrics, and Meta's UI
is not a warehouse either. Which means **the history of Jackman's social growth does
not exist anywhere unless we start writing it down.** The 25% MoM target is
unfalsifiable without a baseline series, and right now there is not one.

So: a scheduled daily pull appending one flat row per account per day into
`10 Analytics and Insights / 01 Dashboards and Reports / jackman-social-daily-snapshot.csv`.
Small, boring, plain text, diffable in git, readable in Excel forever. Six months from
now that file answers "did the ambassador program actually move follower velocity" in
one query instead of a shrug.

**Written, as `npm run snapshot`.** Two design choices worth knowing:

- **Idempotent per date.** A scheduled task that fires twice must not duplicate a row,
  because this is a series we cannot rebuild.
- **Missing data writes a blank, never a zero.** A blank means "Meta did not return
  this"; a zero means "genuinely nothing happened." Conflating them ruins trend
  analysis in a way that is invisible six months later.

Schedule it once the token works, via Windows Task Scheduler, daily at 07:00:

```bash
schtasks /create /tn "Jackman social snapshot" /tr "cmd /c cd /d C:\Users\AustinFitzgerald\jackman-meta-mcp && npm run snapshot" /sc daily /st 07:00
```

It pulls *yesterday*, not today, so the day is complete when it runs.

Feeds the Marketing Portal artifact directly — same numbers, live.

---

## Phase 5 — What we actually do with it

The connection is plumbing. The reason for the plumbing:

- **Weekly**: which posts over-indexed on saves and shares — the two signals that
  correlate with reach, and the two the `social-review` skill already scores for
  ("would anyone send this?"). Then make more of what earns sends.
- **Weekly**: organic winners become paid creative. The Phase 1 + Phase 2 join means we
  stop guessing which frame to put budget behind — the organic feed is a free creative
  test lab, and we have just wired the results together.
- **Monthly**: pillar-level performance against `jackman-social-strategy-2026-09-15-v2`
  — do all six pillars earn their slot, or is one carrying four others.
- **Monthly**: the honest 25% MoM read, from Phase 4's series rather than vibes.
- **Per launch**: measure against the baseline, not against the last good week.

---

## Decisions — see `jackman-decisions-inbox.md`

| ID | Question | Answer | Status |
|---|---|---|---|
| D-12 | Read-only, or read + publish? | **Read-only to start**, revisit in two weeks | `PROPAGATED` |
| D-13 | Full admin on the Business Portfolio? | **Yes, full control** — no blocker | `PROPAGATED` |
| D-14 | Ad account ready? Connector eligible? | **Account exists, not spending.** Connector eligibility untested | `DECIDED` |
| D-15 | Who drives the browser clicking? | **Austin drives, Claude directs** | `PROPAGATED` |

---

## What is left, in order

Everything on this machine is done. Everything remaining is on Meta's side, and needs
your hands because it involves logging into the account that controls Jackman's social
presence.

| # | Step | Where | Who |
|---|---|---|---|
| 1 | Phase 0 checks 0.1–0.6 | Business Settings + IG app | Austin, ~20 min |
| 2 | Phase 1 — add `https://mcp.facebook.com/ads` | claude.ai Settings → Connectors | Austin, ~15 min |
| 3 | Steps 2.1–2.5 — app, system user, token | developers.facebook.com + Business Settings | Austin, Claude directing |
| 4 | Step 2.6 — `setx JACKMAN_META_TOKEN` | terminal | Austin |
| 5 | `npm run whoami` then `npm run probe` | terminal | Claude reads the output |
| 6 | Schedule the daily snapshot | Task Scheduler | Claude, once 5 passes |

Step 5 is where I take over. The probe output tells us which metrics Jackman's
accounts actually report, and that becomes the contract every report is built on.
