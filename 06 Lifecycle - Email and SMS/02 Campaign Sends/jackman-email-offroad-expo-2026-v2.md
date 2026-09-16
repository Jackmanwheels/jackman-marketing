# Off-Road Expo — Consumer Email

Audience: consumer list · Send: [SEND DATE] · Risk: low-medium
v2 — founder names removed per the v2 naming change.

---

**Subject:** Off-Road Expo — see the finishes in person

**Preheader:** Matte Bronze reads different in daylight. Booth [BOOTH #], [DATES].

---

[HERO IMAGE — J70 | Matte Bronze, daylight, mounted on a truck. 600x400.]

## We're at Off-Road Expo.

The first Jackman wheels were built by hand in a California garage. Flame-cut steel spokes, welded to 3/8-inch outer rims. Wheels built that way were meant to be looked at from about two feet away.

A phone screen is not two feet away.

Matte Bronze reads warmer and darker in daylight than it does on a monitor. Machined As-Cast has tooling marks you can actually feel. If you've spent a month going back and forth between two finishes in a browser tab, this is the fix.

All six models on the floor: Classic 68, J69, J70, J71, J72, and J73. In Satin Black, Matte Bronze, and Machined As-Cast. 17", 18", and 20", in 5-, 6-, and 8-lug.

Bring your year, trim, and tire size and we'll check fitment against the Master Parts List while you're standing there.

**[DATES]**
**[VENUE, CITY]**
**Booth [BOOTH #]**

[ BUTTON: Get show details ]

Heritage Reborn.

---

## Build notes for Klaviyo

**Placeholders to fill:** `[SEND DATE]` · `[DATES]` · `[VENUE, CITY]` · `[BOOTH #]` · hero image · button URL.

**Subject** is 43 characters — inside the 30–50 window, noun front-loaded, cuts cleanly on mobile at "Off-Road Expo — see the fin…". No emoji.

**Preheader** is 67 characters and adds information rather than repeating the subject. Never leave it empty or the client pulls "View in browser."

**Hero alt text:** `J70 in Matte Bronze, 20 inch, mounted on a pickup in daylight`

**Header mark:** reversed PNG on a solid jackman_black rectangle, not on transparency. Transparency is what lets Outlook and Gmail Android invert the logo into nothing.

**CTA:** single HTML/CSS button, bone_white label on jackman_bronze fill, 44px minimum tap height. Not an image button. One CTA only — no secondary links competing with it.

**Body copy on dark stays bone_white.** Jackman Bronze type on a dark ground drifts toward the failing contrast ratio when Apple Mail pushes the black to grey.

**Footer:** Official Wheel Company legal entity, physical address, one-click unsubscribe, preference center, reason-for-receiving line, trademark notice line.

**Segment:** consumer list only. Suppress dealers — they get their own version with lead capture and appointment booking, not a "come look at the finishes" pitch.

**Test in** Apple Mail dark, Gmail iOS dark, Gmail Android dark, Outlook.com dark before send.

---

## Why it's built this way

**The reason the email exists is finish accuracy, not attendance.** "Come see us" on its own gives the reader nothing. Matte Bronze genuinely reads warmer and darker in daylight than on screen, and that gap is a real source of returns. So the show becomes something useful to the customer rather than a favor to us, and it does returns-prevention work on the side.

**Story sets up, spec closes.** Two sentences on the garage and the hand-built rims, one hinge, then models, finishes, sizes, and fitments. No adjective touches a spec.

**No founder names.** Per the v2 naming change, the heritage beat runs on the garage and the hand-built origin rather than the first names. The hand-built fact does all the same work — it was always the specific detail carrying the sentence.

**No dates or claims invented.** No founding decade, no load rating, no certification, no warranty language, no price. Every placeholder is a fact I don't have rather than a guess.

**One joke, in the story beat.** The browser-tab line. It's dry, it's aimed at someone who's already shopping, and it's nowhere near a spec.

---

**FILE →** `06 Lifecycle - Email and SMS / 02 Campaign Sends` / `jackman-email-offroad-expo-2026-v2.md`

Cross-reference a copy into `08 Events, Motorsport and Partnerships / 01 SEMA and Trade Shows / Off-Road Expo 2026` when you build out the show folder, so the whole event lives in one place.
