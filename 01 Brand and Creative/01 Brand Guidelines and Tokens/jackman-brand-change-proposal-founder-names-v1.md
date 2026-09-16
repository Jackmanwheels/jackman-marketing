# Brand Change Proposal — Retiring Founder Names from Consumer Copy

**Proposed by:** Austin Fitzgerald · **Date:** 2026-08-26 · **Status:** awaiting ratification
**Classification:** **MAJOR** — something previously correct is now wrong; material in circulation needs re-issuing.

---

## Why this is a proposal and not an edit

Your governance file is explicit: **one canonical guide, nobody forks it.** Changes get proposed, the brand owner makes the edit in the source, bumps the version, and announces it. It calls out AI-generated "cleaned up" copies by name as the specific failure mode, because a plausible second guideline is worse than no guideline.

So this is a redline, not a rewrite. Every change below is stated as *current text → replacement text* with a file and line number, for you to apply to the source. The skill files have not been edited.

---

## The change

**Retire "Harry and Sheryl" from all consumer-facing copy. Keep the family, unnamed.**

What stays: California origin · the garage · hand-built · flame-cut steel spokes welded to 3/8-inch outer rims · racers then VW culture · dormancy · **2026 return with members of the original Jackman family involved.**

What goes: the first names, in anything a customer reads.

**The heritage claim is not weakened by this.** The persuasive detail was never the names — it was "flame-cut steel spokes welded to 3/8-inch outer rims by hand." That's the sentence nobody else can write. "Harry and Sheryl" was the warmth; the 3/8-inch rim is the proof. The proof survives intact.

**What does get slightly thinner** is the continuation argument. Brand-facts says family involvement is the fact that makes "continuation, not a licensing deal" defensible, and named people are more defensible than "the family." Keeping "members of the original Jackman family involved" verbatim preserves most of it. Worth watching whether journalists push on it.

---

## Replacement vocabulary

Use these consistently so the change doesn't produce fifteen different phrasings.

| Retire | Use instead |
|---|---|
| "founded by Harry and Sheryl Jackman" | "born in a California garage" |
| "Harry and Sheryl Jackman built..." | "The first Jackman wheels were built by hand..." |
| "Harry flame-cut steel spokes by hand" | "The first wheels were flame-cut by hand" |
| "Harry built wheels by hand" | "The wheels were built by hand" |
| "the geometry is his" | "the geometry is theirs" or "the geometry hasn't changed" |
| "members of the original Jackman family involved" | **unchanged — keep verbatim** |

**Two new approved verbatim lines** to add to `brand-facts.md`:
- "Built by hand in a California garage."
- "Back with the family in it."

---

## Redlines by file

### `references/brand-facts.md`

**L18, L20 — KEEP AS IS.** This is the internal fact-check layer, not consumer copy. Deleting a true fact from the fact file is the wrong move; it's how the fact gets lost and then re-invented wrong later. Instead, **add a usage note directly under L18:**

> **Usage:** the founder names are a recorded fact for internal reference and fact-checking. They do not appear in consumer-facing copy — see the naming rule below. Long-form internal and legal documents may name them.

**L42 — MUST CHANGE.** Currently lists the names as a safe consumer phrase.

- Current: `write around it: "California-born," "born in a California garage," "founded by Harry and Sheryl Jackman" are all safe.`
- Replace: `write around it: "California-born" and "born in a California garage" are both safe.`

**Add a new subsection** under Origin story:

> **Founder names in consumer copy.** Harry and Sheryl Jackman are the recorded founders. As of v2 they are not named in consumer-facing work — the heritage beat runs on the garage, the hand-built origin, and the family's involvement in the return. Internal documents, legal filings, and fact-checking retain the names.

---

### `references/voice-and-messaging.md` — the heaviest file

| Line | Current | Replace with |
|---|---|---|
| **32** | "California. A garage. Harry flame-cutting steel spokes by hand and welding them to 3/8" rims." | "California. A garage. Steel spokes flame-cut by hand and welded to 3/8" rims." |
| **58** | "Harry Jackman flame-cut spokes by hand and welded them to 3/8" rims because nobody was building the wheel he needed." / hinge "The geometry is his." | "The first Jackman wheels were flame-cut by hand and welded to 3/8" rims because nobody was building the wheel they needed." / hinge "The geometry hasn't changed. The process behind it has." |
| **84** | "Warmth is naming Harry and Sheryl." | "Warmth is the garage and the 3/8-inch rim." |
| **87** | "Harry welded spokes in a garage." | "The first set was welded by hand in a garage." |
| **147** | "Founded by Harry and Sheryl Jackman in California." | "Born in a California garage." |
| **148** | "Harry built wheels by hand: flame-cut steel spokes welded to 3/8-inch-thick outer rims." | "The wheels were built by hand: flame-cut steel spokes welded to 3/8-inch-thick outer rims." |
| **184** (50-word pitch) | "Harry and Sheryl Jackman built off-road wheels by hand in California..." | "Jackman built off-road wheels by hand in California..." |
| **187** (100-word pitch) | "Harry flame-cut steel spokes by hand and welded them to 3/8-inch outer rims, and the clean geometry..." | "Steel spokes were flame-cut by hand and welded to 3/8-inch outer rims, and the clean geometry..." |
| **196** (builder pitch) | "Harry and Sheryl Jackman built off-road wheels by hand in a California garage..." | "Jackman wheels were built by hand in a California garage..." |
| **205** (short boilerplate) | "...founded by Harry and Sheryl Jackman, relaunched in 2026..." | "...born in a California garage, relaunched in 2026..." |
| **208** (medium boilerplate) | "Founded by Harry and Sheryl Jackman, who built wheels by hand — flame-cut..." | "Born in a California garage where wheels were built by hand — flame-cut..." |
| **211** (long boilerplate) | "It began with Harry and Sheryl Jackman and a gap nobody was filling: Harry flame-cut steel spokes by hand..." | "It began in a California garage and a gap nobody was filling: steel spokes flame-cut by hand..." |
| **260** | "Harry built them by hand." | "They were built by hand." |
| **356** (IG example) | "Harry Jackman flame-cut spokes by hand and welded them to 3/8" rims." | "The first ones were flame-cut by hand and welded to 3/8" rims." |
| **370** (PDP example) | "...the spoke geometry Harry Jackman cut by hand in California..." | "...the spoke geometry cut by hand in a California garage..." |
| **408** (press lede) | "...the California off-road wheel brand founded by Harry and Sheryl Jackman, with members..." | "...the California off-road wheel brand born in a Southern California garage, with members..." |
| **410** (press body) | "Harry built the first Jackman wheels by hand — flame-cutting steel spokes..." | "The first Jackman wheels were built by hand — flame-cut steel spokes..." |
| **464** (media pitch) | "Jackman was a California garage brand — Harry Jackman flame-cutting steel spokes, welding them to 3/8-inch rims..." | "Jackman was a California garage brand — steel spokes flame-cut by hand, welded to 3/8-inch rims..." |

**Also add** to §5 "What never shifts, in any channel, for any audience" as a new item 8:

> 8. Founder first names do not appear in consumer-facing copy. The heritage beat is the garage, the hand-built origin, and the family's involvement in the return.

---

### `references/positioning-and-audiences.md`

| Line | Change |
|---|---|
| **164** | "Jackman began in California with two people, Harry and Sheryl Jackman, and a conviction..." → "Jackman began in a California garage with a conviction..." · then "Harry flame-cut steel spokes and welded them..." → "Steel spokes were flame-cut and welded..." |
| **174** | "California origin, Harry and Sheryl, hand-built spokes..." → "California origin, the garage, hand-built spokes..." |
| **197** | "Harry and Sheryl Jackman; flame-cut steel spokes welded to 3/8" outer rims" → "A California garage; flame-cut steel spokes welded to 3/8" outer rims" |
| **280** | *Optional — internal gut-check only.* "would Harry have signed it?" → "would the people who built the first set have signed it?" Keeping it as-is is defensible since nobody outside reads it, but an internal test naming someone you don't name externally will eventually leak into a deck. |

---

### `references/product-and-technical-claims.md`

| Line | Change |
|---|---|
| **51** | "California-born, founded by Harry and Sheryl Jackman, hand-built origin..." → "California-born, hand-built origin..." |
| **334** | "the founders were Harry and Sheryl Jackman; the wheels were originally hand-built" → "the wheels were originally hand-built in a California garage" |
| **395** | ""California-born" and "founded by Harry and Sheryl Jackman" are fine." → ""California-born" and "born in a California garage" are fine." |

---

### `references/dealer-and-cobranding.md`

| Line | Change |
|---|---|
| **307** | "California-born, hand-built by Harry and Sheryl Jackman — he flame-cut steel spokes and welded them..." → "California-born, hand-built in a garage — steel spokes flame-cut and welded..." |
| **315** | Remove ""founded by Harry and Sheryl Jackman"" from the list of safe phrases. |
| **386** | "California-born, founded by Harry and Sheryl Jackman. Harry built off-road wheels by hand..." → "California-born, built by hand in a garage. The first off-road wheels were flame-cut steel spokes welded to 3/8-inch thick outer rims..." |

---

### `scripts/brand_check.py`

**L422 and L445** — update the suggestion strings so the script stops recommending the retired phrasing.

- L422: `"Harry and Sheryl Jackman" — all safe, all carry the same weight.` → `"born in a California garage" — both safe, both carry the same weight.`
- L445: `"suggestion": "\"Founded by Harry and Sheryl Jackman in California.\""` → `"suggestion": "\"Born in a California garage.\""`

**Add a new rule** so the script catches the names in draft copy — this is what makes the change stick rather than depending on memory:

```python
{
    "id": "founder-names-in-copy",
    "severity": "WARN",
    "pattern": r"\b(Harry|Sheryl)\b",
    "message": (
        "Founder first names do not appear in consumer-facing copy as of v2. "
        "The heritage beat runs on the garage, the hand-built origin, and the "
        "family's involvement in the return. Internal and legal documents may "
        "name them."
    ),
    "suggestion": '"born in a California garage" / "built by hand" / "the family"',
},
```

WARN rather than ERROR, so an internal doc that legitimately names them doesn't fail a publish gate.

---

### `scripts/generate_brand_pdf.py`

| Line | Change |
|---|---|
| **451** | "Jackman was built by hand in California by Harry and Sheryl Jackman — " → "Jackman was built by hand in a California garage — " |
| **497–498** | "write "California-born" or "founded by Harry and Sheryl Jackman" and leave the decade out" → "write "California-born" or "born in a California garage" and leave the decade out" |

Regenerate the PDF after the tokens and references are updated, not before.

---

### `humanizer` skill — `SKILL.md`

Two worked examples model the retired phrasing and will teach it back into copy.

| Line | Current | Replace with |
|---|---|---|
| **59** | "It's a Jackman. Harry welded the first ones by hand." | "It's a Jackman. The first ones were welded by hand in a garage." |
| **109** | "Harry welded the first ones by hand in a garage. We use a press now. Same geometry, faster Tuesday." | "The first ones were welded by hand in a garage. We use a press now. Same geometry, faster Tuesday." |

---

## Order of operations

Governance specifies: tokens first, then references, then regenerate derived artifacts. Applied here:

1. `brand-facts.md` — add the usage note and the new rule. This is the source of truth for the decision.
2. The five other reference files, in any order.
3. `brand_check.py` — suggestion strings plus the new WARN rule.
4. `humanizer/SKILL.md` — the two examples.
5. Regenerate the PDF guideline.
6. Bump `_version` in `brand-tokens.json` to the next MAJOR.
7. Changelog entry.

**Suggested changelog entry** — governance says "Updated colors" is not an entry, so:

> **v2.0.0 — 2026-08-26 — Austin Fitzgerald.** Retired founder first names from all consumer-facing copy; heritage beat now runs on the California garage, the hand-built origin, and the family's involvement in the return. Recorded founder names retained in `brand-facts.md` for internal fact-checking. Requires re-issue of: approved boilerplate (all three lengths), all elevator pitches, the press release template, dealer talk track and one-pager, and any live site copy naming the founders. Added `founder-names-in-copy` WARN to `brand_check.py`.

---

## What needs re-issuing

Anything already produced from the retired phrasing:

- All three approved boilerplates — highest risk, because they're pasted verbatim into press releases and partner materials
- All five elevator pitches
- Press release template and any release drafted but not sent
- Dealer talk track and the dealer one-pager
- **The website Our Story page** — outside the skill and outside SharePoint, and the one place a journalist will look
- Any deck or sell sheet with a founders section

---

## One question worth answering before ratification

**Why the change?** It determines how urgent this is.

If it's positioning — the brand should carry the story rather than two individuals — then this is a normal MAJOR, apply it at your own pace, and existing material can age out.

If it's because the names, spellings, or roles may not be accurate, that's a different and more urgent problem. Names are already published on the Our Story page and possibly in press that's out. Under the claim rules, an unverified fact already in circulation gets corrected, not just retired going forward.

If it's a family or privacy matter, that likely also affects photography, any planned family filming, and the "Schedule family visit + filming date" task sitting in Campaign Planning.

The redline above works for all three. Only the urgency changes.
