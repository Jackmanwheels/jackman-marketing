# Offroad Expo Giveaway — Website Page Draft

**Page type:** Landing page (kiosk-only)
**Proposed URL:** `/pages/offroad-expo-giveaway`
**Objective:** Capture booth sign-ups on an iPad kiosk at Off-Road Expo (Oct 3–4, 2026)
into Klaviyo, and push every entrant toward an Instagram/Facebook follow.
**Source:** Chief of Marketing brief's Website Layout Direction section —
`08 Events, Motorsport and Partnerships/01 SEMA and Trade Shows/Off-Road Expo 2026/jackman-campaign-brief-offroad-expo-giveaway-2026-09-30-v1.md`
**Status:** Draft — not built in Shopify

---

## On-page SEO

**Title tag:** `Win a Set of Wheels — Jackman Wheels at Off-Road Expo` (55 characters)
**Meta description:** `Enter at the Jackman Wheels booth, Off-Road Expo, Oct 3–4. One winner picks any Street-line set. Everyone else gets 10% off.` (126 characters)
**H1:** `Win a Set of Wheels`

Note: per the campaign brief's SEO-01/SEO-02, this page should carry a `noindex, nofollow`
meta robots tag and stay out of the sitemap — the title/meta above are for the browser tab
and any link-preview card, not for search ranking.

---

## Sections

### Hero

**H1:** Win a Set of Wheels

One lucky winner picks their own Street-line set, on us. Everyone else still walks away
with 10% off.

Free to enter. Takes about ten seconds.

*(Image: one Street-line wheel on a real vehicle, in real light — per the brief, no
specific model or finish named here.)*

### Entry Form

Fields: **Name** · **Email** · **Phone** *(optional)*

Button: **Enter to Win**

### Entry Details *(always visible — not a footer, not collapsed)*

Entries open **October 3–4, 2026** at the Jackman Wheels booth, Off-Road Expo. Must be 18
or older and a U.S. resident. One entry per person. Winner announced Monday, October 5 —
[see official rules](#) for full details.

### Follow Along

**While you're here —** follow Jackman Wheels on Instagram and Facebook. We post the
winner there first.

[Instagram] [Facebook]

### Confirmation (on submit)

You're entered. We'll email the winner Monday, October 5 — and if it's not you, there's
still 10% off waiting in your inbox either way. Follow us on Instagram and Facebook so you
don't miss it.

*(Resets to the blank entry form a few seconds after showing this message — see build
notes.)*

---

## Build notes for Shopify

- **Template:** build on a blank/minimal page template with the theme header and footer
  hidden for this page specifically — a full nav would let someone wander off the kiosk
  mid-entry. If the theme can't suppress header/footer per-page, that's a decision point
  for whoever builds this, not something to guess around here.
- **Built 2026-10-01:** the embedded form already exists in Klaviyo — **"ORE Giveaway Entry
  Form"** (id `Y4s2uL`), submitting to the new **"ORE List"** (id `Ri82df`). Captures Name,
  Email, Phone (optional); the phone field is explicitly set to `phone_number_only` consent,
  so collecting it does not silently imply SMS-marketing opt-in. **The form is still in
  draft status in Klaviyo — it needs to be reviewed and published there, then embedded on
  this page** (Klaviyo gives an embed snippet/shortcode once published; this page's "Entry
  Form" section is where it goes).
- **List hygiene — flagging this because the brief's actual goal is list growth, not just
  running a contest:** ORE List only ever receives these two follow-up emails as currently
  built. Confirm whether entrants should also land on (or get added to) the standing
  **"Email List"** (the main ongoing subscriber list, confirmed via Klaviyo) — otherwise
  this campaign fills a list that goes quiet after Oct 5, 2026, which runs against the
  stated objective. Still open — not resolved as of this draft.
- **Confirmation / auto-reset:** Klaviyo's embedded form has a native success-message
  state, but it doesn't auto-clear and reload on its own. Either accept that the success
  message stays on screen until the next person refreshes the page, or add a short script
  to auto-refresh after ~6 seconds. This is a build-complexity call, not a copy call —
  flagging rather than guessing which way to build it.
- **Image:** one Street-line lifestyle photo. Confirm the kiosk's physical orientation
  (portrait stand vs. landscape) before finalizing the crop — an iPad on a booth stand is
  often portrait.
- **Official rules link:** the drafted rules currently live as a department file
  (`jackman-offroad-expo-giveaway-official-rules-2026-09-30-v1.md`) still pending Kris
  Maya's compliance review. It needs a real public-facing URL (a Shopify page or linked
  PDF) before this landing page can link to it live — don't publish this page with a dead
  or placeholder rules link.
- **Social links:** confirm the live Instagram and Facebook URLs before linking. The
  standing social strategy doc flagged Facebook still sitting on a `profile.php?id=` URL
  as of 2026-09-15 — confirm whether `facebook.com/JackmanWheels` has been claimed yet, or
  link to whichever URL is actually live.

---

## Brand guardrail check

No specific finish or model named for the prize — kept to "Street line" throughout, per
the brief. No load rating, certification, or part-number claim. No founder names. No
militarized language. Copy checked against the `jackman-brand-guidelines` skill's
guardrails and run through `humanizer` — kept direct and a little warm ("takes about ten
seconds," "that's worth something" in the companion email) rather than reading like a
contest-rules boilerplate page.

---

**FILE →** `05 Performance Marketing / 03 Landing Pages` / `jackman-offroad-expo-giveaway-landing-page-2026-09-30-v1.md`
