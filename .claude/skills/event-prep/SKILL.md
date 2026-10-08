---
name: event-prep
description: Builds a dated event-prep plan for a Jackman show or event — Overland Expo, Off-Road Expo, SEMA, regional meets, ambassador-vehicle displays — working backward from the event date, and reuses the Off-Road Expo 2026 playbook (campaign brief, giveaway rules, booth announcement, press release, blog, show card). Use when Austin says "event prep", "plan for [event]", "what do I need for the show", "booth checklist", "work back from [date]", or adds an event to the 2027 planning sheet.
---

Austin runs events alone, usually on a short clock. This skill turns an event name and date into a work-back plan with owners, so nothing is discovered on load-in morning.

## 1. Pin down the event (ask only what's missing)
Event name, **start and end dates**, location, booth number or footprint, who's attending, whether a giveaway or demo is planned, and whether an ambassador or project vehicle will be displayed. Check the **2027 planning sheet** first: `00 Marketing Command Center\02 Marketing Calendar\2027-event-planning-template.xlsx`, sheet `2027 Events` (columns: Event Name, Category, Start/End Date, Location, Owner, Priority, Status, Budget, Goal/KPI, Notes). Read it **read-only** through Excel COM (open with `ReadOnly=$true`; only quit an Excel process you launched). Never trust a date from memory; 2027 dates are often unconfirmed. If the sheet's date came from a website check, say when it was checked and recommend re-confirming.

Run `date` for today and compute weeks-to-event. If a deadline already passed (for example a fitment lead time), say so plainly and give the compressed version.

## 2. Reuse what's already built
For each deliverable, check the Off-Road Expo 2026 set before starting from blank: `08 Events, Motorsport and Partnerships\01 SEMA and Trade Shows\Off-Road Expo 2026\` (campaign brief, giveaway official rules, show-special card, buggy lifestyle photo), `03 Content and Social\02 Social Posts and Captions\` (booth announcement), `03 Content and Social\05 Editorial and Blog\` (event blog). Adapt, don't recopy, and flag anything with wording still pending legal sign-off.

## 3. Work back from the event date
Build the timeline with these tracks, each item dated, with an owner and a status. Adjust to the event's size:

- **Vehicle and fitment (start 6 to 8 weeks out):** the display vehicle must be wearing Jackman wheels, photographed, and ideally posted before it stands at a show. Fitment confirmation, shipping, install, photo day. One ambassador vehicle per show. Audit fitment before committing anyone.
- **Booth and logistics:** booth confirmation and number, graphics and signage print lead times, freight and shipping, power/Wi-Fi/iPad for lead capture, load-in credentials, parking, passes, stipend or travel for ambassadors, insurance on privately owned vehicles, staffing and breaks.
- **Product and display:** wheels and finishes to bring, the heritage piece, spec cards. **Do not state specs, fitment, load ratings, torque values, part numbers or prices in copy**; route them: specs to Clyde Wheeler, dealer and MAP to Bud Jerue, claims, warranty and giveaway legal wording to Kris Maya.
- **Giveaway (if any):** official rules, entry method, drawing date, age/residency limits, platform wording (Meta promotion rules). Needs Kris Maya's review before anything goes live. Never launch before that.
- **Pre-event marketing:** booth announcement post and Stories (a real photo, **no promo graphic as a feed post**, rule 16), Facebook Event update with the booth number, email to the list and dealers, ambassador Stories brief (7 days' notice, assets supplied, their code included), press release and blog draft.
- **At-event capture:** run `shoot-day-planner` for the booth/vehicle shots; list the must-capture moments and the lead-capture plan.
- **Post-event (within 3 days):** winner drawn and announced, thank-you posts, recap blog, photo folder shared, thank-you email, follow-up with leads and dealers, expenses logged, and a short "what we'd change" note.

## 4. Output
Write `08 Events, Motorsport and Partnerships\01 SEMA and Trade Shows\<Event Name YYYY>\jackman-event-prep-<event>-YYYY-MM-DD-v1.md`, with: a summary block (dates, location, goal/KPI), the dated work-back table, **risks** (the three most likely to bite), **decisions needed from Austin**, and **who's needed** (named people). Then run `ship-doc` for the .docx and .pdf, and link both.

## 5. Optional follow-through (ask first)
Offer to (a) update the event's row in the 2027 planning sheet (Status, Owner, Goal/KPI, Notes; only those columns, no fill color on input cells, only if the file isn't open elsewhere), and (b) create the dated items as tasks in the Jackman CRM. Asana is retired; never use it. Do neither without a yes. Note the CRM write may fail if the app isn't running; say so rather than retrying.

## Rules
- Plans and drafts only. Never post, send, register, buy or schedule.
- Copy that goes external (announcements, rules, press release, emails) passes `jackman-brand-guidelines` then `humanizer`. Heritage claims follow the decisions inbox `D-01` status. Check it; don't decide it.
- If an input you need (booth number, dates, budget) is unknown, mark it **TBC** in the plan and list it under decisions. Don't invent it.
