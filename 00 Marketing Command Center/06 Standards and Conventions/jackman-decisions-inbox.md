# Jackman Marketing — Decisions Inbox

**Owner:** Austin Fitzgerald · **Living file — deliberately undated and unversioned.**
It is an index, like `MEMORY.md`. Never fork it, never make a `-v2`. Edit in place.

---

## What this is

The one place you write answers. I read this file at the start of any session where a
decision might be blocking work, and I propagate what's changed into every document it
touches.

Before this existed, an answer like "the founding date is 1968" lived in a chat message
and died there — while six documents and a hard guardrail kept saying the opposite.

## How to use it

Find the item. Write your answer on the **`ANSWER:`** line. Change **`Status:`** to
`DECIDED`. That's it — you don't need to touch anything else, and you don't need to know
what it affects.

Then tell me "check the decisions inbox" (or just mention the decision in passing). I
handle propagation and flip the status to `PROPAGATED` with a list of what I changed.

**Status values**

| Status | Meaning |
|---|---|
| `OPEN` | Waiting on you. Something downstream is blocked. |
| `DECIDED` | You've answered. I haven't propagated it yet. |
| `PROPAGATED` | Answer is live in every document that referenced it. |
| `PROPOSED` | I've written a change proposal; awaiting brand-owner ratification. |

**One rule:** if a decision changes a numbered guardrail in
`jackman-claude-instructions.md` or anything in the `jackman-brand-guidelines` skill, I
do **not** edit the source. Governance is explicit — one canonical guide, nobody forks
it. I write a Brand Change Proposal with redlines and the brand owner applies it. Status
stays `PROPOSED` until they do.

---

## D-01 — Founding date · `B-01`

**Question:** Three founding claims were live in market at once. Which is correct?

**ANSWER:** **Established 1968.** Short form: **Est. 1968.**

**Status:** `PROPAGATED` — decided 2026-09-15, **ratified and applied 2026-10-06.**

Applied to: guardrail #5 in `jackman-claude-instructions.md` · `brand-facts.md` in the
`jackman-brand-guidelines` skill *(missed in the original proposal — caught 06 Oct)* ·
`social-review` SKILL.md and the session-prompt SOP *(both defer to this Status line, so
they resolved automatically)* · `chief-of-marketing` SKILL.md · social strategy v2 ·
social playbook v1 · both pre-flight checklists.

**Still outstanding:** `B-05` Our Story page · `B-06` homepage line · `B-07` sourcing.
Those are live-site copy, not governance.

**Unblocked:** `P-02` IG bio · `C-05` heritage weekly slot · `L-05` heritage media pitch ·
the entire Heritage pillar · the "Established 1968. Rebirthed 2026." positioning.

**Two things this decision does *not* settle — worth a look before it ships wide:**

1. **The Our Story page.** It places the hand-built wheels in the **mid-1970s**. That
   may not actually be a contradiction — a company founded in 1968 can plausibly be
   hand-building wheels in 1975 — but right now the page reads as a second origin date.
   It needs one sentence establishing 1968 as the founding and the mid-70s as a later
   chapter, or it undercuts the claim we just committed to.
2. **The homepage** says "California-born since the 1960s," which is *consistent* with
   1968 but vaguer than we now need to be. Tighten it to the specific year.

**And the honest flag:** the original risk was a skeptic disproving the date in a single
click. A decision resolves the *inconsistency*, not the *disprovability*. If there's a
document, ad, catalog or incorporation record behind 1968, get a scan into
`01 Brand and Creative` — a sourced heritage claim is a different asset than a stated
one, and the sourced version is what earns press. Not a blocker. Worth doing.

---

## D-02 — Headquarters address · `B-02`

**Question:** Site legal pages say 15500 Cornet St., Santa Fe Springs, CA 90670.
The Facebook page says Austin, TX. Which is the real NAP address?

**ANSWER:** **15500 Cornet St., Santa Fe Springs, CA 90670.** The legal pages were
right; the Austin, TX listing was wrong and is already dark.

**Canonical NAP string — use this character-for-character, everywhere:**

```
15500 Cornet St.
Santa Fe Springs, CA 90670
```

**Status:** `PROPAGATED` — answered 2026-09-15. `B-02` closed in the SEO checklist;
`L-01` and `W-02` unblocked; `L-04` given the canonical string.

**The other two NAP fields were settled the same day** — name and phone, in `D-10`. The
complete canonical block lives there; this item holds the address alone.

**Update 15 Sep 2026 — the Austin TX source has gone dark, and there appear to be two
Facebook pages.** Kevin's audit cited page ID `61560110244171` as the one listing Austin,
TX. That page now returns *"This content isn't available right now."* The page the
website actually links to is a **different ID — `61590115023694`** — with 23 followers,
posting actively, and no address in its public Intro.

**ID correction, 2026-10-08:** both page IDs quoted above are URL/profile IDs, not Graph
page IDs — see `D-11` for the real ones (`1139927732536365` is the live page). The
address decision is unaffected; the identifiers are not.

So this was a stale-duplicate-page problem rather than a genuine address dispute.
**It was two questions, not one:**
1. What is the correct HQ address? — **answered above, 15 Sep 2026.**
2. Do we control the old page `61560110244171`, and should it be merged or removed?
   — **carved out to `D-11`.** It is a separate piece of work with a separate owner,
   and leaving it inside a closed item is how it gets forgotten.

---

## D-03 — `jackmanwheels.shop` domain · `B-03`

**Question:** Is this domain ours? Registered Aug 2024, expires 2027, still indexed by
Google as "OFFICIAL JACKMAN WHEELS STORE," currently not resolving.

**ANSWER:**

**Status:** `OPEN` — **question sent 15 Sep 2026** (`B-03` closed). Awaiting counsel.
The checklist item was "ask"; this line is "what came back." Write the answer here when
it lands.

**If ours:** revive with a 301 or let it lapse deliberately. **If not:** counsel's call.

---

## D-04 — TikTok and YouTube accounts · `P-06`

**Question:** Do these exist? Kevin found no public presence, but there's a
`03 Video and YouTube` folder in the department.

**ANSWER:** **Yes — both exist and both are empty.** Verified live 15 Sep 2026.

**Status:** `PROPAGATED` — `P-06` closed. Kevin's "no findable presence" was wrong; the
handles were already claimed, they're just unused.

| Platform | Handle | State |
|---|---|---|
| YouTube | `@JackmanWheels` | Channel live, **"This channel doesn't have any content"** |
| TikTok | `@jackmanwheels` | Live, **0 posts, 0 followers, no bio** |
| X / Twitter | `@jackmanwheels` | Linked from the site — not in Kevin's audit at all |

**What this changes:** `P-08` (cross-posting) has no setup cost — it's pure execution
from day one. Also fill the TikTok bio; an empty bio on a claimed handle is worse than
no handle, because it's the version a searcher finds.

---

## D-05 — Founder names in consumer copy

**Question:** Retire "Harry and Sheryl" from consumer-facing copy?

**ANSWER — revised 2026-09-23, supersedes the 2026-08-26 answer below.** Not a full
retirement. **Founder names stay, but in exactly one place: the website's Our Story
section.** Naming them again elsewhere — social, email, press, dealer materials, PDPs,
ads — is redundant now that Our Story tells that story once, canonically. Everywhere
outside Our Story, the unnamed heritage phrasing (garage, hand-built, "members of the
original Jackman family involved") still applies exactly as the original proposal
wrote it.

*Original 2026-08-26 answer, for the record:* "Yes — keep the family, unnamed,"
everywhere including Our Story. That's the part being revised — everything else about
the original proposal (the replacement vocabulary for every other channel) stands.

**Status:** `PROPAGATED` — applied 2026-09-23. Guardrail #16 in
`jackman-claude-instructions.md` and rule `G16` in `scripts/brand_check.ps1` (downgraded
BLOCK → WARN, since a regex can't tell whether a hit is on the Our Story page) both now
reflect this. See
`01 Brand and Creative/01 Brand Guidelines and Tokens/jackman-brand-change-proposal-founder-names-v2.md`
(supersedes v1) for the full redline. **Not yet propagated:** the `jackman-brand-guidelines`
plugin's own reference files, and v1's redline list of live copy needing re-issuing
(boilerplates, pitches, press template, dealer materials) — none of that is in this
repo's reach.

**Resolved 2026-09-23 — leave the J68 occurrence as-is.** The CRO agent's investigation
found "Harry and Sheryl Jackman" in the Wheel Details section of the J68 product page
and flagged it as outside Our Story. Austin's call: leave it. That passage **links back
to Our Story** rather than re-telling the story standalone, and the specific fact it's
carrying — the Classic 68 is a spin-off of the original wheel Harry and Sheryl built —
is model-provenance, not a repeated heritage beat. **Refined rule for future review:**
guardrail #16's "exactly one place" means the names aren't re-told as their own heritage
narrative outside Our Story — a page that names them once, in service of a specific
fact (this model's direct lineage), and links to Our Story rather than repeating it, is
the intended exception, not a violation.

---

## D-06 — Load ratings

**Question:** When does engineering release load ratings?

**ANSWER:** **They're already known — no need to wait on engineering.** 5-lug and 6-lug
wheels are rated to **2650 lbs**. 8-lug wheels are rated to **4500 lbs**. Spec cells can
state the number for that wheel's lug pattern.

**This does not lift the certification prohibition.** No JWL / VIA / SAE / TÜV claim —
Austin confirmed the weight figures, not a certification standard. Those two are
different claims and guardrail #4 conflated them; the redline separates them.

**Status:** `PROPAGATED` — applied 2026-09-23. Guardrail #4 in
`jackman-claude-instructions.md`, rule `G4` in `scripts/brand_check.ps1`, and the PDP
audit line in `jackman-marketing-department-operating-guide.md` all now reflect this.
See `01 Brand and Creative/01 Brand Guidelines and Tokens/jackman-brand-change-proposal-load-ratings-v1.md`
for the full redline. **Not yet propagated:** the `jackman-brand-guidelines` plugin's
own reference files — outside this repo's reach.

**Worth knowing:** the J68 Classic 68 (5x5, 5-lug) PDP already shows "Load Rating (lbs):
2650" — it was live before this was authorized, and it turns out to already be correct.
No copy fix needed there; the guardrail was catching up to a number that was already
right.

---

## D-07 — SKU / part number encoding

**Question:** What is the confirmed part number structure?

**ANSWER:**

**Status:** `OPEN` — blocked on Clyde Wheeler.

**Until then:** never construct a part number. Transcribe from a source list or omit.

---

## D-08 — Brand colour palette

**Question:** Is `brand-tokens.json` final, or still provisional?

**ANSWER:**

**Status:** `OPEN`

**Note:** bronze on graphite fails contrast at 2.87:1 and shouldn't be specified
regardless of how the palette resolves.

---

## D-09 — Marketing budget approval

**Question:** What is actually approved? The social ads test was scoped at $2–2.5k/mo.

**ANSWER:**

**Status:** `OPEN`

**Standing rule:** nothing is approved because it appears in a document. A number in a
plan is a proposal until you say otherwise here.

---

## D-10 — NAP name and phone number

**Question:** Two of the three NAP fields are still unset. Which business name goes on
the Google Business Profile and every directory — **Official Wheel Company** (the legal
entity on the site's legal pages) or **Jackman Wheels** (the brand)? And what phone
number do we publish?

**ANSWER:** **Name is Jackman Wheels.** No Official Wheel Company callout in marketing —
profiles, directories, schema, listings, all of it reads Jackman Wheels.
**Phone is 562-946-4800.**

**Canonical NAP block — character-for-character, every listing, no variants:**

```
Jackman Wheels
15500 Cornet St.
Santa Fe Springs, CA 90670
562-946-4800
```

For `schema.org` markup the `telephone` value takes the international form,
**`+1-562-946-4800`** — that is the schema convention, not an inconsistency with the
display format above. Everywhere a human reads it, use `562-946-4800`.

**Status:** `PROPAGATED` — answered 2026-09-15. `L-01` and `L-04` unblocked; `W-02`
Organization schema now has every field it needs.

**NOT COVERED BY THIS ANSWER — one carve-out, and it is a legal question, not a brand
one.** "No Official Wheel Company callout" is the right answer for marketing surfaces.
It does not extend to **legal-entity disclosure**: the email footer
(`jackman-email-offroad-expo-2026-v2.md`, build notes) names Official Wheel Company as
the legal entity, and the site legal pages do the same. Commercial-email sender
identification and the entity named in terms and privacy pages are compliance
requirements with their own rules, and stripping the entity name out of them is not a
marketing call. **Route to Kris Maya before changing any footer or legal page.** Nothing
has been changed on that basis.

---

## D-11 — Duplicate Facebook page

**Question:** Do we control page ID `61560110244171` — the one Kevin's audit found
listing Austin, TX, now returning *"This content isn't available right now"* — and should
it be merged into `61590115023694` or removed?

**ANSWER:** Still open on the merge question. But **the IDs in this item are the wrong
kind of identifier**, corrected 2026-10-08.

`61560110244171` and `61590115023694` are **URL / profile IDs** — the number that
appears in `facebook.com/615…` under the New Pages Experience. The Graph API, and
Business Manager's own asset picker, use a **different ID for the same page**. Searching
the `615…` numbers in Business Manager returns nothing, which reads as "this page does
not exist" rather than "you are searching the wrong namespace." That cost twenty
minutes during the Meta connection build.

**The real Graph page IDs**, both owned by the Jackman Wheel Co. portfolio:

| Graph ID | State |
|---|---|
| `1139927732536365` | **The live page.** Confirmed 2026-10-08 as the only one carrying the Instagram account |
| `1154414221086645` | The other page. Returned nothing from `/me/accounts` |

**What is still genuinely unresolved:** whether `1154414221086645` *is* the dark
duplicate this item describes. It is the only other page the portfolio owns, so it
probably is — but "probably" is what got us here, and nobody has matched the two
namespaces directly. Do that before merging or deleting anything.

**Status:** `OPEN` — carved out of `D-02` on 2026-09-15. IDs corrected 2026-10-08; the
merge-or-remove question is untouched.

**Why it stayed open when the address closed:** the address conflict is resolved because
the bad listing went dark. The *page* is still there. A second brand page splits search
authority and confuses customers even while it is invisible to us, and an unclaimed page
we don't control is worse than one we do — it can come back.

**First step is a question, not a decision:** does anyone at Official Wheel Company have
admin on `61560110244171`? If yes, Facebook can merge it into the live page and the
followers transfer. If no, it's a brand-rights claim through Facebook support, which is
slower. Either way `L-01` and the social profile audit want this settled.

---

## D-12 — Meta access posture: read-only, or read and publish?

**Question:** When we connect the Facebook Page and Instagram account, do I get
read-only access (I analyze and recommend, you post and launch), or read plus write
(I can publish posts and change campaigns directly)?

**ANSWER:** **Read-only to start.** I analyze, report and recommend; you post and
launch. Revisit after two weeks of data we have proven trustworthy.

**Scopes this authorizes:** `pages_show_list`, `pages_read_engagement`, `read_insights`,
`instagram_basic`, `instagram_manage_insights`, `business_management`. Explicitly
**not** `instagram_content_publish`, `pages_manage_posts`, or `ads_management`.

**Status:** `PROPAGATED` — answered 2026-09-17. Runbook 2.3 scope list and Phase 1
step 5 both already reflect read-only; no other document referenced this.

**Why it blocked:** it decides which permission scopes we request in Phase 2.3, and
whether the Phase 1 ads connector gets `ads_management`. Adding scopes later means
re-minting the system user token, so it is cheaper to decide once.

**My recommendation: read-only for the first two weeks, then revisit.** Not caution for
its own sake — the useful reason is that read-only forces every recommendation through
you, which is exactly the review loop that catches a bad read of the numbers before it
becomes a bad post. Once the data is proven trustworthy, publish scope is a ten-minute
change.

**Worth knowing either way:** organic publishing through the API has real limits. Feed
images, carousels and Reels work. Stories are restricted, and the API cannot schedule —
it posts immediately, so any calendar still lives here or in a scheduler.

---

## D-13 — Business Portfolio admin level

**Question:** On the Meta Business Portfolio that owns the Jackman Facebook Page and
Instagram account, do you have **full control**, or partial/employee access?

**ANSWER:** **Full control / admin.** No blocker — the system user path is clear.

**Status:** `PROPAGATED` — answered 2026-09-17. Phase 0 check 0.4 passes; Phase 2 is
unblocked end to end.

**Why it blocked:** creating a system user and assigning it assets requires full admin.
This is the single most common hard stop in this setup, and it fails late — you can get
five steps in before discovering it.

**If the answer is partial:** we are not stuck, but the path changes. Either someone
with full control promotes you, or they run steps 2.4 through 2.6 with you in the room
and you keep the token. Worth finding out before we start clicking.

**Related:** if the portfolio does not exist at all — Page and IG still personal — that
is Phase 0 work and has to happen first, because tokens minted before the assets are
claimed stop working once they are.

---

## D-14 — Ad account readiness and official connector eligibility

**Question:** Is there a live ad account inside the portfolio, and does the official
Meta Ads connector (`https://mcp.facebook.com/ads`) actually work for your account?

**ANSWER:** **Ad account exists, not spending yet.** The best possible timing — we wire
reporting up before the first dollar goes out instead of reconstructing it afterward.

**Connector eligibility: CONFIRMED WORKING, verified 2026-10-08.** The official Meta
Ads connector accepts the account and returns live data. Phase 1 is done, and Phase 2
stays organic-only as planned.

**Status:** `PROPAGATED` — both halves closed 2026-10-08. But verifying it surfaced a
new blocker, carved out to `D-16`.

**What the first real query found (2026-10-08).** Three ad accounts are visible:

| Account | Name | State |
|---|---|---|
| `1537776554750013` | Jackman Wheel Co.'s ad account | **The real one.** Zero campaigns ever, zero spend ever, **no payment method attached** |
| `87976982` | *(unnamed, shows as its own ID)* | **Not Jackman.** Five campaigns for Gallagher Restoration Co, Time Bomb Prints, a framed-print IG post. One still `ACTIVE`, delivering nothing. Zero spend last 14 days |
| `672187568745989` | Shopify: outhousecoffee | Not Jackman, MCP disabled |

**Two things follow.** First, the paid launch has not started — see `D-16`. Second,
`87976982` is a reporting hazard of exactly the same shape as the duplicate Facebook
page in `D-11`: an account we can see, that is not ours to report on. Any future ads
query must name `1537776554750013` explicitly rather than taking the first account back.

**Why it matters:** the connector is in **open beta** as of April 2026, so eligibility
is Meta's call and not something we can force. Fifteen minutes of trying tells us which
path Phase 1 takes.

- **If it works:** paid is done in one sitting, no code, and Phase 2 stays organic-only.
- **If it rejects you:** no drama. The Marketing API underneath is the same data, so we
  add ads tools to the Phase 2 server. Costs about an hour more of build.

**Ties into `project_social-ads-launch`** (decided 2026-09-14, $2–2.5k/mo test across
three segments). Reporting on that spend is much easier with the connection in place
before the first dollar goes out, not after.

---

## D-15 — Who drives the browser during setup

**Question:** For the Meta Business Manager and developer dashboard clicking — do you
drive while I direct, or do I drive in my own browser while you watch?

**ANSWER:** **Austin drives, Claude directs.** Austin clicks through Business Settings
and the developer dashboard; Claude calls the options and flags the failure points.

**Status:** `PROPAGATED` — answered 2026-09-17. Runbook sequencing reflects this: the
server gets built first so it is waiting when the token lands.

**Why this was the recommendation.** Two reasons, one of them non-obvious.

The obvious one: these screens involve logging into the account that controls Jackman's
entire social presence, and the token that comes out is a credential. Your hands on it
is the right default.

The less obvious one: this setup gets done once and then has to be *maintained* —
rotated, re-scoped, revoked in a hurry if something goes wrong. If you have clicked
through it once yourself, Business Settings stops being a place you need me to navigate.
That is worth the extra twenty minutes.

**I can still help live:** you share what you are seeing, I tell you which option to
pick and why, and I flag the two checkboxes that are easy to get wrong (token expiry in
2.5, asset assignment in 2.4).

---

## D-16 — No payment method on the Jackman ad account

**Question:** The paid social launch was decided 2026-09-14 ($2–2.5k/mo test, awareness-first,
three segments). It is now 24 days later and **nothing has run** — the Jackman ad account has
never had a campaign and has no payment method attached. Is the launch still on, and who adds
the card?

**ANSWER:** **Card added 2026-10-08, same day.** Verified: account `1537776554750013` now
reports `has_payment_method: true`, `account_status: ACTIVE`, queryable, USD, minimum daily
budget $1.00. The account can spend.

**Status:** `PROPAGATED` — the payment blocker is closed. **The launch is still not running**,
for a different and more ordinary reason: there are zero campaigns. A card makes an account
able to spend; it does not make it spend. Tracked onward in `project_social-ads-launch`.

**How it surfaced:** asking for a 14-day campaign summary returned nothing, and tracing why
found an account with zero campaigns, zero lifetime spend, and `has_payment_method: false`.
The connection is fine. The campaign never started.

**One blind spot worth recording.** Ads Manager *drafts* cannot be read for this account —
Meta has not rolled that endpoint out to it yet. So if campaigns were staged as drafts rather
than published, this report would not see them and would still say "zero campaigns." Only
published objects are visible to us today.

**Why this did not announce itself.** Nothing errors when an ad account has no payment method
— it just sits there looking configured. The decision was made, the account existed, the box
appeared ticked. Three and a half weeks of the test budget went unspent without a single
warning anywhere.

**The fix is about five minutes** — Business settings → Payment methods → add card — and it is
yours to do, not mine. I do not enter payment details.

**What it costs to leave.** The test was sized to buy a read on three segments. Every week
unspent is a week where the only thing we know about Jackman's paid performance is nothing,
while the reporting pipeline built to measure it sits idle. The ambassador program and the
organic series both assume paid is running alongside them.

**Second question worth answering while you are in there:** does anyone still need the one
`ACTIVE` campaign in account `87976982` (promoting a third Facebook page, `61563381456398`,
unrelated to either Jackman page)? It is delivering nothing today, but an active campaign in
an account nobody is watching is how surprise spend happens.

---

## Closed and propagated

*Nothing yet. Items move here once status is `PROPAGATED` and the change has held for a
full reporting cycle.*
