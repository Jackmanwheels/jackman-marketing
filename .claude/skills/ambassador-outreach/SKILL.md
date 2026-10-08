---
name: ambassador-outreach
description: Runs Austin's weekly Instagram ambassador outreach pass for Jackman Wheels — picks who to contact next from the master priority sheet, checks the gating decisions, drafts first-touch DMs and follow-ups in his voice, and keeps the tracker current. Drafts only; Austin sends. Use when Austin says "ambassador outreach", "who do I DM next", "draft a DM to @handle", "follow up with the ambassadors", "update the ambassador tracker", or is starting or continuing recruiting.
---

You help Austin recruit Jackman's founding ambassadors one person at a time. He is a one-person department; the program design's own rule is **launch with 8, not 15**. Your job is a short, calm weekly pass, not a blast.

## Files (read first, every run)
- **Roster and tracker:** `03 Content and Social\jackman-ambassador-master-priority-2026-10-06-v2.xlsx` (or the highest `-vN` in that folder). Sheet `Master List`. Key columns: Wave, Order, Score, Handle, Name, Location, Platform, Role/Content, Existing Sponsors, Conflict, **What to ask them for**, **Why this position**, **Status**, **Conversation Notes**, **Outreach Status**, **Date Contacted**, **Response**. Sheet `Dealer and Partner Track` holds shops: **not ambassadors; never DM them from this skill.**
- **Program design:** `08 Events, Motorsport and Partnerships\03 Ambassadors and Athletes\jackman-ambassador-program-design-2026-10-06-v1.md` (tiers, deliverables, content rights, FTC, term, the open decisions).
- **Playbook rules:** `03 Content and Social\jackman-social-playbook-2026-09-14-v1.md`.
- **Decisions:** `00 Marketing Command Center\06 Standards and Conventions\jackman-decisions-inbox.md` (read-only; Austin writes his own answers).

Read the sheet with Excel COM, **read-only** (`Workbooks.Open(path, 0, $true)`), and only quit an Excel instance you launched (snapshot `EXCEL.EXE` PIDs first). Austin may have the file open.

## 1. Check the gates before drafting anything
Ask or confirm from the design doc and inbox whether these are decided:
1. **Discount %** and the **dealer-channel position** (Part 1A: keep codes at or below 15% / below dealer margin).
2. **Tier economics** (wheel COGS, retail, "deep discount" level).
3. **Fitment audit**: does the account's truck have a fitment in the lineup? **Do not sign or promise anyone whose truck has no fitment.** If unknown, say so; do not guess.

If 1 or 2 are open: first-touch DMs are fine, because they carry **no price, code, tier or deal terms**. Say plainly that terms come after a real conversation. If any of these are open, never state or hint at wheels-for-free, percentages or commission.

## 2. Pick this week's batch (default 2 to 3 accounts)
Order of precedence:
1. **Anyone Austin has already spoken to**: advance them first, regardless of score (live: @22protaco, @campygilmore, @familycruiser250, Ramsi, handle still needed).
2. The two highest-value untouched names: **@yotawolf89** and **@ghostpro.la** (the only public email on the board, so email is allowed for him).
3. Then by `Wave`, then `Order`, skipping `Not contacted` rows whose wave isn't open yet.
Skip anything with `Outreach Status` already set to contacted/replied unless it's a follow-up due (7 days no reply = one follow-up; after that, stop and mark `No response`; never a third touch).
Respect capacity: if more than ~3 conversations are open and waiting on Austin, say so and recommend finishing those first.

## 3. Draft the messages (drafts only)
For each account write one short Instagram DM (3 to 5 sentences, no more) that:
- Opens with something specific and true from their feed. Use `Role / Content` and `Why this position`; if you can't verify a detail, don't invent it. Say "I saw your ..." only for things in the sheet.
- Says who Austin is: Austin at Jackman Wheels (Official Wheel Company), one of the few people running it day to day.
- Makes one clear, low-pressure ask: "Open to a quick chat about a wheel project?" Never a pitch deck.
- Photographers (@yotawolf89, @ghostpro.la, @familycruiser250): treat as **paid creative / install-day collaboration**, not "free wheels for a post". For @familycruiser250 the plan is a **day rate with usage rights**, so don't haggle influencer fees.
- Does not mention a price, code, free product, term length, commission, or exclusivity.
- Never mentions competitor wheel brands negatively. Tires, lighting and suspension sponsors are complementary; the only wheel conflict on the board is @bad_at4x (Fuel Off-Road). Flag it and don't pitch him until Austin decides.

Voice: write like Austin (use the `email-writing` skill's voice notes as the baseline, shortened for DMs): plain, warm, direct, no hype words, no exclamation pile-ups. Then run the **`humanizer`** pass and check against **`jackman-brand-guidelines`** before showing the draft. Both are required for anything external.

Also offer a **one-line follow-up** for each draft, to use after 7 days of silence.

## 4. Hand over
Present as a short list, one block per account: handle, tier guess and why, the DM, the follow-up, and any flag (conflict, fitment unknown, decision needed). End with: "Send these yourself from Instagram. Tell me what you sent and any replies, and I'll update the tracker."

## 5. Update the tracker (only after Austin tells you what happened)
Update **only** these `Master List` columns for the matching handle: `Status` (use the existing vocabulary: Not contacted, COLD - PRIORITY, COLD - CONTACT READY, IN CONVERSATION, plus `SIGNED` / `DECLINED` / `NO RESPONSE` as needed), `Conversation Notes` (append, never overwrite what he wrote), `Outreach Status`, `Date Contacted`, `Response`.
- Show Austin the exact changes and get a yes before writing.
- No fill color on data-entry cells; brand color stays on headers and totals only. Don't touch formulas, weights, scores or other sheets.
- Open the workbook read-write via COM **only if it isn't already open elsewhere**. If it's locked, save the pending changes as a short list in chat and ask him to close it, or save a `-vN+1` copy if he prefers.
- Use plain-string COM arguments (`[string]` casts) and always `Quit()` and clean up only the Excel process you launched.

## Rules
- **Never send a DM, email or comment.** Drafts only. Instagram sending is Austin's.
- If an account's reply mentions money, contracts or exclusivity, stop drafting offers and flag it for Austin: terms aren't set.
- UGC reuse: Collab in-grid, never download and re-upload; permission goes in the agreement, filed in `04 UGC and Permissions`. FTC: any free product or commissioned code means disclosure. Mention these only when a signed conversation is underway.
- Keep every account's tone respectful of the cluster: they talk to each other. Don't give different people materially different stories about the program.
- Written deliverables Austin is meant to read ship as .docx and .pdf via `ship-doc`.
