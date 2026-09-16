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

**Status:** `PROPOSED` — decided 2026-09-15. Downstream docs updated; the guardrail
change needs ratification (see `jackman-brand-change-proposal-founding-date-v1.md`).

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

**ANSWER:** Yes — keep the family, unnamed.

**Status:** `PROPOSED` — see
`01 Brand and Creative/01 Brand Guidelines and Tokens/jackman-brand-change-proposal-founder-names-v1.md`,
status *awaiting ratification* since 2026-08-26. **This has been sitting for three
weeks.** It's already encoded as guardrail #16, so behavior is correct either way — but
the proposal should be formally ratified or withdrawn rather than left open.

---

## D-06 — Load ratings

**Question:** When does engineering release load ratings?

**ANSWER:**

**Status:** `OPEN` — blocked on Clyde Wheeler.

**Until then:** spec cells read `Load rating: pending engineering release`. No JWL / VIA /
SAE / TÜV claim. This one is a hard safety-adjacent guardrail — it does not bend.

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

**ANSWER:**

**Status:** `OPEN` — carved out of `D-02` on 2026-09-15.

**Why it stayed open when the address closed:** the address conflict is resolved because
the bad listing went dark. The *page* is still there. A second brand page splits search
authority and confuses customers even while it is invisible to us, and an unclaimed page
we don't control is worse than one we do — it can come back.

**First step is a question, not a decision:** does anyone at Official Wheel Company have
admin on `61560110244171`? If yes, Facebook can merge it into the live page and the
followers transfer. If no, it's a brand-rights claim through Facebook support, which is
slower. Either way `L-01` and the social profile audit want this settled.

---

## Closed and propagated

*Nothing yet. Items move here once status is `PROPAGATED` and the change has held for a
full reporting cycle.*
