# Jackman Marketing — Meta Connection Runbook (Facebook + Instagram → Claude)

**Owner:** Austin Fitzgerald · **Version:** v1 · **Date:** 2026-09-17
**Status: COMPLETE — connected and verified 2026-10-08.** Both halves live. Phases 0–4
all done, including the scheduled daily snapshot. Remaining items are housekeeping, at
the bottom of this document.

**Verified live:** Instagram `@jackmanwheels` 946 followers · Facebook Page
`1139927732536365` 34 followers · official ads connector working · 20 metrics confirmed
live · first history row written 2026-10-08.
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

> **Resolved 2026-10-08.** The live page is **`1139927732536365`** — confirmed by
> `meta_whoami`, which returned it as the only page carrying the Instagram account.
> The IDs below are kept because `D-02` and `D-11` still quote them, but see 2.6a:
> they are **URL/profile IDs, not Graph page IDs**, and searching them in Business
> Manager returns nothing.

Per `D-11` in the decisions inbox, there are two Jackman pages:

| Page ID | Namespace | State |
|---|---|---|
| **`1139927732536365`** | Graph | **The live one.** Has the IG account attached. Use this |
| `1154414221086645` | Graph | The other one. Returned nothing from `/me/accounts` |
| `61590115023694` | URL/profile | What `D-02` calls the live page — wrong namespace |
| `61560110244171` | URL/profile | What `D-11` calls the dark duplicate — wrong namespace |

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

> **Rewritten 2026-10-08, from doing it.** Meta replaced the app creation wizard, and
> the original instruction here — "Use case: Other → Type: Business" — is now the wrong
> answer. Corrected below, along with the three things that went wrong on the way.

**Getting to the wizard at all.** Three failures in sequence, each with a different fix:

1. `developers.facebook.com/apps` **redirects to Business Manager**
   (`business.facebook.com/apps/advertising_settings?business_id=…&global_scope_id=…`).
   The `global_scope_id` is the tell: you are in a business-scoped session and the
   developer destination is never honoured.
2. Going direct to `developers.facebook.com/apps/creation/` returns **"Sorry, this
   content isn't available right now."** Same text Facebook uses for the dark duplicate
   Page in `D-11` — it is the generic permission-denied page, not an expired link.
3. **What works:** a private/incognito window, logged into `facebook.com` directly
   (*not* `business.facebook.com`), then the creation URL.

**Stay in that incognito window for all of Phase 2.** Returning to the normal browser
reintroduces the business-scoped session, and Business Manager needs a fresh login in
the incognito window for step 2.4.

If incognito still fails, the next suspect is developer registration — separate from
Business Manager admin, and not granted by it. `developers.facebook.com` → **Get
started**, top right. Free, instant, no review.

**The wizard: App details → Use cases → Business → Requirements → Overview**

| Step | Answer |
|---|---|
| App details | Name `Jackman Marketing Internal` + contact email |
| **Use cases** | Filter **Content management (5)**, tick **both**: "Manage messaging & content on Instagram" and "Manage everything on your Page" |
| Business | **Jackman Wheel Co.** (`3496370563846561`) — never "skip for now" |
| Requirements | Whatever the chosen use cases demand |
| Overview | Review and create |

**Do not pick "Other", even though it is still there.** It sits under *Others (5)* →
*Looking for something else?*, badged **"This option is going away soon."** It grants
the old experience with every permission available, which is genuinely more flexible —
and that is the trap. This connection is meant to run unattended for years. Building it
on a path Meta has already marked for removal guarantees a forced migration at a moment
we do not choose. Same reasoning as 2.9: this project has been bitten by Meta
deprecations twice already.

Also wrong: **"Create an app without a use case"** — an app ID with no permissions, so
you hand-add everything anyway and get none of Other's benefit.

**Two use-case worries, both unfounded.** They read as *publish* use cases ("publish
posts, share stories, moderate comments"), which looks like it contradicts the
read-only posture in `D-12`. A use case sets the **maximum set of permissions the app
may request** — it grants nothing. Scopes are still chosen individually at 2.3 and 2.5.
And use cases **can be added to an existing app later**, so a wrong pick here is not the
rebuild this document originally claimed.

### 2.2 Add the products

Largely handled by the use cases now — selecting them wires up the Instagram and Pages
APIs rather than requiring products to be added by hand. Confirm on the app dashboard
that Instagram and Pages are present, and add **Marketing API** only if Phase 1 was
blocked (it was not — the official connector works, see `D-14`).

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
2. Name: **`Jackman Automation`** — the name that actually works. System user names are
   validated against Facebook's *personal profile* name policy, which is fussier than
   anyone expects. Two rejections on the way there, 2026-10-08:
   - `jackman-marketing-automation` → *"Profile names can't have too many hyphens."*
   - `Jackman Marketing Automation` → *"You choose an invalid System User name."*

   Short and plain wins; the validator wants something that reads like a person's name.
   The name is cosmetic — a label in audit logs, referenced by nothing — so take the
   first one accepted rather than fighting for a preferred string.
   Role: **Employee**, not Admin — it only needs
   to read the assets we assign it.
3. **Add assets** — the step people skip. **Four** categories, not three:

   | Asset type | Assign | Permission |
   |---|---|---|
   | Facebook Pages | Both Jackman pages (see 2.6a) | **Insights** only |
   | Instagram accounts | `jackmanwheels` | **Insights** only |
   | Ad accounts | `1537776554750013` | View performance only |
   | **Apps** | **Jackman Marketing Internal** | **Develop app** |

   **The Apps row is the one that gets forgotten** — this document omitted it until
   2026-10-08, and the failure is opaque: Generate token returns *"No permissions
   available. Assign an app role to the system user or select another app to
   continue."* Nothing says "you skipped the Apps asset." Assign the app, then the
   permission list populates.

   Leave **Content** off everywhere — read its description, it grants create, manage
   and *delete* posts. Insights is `read_insights` and is what the reporting needs.

   And the original warning still stands for the other three: a system user with no
   assigned assets authenticates fine and then returns empty arrays for everything,
   which looks exactly like a broken token and costs an hour to diagnose.

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

### 2.6a ID reference — every identifier in this build

Recorded 2026-10-08, during the live setup. None of these are secrets; all of them are
tedious to reconstruct.

| What | ID |
|---|---|
| Business portfolio (Jackman Wheel Co.) | `3496370563846561` |
| App (Jackman Marketing Internal) | `3578241745683340` |
| System user (Jackman Automation) | `61595005720814` |
| Ad account — the real one | `1537776554750013` |
| Ad account — **not ours**, do not report on | `87976982` |
| Facebook Page A | `1139927732536365` |
| Facebook Page B | `1154414221086645` |

**The page ID correction that cost us twenty minutes.** `D-02` and `D-11` record the
Jackman pages as `61590115023694` (live) and `61560110244171` (dark duplicate). Those
are **URL / profile IDs** — the number in `facebook.com/615…` under the New Pages
Experience. The Graph API uses an entirely different ID for the same page, and
Business Manager's asset picker searches the Graph ID. Searching `61590115023694`
there returns nothing, which looks like the page is missing rather than like the ID is
the wrong kind.

Meta allocates system user IDs out of the same `615…` range, which is how the two get
conflated — note the system user above.

**Both pages were assigned** to the system user, Insights only, so `meta_whoami` can
identify which one carries the Instagram account and real follower counts. Unassign the
other once that is known, and record the winner here.

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

#### Probe results — 2026-10-09, Graph v25.0

**20 live · 1 empty · 8 dead.** Contract stored at
`jackman-meta-mcp/metric-contract.json`. Re-run after any version bump.

**Dead — all Facebook, all `(#100) not a valid insights metric`:**
`page_impressions` · `page_impressions_unique` · `page_fans` · `page_fan_adds` ·
`page_fan_removes` · `page_fan_adds_unique` · `page_posts_impressions` ·
`page_posts_impressions_unique`

**Three of those were columns in the snapshot script.** Unprobed, that CSV would have
written blanks in three of four Facebook columns every day, silently, and the gap would
have surfaced in January while trying to explain a trend. This is the entire argument
for the probe in one sentence.

**Live and not previously known about**, found by widening the candidate list rather
than guessing: `page_daily_follows` · `page_daily_follows_unique` ·
`page_daily_unfollows_unique` · `page_total_actions` · `page_video_views`

**Empty:** `follows_and_unfollows` — accepted, no value. Likely a volume threshold on a
946-follower account rather than a dead metric. Re-probe in a few weeks.

#### The Page access token bug — fixed 2026-10-09

The first probe returned `(#190) This method must be called with a Page Access Token`
for three Page metrics. **Page insights reject the system user token.** The page's own
token comes from `/me/accounts?fields=id,access_token` and is now fetched and cached in
`getPageToken()`. Facebook went from 0 of 8 working to 8 of 8.

Worth noting how this was found: the error *codes* split the failures cleanly — 190
meant "right metric, wrong token," 100 meant "wrong metric." Without surfacing Meta's
full error detail the whole set would have looked like one undifferentiated failure.

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

**Scheduled and verified running, 2026-10-08.** Daily 07:00, pulling *yesterday* so the
day is complete when it runs.

```bash
schtasks /create /tn "Jackman social snapshot" /tr 'cmd /c node "C:\Users\AustinFitzgerald\jackman-meta-mcp\src\cli-snapshot.js" >> "C:\Users\AustinFitzgerald\jackman-meta-mcp\snapshot.log" 2>&1' /sc daily /st 07:00 /f
```

**Call `node` directly — not `npm run snapshot`.** The npm version was tried first and
failed with `Last Result: -1073741510` (`STATUS_CONTROL_C_EXIT`): `cmd` → `npm.cmd` →
`node` picks up a console control event and dies in a non-interactive task session. The
log showed `^C^C` and nothing else. Dropping npm from the chain fixed it, `Last Result:
0`.

**Always verify a scheduled task by running it**, rather than trusting the "SUCCESS:
task created" message — that message only means the *schedule* was registered, not that
the command works:

```bash
schtasks /run /tn "Jackman social snapshot"
schtasks /query /tn "Jackman social snapshot" /fo LIST /v | findstr "Last Result"
```

`Last Result: 0` is success. Anything else, read `snapshot.log`.

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
| D-14 | Ad account ready? Connector eligible? | **Both yes.** Connector verified working 2026-10-08 | `PROPAGATED` |
| D-15 | Who drives the browser clicking? | **Austin drives, Claude directs** | `PROPAGATED` |
| D-16 | No payment method on the ad account | Card added 2026-10-08 — but **still zero campaigns** | `PROPAGATED` |

---

## What is left — housekeeping only

The build is finished. These are loose ends, none of them blocking.

| # | Item | Why it matters | Who |
|---|---|---|---|
| 1 | **Unassign Page B** `1154414221086645` from the system user | Both pages were assigned to find out which was live. Now we know — Page A. Least privilege says drop the other | Austin, 2 min |
| 2 | **Correct the page IDs in `D-02` and `D-11`** | Both record `615…` profile IDs while calling them page IDs. The real ones are in 2.6a. Wrong data in the canonical record | Claude |
| 3 | **Verify `profile_links_taps`** | 30,188 views over 14 days returned **zero** link taps. Either a real conversion problem or a metric not registering. Tap the bio link, check tomorrow's snapshot for a 1 | Austin, 10 sec |
| 4 | **Quarterly review calendar item** (Phase 3) | Token still valid, scopes still minimal, no metrics gone dark. Never actually scheduled | Austin |
| 5 | **`D-16` — zero campaigns** | The ad account can spend and has never been asked to. Paid launch decided 2026-09-14, still not running | Austin |

**Item 3 is the one with teeth.** If link taps are genuinely zero, the organic account
is manufacturing attention that goes nowhere, and that is a bigger finding than anything
in the connection work.
