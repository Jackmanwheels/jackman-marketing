# Offroad Expo Giveaway — 10% Off (Non-Winner) Email

**Type:** One-off campaign
**Audience:** "ORE List" (id `Ri82df`), excluding the tagged winner · **Send:** Monday,
Oct 5, 2026, after the winner email goes out · **Risk:** low
**Source:** Chief of Marketing brief's Email Marketing section —
`08 Events, Motorsport and Partnerships/01 SEMA and Trade Shows/Off-Road Expo 2026/jackman-campaign-brief-offroad-expo-giveaway-2026-09-30-v1.md`
**Status:** Draft v1, revised 2026-10-05 — not built in Klaviyo

**Klaviyo state (checked 2026-10-05):** ORE List holds 108 profiles, each with saved
**Model** and **Finish** picks. 23 picked "Not Sure" and 3 have no Model answer.

---

**Subject:** Didn't win? Here's 10% anyway

**Preheader:** Thanks for stopping by the booth. This one's on us.

---

Hey {{ first_name|default:"there" }},

Thanks for stopping by the Jackman Wheels booth at Off-Road Expo. The wheels went to one
winner this time, but we'd still like to say thanks.

Here's 10% off anything at jackmanwheels.com:

**CODE: OREEXPO10**

[Shop Now →]

*(Optional block, only for profiles where Model is "Not Sure":)* Not sure which wheel fits
your truck? Reply with your year, make, and model and we'll point you in the right
direction.

Want to hear about the next giveaway first? Follow us on Instagram and Facebook.

Thanks for coming by,
The Jackman Wheels Team

[Instagram] [Facebook]

---

## Build notes for Klaviyo

**Must be true before this sends:**
- `OREEXPO10` exists in Shopify with a usage limit and an expiration date. Not confirmed as
  built as of this draft.
- The winner is tagged and excluded from the segment (see the winner email).

**Optional "Not Sure" block:** 23 of 108 entrants picked "Not Sure." This block turns that
into a conversation. It commits someone to answering the replies, so keep it only if that's
realistic. The reply-to address must be a monitored mailbox.

**List hygiene (still open):** ORE List only receives these two emails as built. Decide
whether entrants also roll into the standing "Email List," or this campaign grows a list
that goes quiet after today.

**Placeholders to fill:** `{{ first_name }}` with a "there" fallback. `[Shop Now]` points
at the general site (not the Street line), since this is a blanket thank-you.

**Subject/preheader length:** Subject is 29 characters, preheader is 51. The preheader may
clip on some mobile clients, but the first part carries the message.

**Segment:** ORE List (id `Ri82df`), excluding the one profile tagged as the winner.
Suppress the winner explicitly rather than relying on list math.

**Dark-mode / alt text / header mark:** body copy bone_white on dark, reversed logo on a
solid ground, single CTA button ("Shop Now"), 44px minimum tap height.

**Test in:** Apple Mail dark, Gmail iOS dark, Gmail Android dark, Outlook.com dark.

---

## Why it's built this way

It leads with thanks for showing up, so the 10% reads as a thank-you and not a consolation
prize. One CTA (shop with the code) keeps the discount from being diluted. The "Not Sure"
block uses the biggest finding from the form data: about 1 in 5 entrants don't know which
wheel they want, and a reply is a cheap way to start that conversation.

---

**FILE →** `06 Lifecycle - Email and SMS / 02 Campaign Sends` / `jackman-email-offroad-expo-giveaway-10-off-2026-09-30-v1.md`
