# Brand Change Proposal — Founder Names, Confined to Our Story (v2)

**Proposed by:** Austin Fitzgerald · **Date:** 2026-09-23 · **Status:** awaiting ratification
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

## A live finding this directly affects

The CRO agent's 2026-09-23 investigation found "Harry and Sheryl Jackman" in the **Wheel
Details section of the J68 product page** — not Our Story. Under this revised answer,
**that occurrence is still out of place** and should move to the unnamed phrasing (v1's
replacement vocabulary), the same as it would have been under v1. Confirm this is the
only non-Our-Story occurrence before treating the site as compliant — a search for
"Harry" and "Sheryl" across the live site's product and collection templates is worth
doing once this is ratified.

---

## Redlines by file

### 1. `00 Marketing Command Center/06 Standards and Conventions/jackman-claude-instructions.md` — line 109

**Current**
> 16. **No founder first names in consumer-facing copy.** Harry and Sheryl Jackman are the recorded founders but are not named in anything a customer reads. The heritage beat runs on the garage, the hand-built origin, and the family's involvement in the return. Use "born in a California garage," "built by hand," "the first Jackman wheels were flame-cut by hand and welded to 3/8-inch outer rims." Keep "with members of the original Jackman family involved" verbatim — that line is what makes the return a continuation rather than a licensing deal. Internal, legal, and fact-check documents may still name them.

**Replacement**
> 16. **Founder first names appear in exactly one place: the website's Our Story page.** Harry and Sheryl Jackman are named there and nowhere else a customer reads — repeating the names elsewhere is redundant now that Our Story tells that story once. Everywhere outside Our Story: "born in a California garage," "built by hand," "the first Jackman wheels were flame-cut by hand and welded to 3/8-inch outer rims." Keep "with members of the original Jackman family involved" verbatim outside Our Story — that line is what makes the return a continuation rather than a licensing deal. Internal, legal, and fact-check documents may still name them freely.

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

- **The J68 product page's Wheel Details section** — the CRO agent's finding above.
  Move to the unnamed phrasing; this is outside Our Story.
- A one-time check of other product/collection templates for the same pattern, since if
  it happened once via a shared template it may have happened elsewhere too.
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
