# Offroad Expo Booth Giveaway — Campaign Brief

**Objective:** Use the Off-Road Expo booth to grow the email list — A-frame signage drives
foot traffic to an iPad kiosk where attendees enter to win a set of wheels, converting
non-winners with a 10% off code and pulling everyone toward an Instagram/Facebook follow.
**Audience:** Off-Road Expo attendees, Oct 3–4, 2026 (OC Fair & Event Center, Costa Mesa —
confirmed venue per the Ambassador Program brief, same show).
**Target date:** Entry window **Oct 3–4, 2026** (show days only). Winner drawn and
announced **Monday, Oct 5, 2026**.
**Status:** Draft
**Version:** v1

---

## The idea, as given

Austin is running an in-booth giveaway at Off-Road Expo this weekend: A-frame signs reading
"Win a set of wheels" point attendees to an iPad kiosk sign-up form. One winner gets their
choice of wheel; everyone else on the resulting list gets 10% off. Every entrant gets a
follow-up email, and a follow-us-on-social (Instagram + Facebook) ask rides along with the
whole thing. Needs: the sign-up form, the landing page it lives on, the legal rules for the
giveaway, and the follow-up emails.

**Locked already (not re-litigated here):**
- Entry period Oct 3–4, 2026 only; draw and announce Oct 5, 2026.
- Form/landing page: Klaviyo form embedded on a new Shopify landing page — not a separate
  contest app. iPad sits on this URL in kiosk/guided-access mode for the two show days.
- Prize: one winner, choice of any **Street line** wheel (no forged, no beadlock), up to
  **$2,016.00** retail value.
- Consolation: everyone else on the resulting entrant list gets **10% off, code
  `OREEXPO10`**.
- Eligibility: 18+, US residents only, one entry per person/email.
- Official sweepstakes rules are being drafted separately (outside this brief) and will be
  flagged for Kris Maya's compliance review before publishing. This brief only needs to
  make sure the landing page links to them.

**Assumptions flagged below (not previously specified):**
- **Form fields** — name, email, phone (optional). Email is the only field that matters for
  the list; phone is there only if Austin wants a backup contact method for the winner.
- **Kiosk behavior** — the form should auto-reset to blank after each submission so a booth
  volunteer doesn't have to touch the iPad between entrants.
- **Winner selection is manual, not a Klaviyo automation** — one winner out of what's likely
  a few hundred entries over two days doesn't need a random-draw tool; flagging this as a
  "pick one, tag them" task rather than something to build.

**Two coordination points this research turned up — resolved by Austin on 2026-09-30:**

1. **Ambassador Program scouting is not a focus for this show.** The Ambassador Program
   brief's own scouting plan for this same booth/dates is being de-prioritized — if someone
   with a standout vehicle happens to come by, the booth treats that opportunistically, but
   this giveaway is the booth's actual job for the weekend. No combined script needed; drop
   the ambassador-scouting Stories beat from this show's content plan (see Content Ideas,
   updated below).
2. **The Show Special 10% card is a separate, dealer-channel offer** — not a conflict with
   `OREEXPO10`. No signage distinction needed between the two.

**The giveaway's actual job:** build the email list. Everything below is in service of that
— the prize and the 10% off are what make signing up worth it, not the point of the
campaign.

---

## Website Layout Direction

**New landing page:** a short, single-purpose URL (e.g. `/pages/offroad-expo-giveaway`) —
copy itself is **not** written in this brief; route that draft to
`05 Performance Marketing / 03 Landing Pages` per the standard table once built (this brief
only sets direction, per the Event/Trade Show row that governs where *this* file lives).

Kiosk-first, not desktop-first — this page's only visitor for two days is one iPad at a
booth:
1. **Hero** — "Win a set of wheels" headline (matches the A-frame), one strong Street-line
   lifestyle image, one line stating it's free to enter.
2. **Embedded Klaviyo form** — name, email, phone (optional) fields sized for a touchscreen
   (large tap targets, no tiny checkboxes). Submit button fills most of the screen width.
3. **Inline disclosure, always visible without scrolling past the form** — entry period
   (Oct 3–4, 2026), 18+/US-only, one entry per person, link to official rules. This isn't
   something to bury in a footer on a kiosk page — the person signing up should see it before
   they tap submit.
4. **Social-follow CTA** — Instagram + Facebook icons/links, placed right after the form
   (after the ask that matters — email — not before it).
5. **No site header/nav, no footer menu.** Strip anything that could let a bored attendee
   wander off into the main site and leave the form mid-entry. A single "jackmanwheels.com"
   wordmark link is fine; full nav is not.
6. **Confirmation state** — on submit, the page should show a short "You're entered —
   winner announced Monday, follow us so you don't miss it" message, then auto-return to the
   blank form after a few seconds (kiosk reset, see assumption above).

---

## SEO

- [ ] **SEO-01 — Noindex this page.** It's a two-day kiosk funnel with no evergreen search
  intent behind it; indexing it just adds a thin, soon-stale URL to the site. Low effort.
- [ ] **SEO-02 — Keep it unlinked from main nav and the sitemap.** Reachable only via the
  A-frame/iPad and any social posts that link it directly — same reasoning as SEO-01.
- [ ] **SEO-03 — Decide its fate after Oct 5.** Either unpublish once the winner's announced,
  or repurpose the URL into a general "join our list" page — don't leave a dead giveaway
  page live and discoverable indefinitely.

Final home once actioned: `04 Ecommerce and Web / 04 SEO`.

---

## Email Marketing

**Angle:** Two emails, one list, split after the draw.

**Audience/segment:** Klaviyo list **"ORE List"** (id `Ri82df`) — populated directly by the
kiosk form. After the Oct 5 draw, manually tag the winner's profile so the list splits into
"Winner" (1 person) and everyone else.

**1. Winner email**
**Subject (draft):** "You won — let's get you your wheels"
**Preheader (draft):** "Pick your set from the Street line."
**Angle:** Direct, warm, a little excited without overselling it — confirm the win, explain
next steps (how they choose their Street-line set, how it ships/gets arranged), include the
social-follow ask.

**2. Everyone-else email**
**Audience/segment:** The same list, minus the winner.
**Subject (draft):** "Didn't win? Here's 10% anyway"
**Preheader (draft):** "Thanks for stopping by the booth — this one's on us."
**Angle:** Warm, not apologetic — frame the 10% as a genuine thank-you for coming to the
booth, not a consolation prize that undersells itself. Include code `OREEXPO10` and the
social-follow ask.

### Build notes for Klaviyo
- **Built 2026-10-01:** list **"ORE List"** (id `Ri82df`) and a draft embedded form, **"ORE
  Giveaway Entry Form"** (id `Y4s2uL`) — Name, Email, Phone (optional), submits to ORE List.
  The phone field is explicitly set to `phone_number_only` consent, so collecting it does
  **not** imply SMS-marketing opt-in — no separate consent checkbox was added, since the
  brief only ever called for phone as a backup contact method. The form itself is still in
  **draft** status in Klaviyo — needs review and publishing, then embedding on the Shopify
  landing page (see that draft's build notes).
- Winner flag is manual (see assumption above) — this drives a simple list-minus-one segment
  for email #2, not a conditional flow branch.
- Confirm `OREEXPO10` is built as a one-time-use-per-customer code in Shopify before this
  email sends, and confirm with Austin whether it needs an expiration date.
- Both emails carry the same Instagram/Facebook follow CTA — build it once as a reusable
  content block rather than two separate ones.

---

## Content Ideas

- **Pre-show teaser (Wed/Thu before the show)** — Pillar: Branding (reach strangers).
  Real Street-line wheels on a real build, "we're at Off-Road Expo this weekend — come win
  a set," booth location. Job is getting people who weren't already planning to stop by to
  add the booth to their list.
- **Show-day Stories** — Pillar: Branding (reach strangers), secondary Partnerships beat if
  a standout vehicle shows up opportunistically. The booth's single focus for this show is
  the giveaway — line at the kiosk, A-frame signage, entries ticking up. Ambassador
  scouting is not a planned beat for this show's content; only shoot it if something
  genuinely stands out, per Austin's call.
- **Day-two reminder post** — Pillar: Branding (reach strangers). Last-call framing ("last
  day to enter"), booth location again, for anyone who saw day one and hasn't come by yet.
- **Winner announcement (Oct 5–6, feed post + Reel)** — Pillar: Partnerships (borrowed
  reach). Feature the actual winner if they're willing — this is the one piece of content
  in the whole campaign most likely to get shared into the winner's own network, which is
  the real definition of borrowed reach. Needs the winner's permission/UGC release before
  posting (per the standing UGC process).

All of the above are social-post-shaped — run through `social-review` before shooting or
scheduling, per standard practice.

---

## Task checklist (proposed — not created in Asana)

- [x] Build the Klaviyo embedded form + new list — done 2026-10-01: "ORE List" (`Ri82df`) +
  "ORE Giveaway Entry Form" (`Y4s2uL`, still draft status, needs publishing + embedding)
- [ ] Build the Shopify landing page (kiosk layout above) — route copy to Website agent
- [ ] Put the booth iPad into guided-access/kiosk mode pointed at the landing page URL
- [ ] Finalize and print the A-frame signage ("Win a set of wheels")
- [ ] Finish the official sweepstakes rules draft and route to Kris Maya for the
  Sponsor-address compliance check before anything goes live
- [ ] Create the `OREEXPO10` discount code in Shopify (confirm usage limit/expiration)
- [ ] Draft and queue the pre-show, show-day, and winner-announcement posts
- [ ] Draw and tag the winner in Klaviyo on Oct 5, then send both follow-up emails

---

## Brand guardrail check

No finish named for the prize (correctly left as "choice of Street line" rather than
guessing a specific finish). No load rating, certification, or part-number claims anywhere
in this brief. No founder names. No militarized language in any draft subject line or
headline. "Win a set of wheels" / "Win a free set of wheels" framing already settled in an
earlier conversation (dropped "free" as redundant with "win"). Every draft subject line,
headline, and CTA above is directional only — the `humanizer` pass and a final
brand-guardrail check still need to run on the actual landing page and email copy once the
Website and Email specialists draft it word-for-word.

---

## Why it's built this way

**Email first, discount second.** The list is the asset that outlasts the show — the 10%
off exists to make losing feel worthwhile, not the other way around. Structuring the two
follow-up emails around "you won" vs. "thanks for coming, here's something anyway" keeps
the discount from reading as the actual prize.

**Kiosk-first page, not a scaled-down desktop page.** A booth iPad gets used by someone
standing up, in sunlight, possibly mid-conversation with a staffer. Stripping nav, maxing
tap targets, and auto-resetting after each entry treats the page as a kiosk tool first and a
webpage second — the opposite of how most landing pages get built.

**Noindex and unlinked.** A two-day entry window has no search intent to capture; indexing
it only creates a stale URL to clean up later. Better to treat it the way the Off-Road Expo
show special card is treated — a show-specific asset, not a permanent site page.

**One job for this booth.** Two things that looked like they might compete with this
campaign — the Ambassador Program's scouting plan and the existing dealer-channel Show
Special card — turned out not to. Austin confirmed both on 2026-09-30: ambassador scouting
is opportunistic only, not a planned beat, and the Show Special card is a separate dealer
offer. That leaves the booth with one clear job for the weekend: grow the list.

---

**FILE →** `08 Events, Motorsport and Partnerships / 01 SEMA and Trade Shows / Off-Road Expo 2026` / `jackman-campaign-brief-offroad-expo-giveaway-2026-09-30-v1.md`
