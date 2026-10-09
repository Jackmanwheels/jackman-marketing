# Offroad Expo Giveaway — Winner Email

**Type:** One-off campaign
**Audience:** The single tagged giveaway winner · **Send:** Monday, Oct 5, 2026, after the
draw and after Kris Maya clears the rules · **Risk:** low
**Source:** Chief of Marketing brief's Email Marketing section —
`08 Events, Motorsport and Partnerships/01 SEMA and Trade Shows/Off-Road Expo 2026/jackman-campaign-brief-offroad-expo-giveaway-2026-09-30-v1.md`
**Status:** Draft v1, revised 2026-10-05 — not built in Klaviyo

**Klaviyo state (checked 2026-10-05):** list **"ORE List"** (id `Ri82df`) holds 108
profiles. Entrants came in through form `UZrYH4`, which saved their **Model** and
**Finish** picks as profile properties.

---

**Subject:** You won. Let's get you your wheels

**Preheader:** Pick your set from the Street line.

---

Hey {{ first_name|default:"there" }},

You're the one. Out of everyone who stopped by the Jackman Wheels booth at Off-Road Expo,
your name came up in the drawing. Congratulations.

You get your pick of any wheel in our Street line, up to $2,016 in retail value. Forged
and beadlock wheels aren't part of this one, but everything else in the Street line is
fair game.

*(Optional line, only if their Model answer isn't "Not Sure" or blank:)* You told us you
were eyeing the {{ person|lookup:'Model' }} in {{ person|lookup:'Finish' }}. Go with that
or switch it up, it's your call.

To lock it in, just reply to this email with:

- Your vehicle (year, make, and model)
- The wheel and finish you want
- Where we should ship it

We'll confirm fitment with you before anything ships.

Want to see what's coming next? Follow us on Instagram and Facebook.

Congrats again,
The Jackman Wheels Team

[Instagram] [Facebook]

---

## Build notes for Klaviyo

**Decisions made in this revision (Austin to confirm):**
- **Claim mechanism = reply to this email.** Simplest option, and it's now the default.
  The reply-to address must be a mailbox someone actually watches.
- **"We'll confirm fitment with you before anything ships"** is a process promise. Keep it
  only if that's really how Austin wants to handle it.

**Waiting on Kris Maya:** the rules flag 1099 reporting because the prize is over $600.
If Kris says the winner needs to send a W-9 or sign an affidavit, add one line to the
"To lock it in" list before sending.

**Placeholders to fill:** `{{ first_name }}` uses Klaviyo's standard first-name tag with a
"there" fallback. The optional Model/Finish line reads custom profile properties `Model`
and `Finish`. Wrap it in a conditional so it's skipped when Model is "Not Sure" or empty
(3 of 108 profiles have no Model). Send a test to a profile with and without those
properties before the real send.

**Subject/preheader length:** Subject is 34 characters, preheader is 35. Both are under
the ~40-character mobile cutoff.

**Segment:** the single profile tagged "Giveaway Winner" in ORE List after the draw. Verify
the filter returns exactly one profile before scheduling.

**Dark-mode / alt text / header mark:** body copy bone_white on dark backgrounds, reversed
logo on a solid ground (never transparency), single CTA treatment (here: the reply
instruction, no button), alt text describes the actual photo.

**Test in:** Apple Mail dark, Gmail iOS dark, Gmail Android dark, Outlook.com dark.

---

## Why it's built this way

One recipient and one ask: reply with three things. The Model/Finish line shows the form
answers were actually read, which makes the win feel personal. The follow ask rides last so
it doesn't compete with claiming the prize. No promise to post the winner publicly, since
that depends on the publicity release in the rules.

---

**FILE →** `06 Lifecycle - Email and SMS / 02 Campaign Sends` / `jackman-email-offroad-expo-giveaway-winner-2026-09-30-v1.md`
