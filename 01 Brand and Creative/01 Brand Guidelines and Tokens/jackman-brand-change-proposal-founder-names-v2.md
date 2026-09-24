# Brand Change Proposal — Founder Names, Confined to Our Story (v2)

**Proposed by:** Austin Fitzgerald · **Date:** 2026-09-23 · **Status:** applied 2026-09-23 (in-repo redlines only — see note below)
**Classification:** **MAJOR** — amends a standing prohibition; changes what "consumer-facing" means for one specific page.
**Decision source:** `00 Marketing Command Center/06 Standards and Conventions/jackman-decisions-inbox.md` → `D-05`
**Supersedes:** `jackman-brand-change-proposal-founder-names-v1.md` (2026-08-26, still unratified). v1 is not withdrawn as a record — its redlines for every channel *other than* Our Story still stand. This version changes exactly one thing: what happens on the Our Story page.

---

## Why this is v2 and not an edit to v1

v1 proposed removing founder names everywhere, including the website's Our Story page.
Austin's revised answer keeps them in that one place. Since v1 was never applied (still
`awaiting ratification` after three weeks), this supersedes it rather than un-doing a
live change — but it's still written as its own dated proposal rather than a silent edit
to v1, for the same reason v1 gave: no document gets forked or quietly changed after the
fact, including this one's predecessor.

---

## The change

**Founder first names appear in exactly one place: the website's Our Story page.**
Naming them again anywhere else — social, email, press, dealer materials, ads, sell
sheets, **and product pages** — is redundant now that Our Story tells that story once,
canonically, and is the reasoning behind the revision.

Everywhere outside Our Story, **v1's replacement vocabulary and redlines stand
unchanged** — the heritage beat runs on the garage, the hand-built origin, and "members
of the original Jackman family involved," exactly as v1 wrote it.

**What's different from the original, pre-D-05 default (names allowed everywhere):**
this isn't a reversion to that. It's narrower — one canonical placement, not open use.

**What's different from v1 (names removed everywhere):** Our Story is carved out.

---

## A live finding this directly affects — resolved, leave as-is

The CRO agent's 2026-09-23 investigation found "Harry and Sheryl Jackman" in the **Wheel
Details section of the J68 product page** — not Our Story. Initially flagged as out of
place under this decision. **Austin's call, same day: leave it.** That passage links
back to Our Story rather than re-telling the heritage story standalone, and the fact
it's carrying is model provenance — the Classic 68 is a spin-off of the original wheel
Harry and Sheryl built — not a repeated heritage beat. This is the exception now written
into guardrail #16 directly: a page may name them once, briefly, in service of a
specific non-heritage fact, provided it points back to Our Story rather than retelling
it. Worth a one-time check of other product/collection templates for the *pattern*
(bare re-telling of the full heritage story, not a lineage reference) — that's still out
of place if found.

---

## Redlines by file

### 1. `00 Marketing Command Center/06 Standards and Conventions/jackman-claude-instructions.md` — line 109

**Current**
> 16. **No founder first names in consumer-facing copy.** Harry and Sheryl Jackman are the recorded founders but are not named in anything a customer reads. The heritage beat runs on the garage, the hand-built origin, and the family's involvement in the return. Use "born in a California garage," "built by hand," "the first Jackman wheels were flame-cut by hand and welded to 3/8-inch outer rims." Keep "with members of the original Jackman family involved" verbatim — that line is what makes the return a continuation rather than a licensing deal. Internal, legal, and fact-check documents may still name them.

**Replacement (as first applied, 2026-09-23 morning)**
> 16. **Founder first names appear in exactly one place: the website's Our Story page.** Harry and Sheryl Jackman are named there and nowhere else a customer reads — repeating the names elsewhere is redundant now that Our Story tells that story once. Everywhere outside Our Story: "born in a California garage," "built by hand," "the first Jackman wheels were flame-cut by hand and welded to 3/8-inch outer rims." Keep "with members of the original Jackman family involved" verbatim outside Our Story — that line is what makes the return a continuation rather than a licensing deal. Internal, legal, and fact-check documents may still name them freely.

**Amended same day, after the J68 finding below.** The first pass didn't account for a
page naming them once in service of a specific fact (like model lineage) rather than
retelling the heritage story. Live text now reads:
> 16. **Founder first names live in exactly one place: the website's Our Story page — as its own heritage narrative.** Harry and Sheryl Jackman are named there; retelling that same heritage narrative elsewhere is redundant now that Our Story carries it once. The exception: a page may name them once, briefly, in service of a specific fact that isn't the heritage narrative itself — e.g. a model page noting it's a direct spin-off of the original Harry-and-Sheryl-built wheel — provided it links or points back to Our Story rather than re-telling the story standalone. Everywhere else: "born in a California garage," "built by hand," "the first Jackman wheels were flame-cut by hand and welded to 3/8-inch outer rims." Keep "with members of the original Jackman family involved" verbatim outside Our Story — that line is what makes the return a continuation rather than a licensing deal. Internal, legal, and fact-check documents may still name them freely.

### 2. `scripts/brand_check.ps1` — lines 56–57 (rule `G16`, currently BLOCK)

**Current**
```
@{ L = 'BLOCK'; R = 'G16'; P = '(?i)\b(harry|sheryl)\b'; N = $true
   M = 'Founder first name. Consumer copy keeps the family unnamed. Internal, legal and fact-check documents may still name them.' }
```

**Replacement — downgrade to WARN.** A regex can't tell whether the file it's scanning
*is* the Our Story page, only that the names appear. BLOCK stops a publish outright;
WARN puts it in front of a human, which is now the correct behavior since the rule is
now page-dependent rather than absolute.

```
@{ L = 'WARN'; R = 'G16'; P = '(?i)\b(harry|sheryl)\b'; N = $true
   M = 'Founder first name. Approved only on the website Our Story page — anywhere else (social, email, press, dealer, PDP, ads) this should read the unnamed heritage phrasing instead. Internal, legal and fact-check documents may still name them freely.' }
```

### 3. Everything else in v1's redline list

Unchanged — still the correct redline for every channel other than Our Story:
`references/brand-facts.md`, `references/voice-and-messaging.md`,
`references/positioning-and-audiences.md`, `references/product-and-technical-claims.md`,
`references/dealer-and-cobranding.md`, `scripts/generate_brand_pdf.py`, the `humanizer`
skill's two worked examples. (Same access limit as the load-ratings proposal: these live
inside the `jackman-brand-guidelines` plugin, outside this session's reach — apply v1's
redlines to them as originally written, this proposal doesn't change any of that.)

**One correction to v1's own "what needs re-issuing" list:** v1 named "the website Our
Story page" as needing re-issuing (to remove the names). **That's no longer correct** —
Our Story is the one place the names now stay, unedited.

---

## What needs re-issuing

- ~~The J68 product page's Wheel Details section~~ — **resolved, leave as-is** (see
  above). Not a re-issue item.
- A one-time check of other product/collection templates for a *bare retelling* of the
  full heritage story (not a brief lineage reference linking back to Our Story) — that
  pattern is still out of place if found.
- Everything on v1's original list **except Our Story**: approved boilerplates, elevator
  pitches, press release template, dealer talk track and one-pager, any deck or sell
  sheet with a founders section.

---

## To ratify

Apply the two in-repo redlines (guardrail #16, `brand_check.ps1` rule `G16`), flag the
`jackman-brand-guidelines` plugin for v1's original redlines (still correct, still
pending, outside this repo), fix the J68 PDP occurrence, then flip `D-05` in the
decisions inbox from `PROPOSED` to `PROPAGATED` and note that this version (v2) is the
one that was applied, not v1.

**Applied 2026-09-23, amended same day.** Both in-repo redlines are live: guardrail #16
(amended version, with the lineage-reference exception) and `brand_check.ps1` rule `G16`
(downgraded BLOCK → WARN, since a regex can't tell whether a hit is on Our Story or a
covered exception). The `.claude/skills/chief-of-marketing/SKILL.md` summary was also
updated. `D-05` is `PROPAGATED`. **The J68 PDP needs no fix** — Austin confirmed that
occurrence is the intended exception, not a violation. **Still outstanding:** the
`jackman-brand-guidelines` plugin's own reference files, unreachable from this session.
