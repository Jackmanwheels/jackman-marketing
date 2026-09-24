# Brand Change Proposal — Publishing Confirmed Load Ratings

**Proposed by:** Austin Fitzgerald · **Date:** 2026-09-23 · **Status:** applied 2026-09-23 (in-repo redlines only — see note below)
**Classification:** **MAJOR** — a standing prohibition is being lifted, and a live spec table becomes correct where it was previously unauthorized.
**Decision source:** `00 Marketing Command Center/06 Standards and Conventions/jackman-decisions-inbox.md` → `D-06`

---

## Why this is a proposal and not an edit

Same governance as every prior brand change: one canonical guide, nobody forks it.
Guardrail #4 in `jackman-claude-instructions.md` and rule `G4` in `scripts/brand_check.ps1`
are both source files. This is a redline, not a rewrite — current text → replacement
text, with file and line number. Neither file has been edited.

**One access limit worth naming:** the `jackman-brand-guidelines` skill itself is a
plugin outside this repo and outside this session's filesystem access — I could not
locate its reference files (the ones the founder-names and founding-date proposals
redlined, e.g. `references/product-and-technical-claims.md`) to check them for load-rating
language. Whoever maintains that plugin should search it for the same phrases this
proposal retires and apply the equivalent redline there. Everything below is scoped to
what's actually in this repo, which I could verify directly.

---

## The change

**Load rating is a known, confirmable fact — split by lug pattern, not by model:**

| Lug pattern | Load rating |
|---|---|
| 5-lug and 6-lug | **2650 lbs** |
| 8-lug | **4500 lbs** |

**This does not authorize a certification claim.** Guardrail #4 currently conflates two
different things — a load-rating *number* and a JWL/VIA/SAE/TÜV *certification*. Austin
confirmed the number; nobody has confirmed a certification. The redline below separates
them: the number is now sayable, the certification claim is still prohibited, unchanged.

**What this is worth.** A $1,600+ purchase from a relaunched brand is a trust decision.
"Load rating: pending engineering release" reads as an unfinished product to a shopper
comparing specs against an established competitor. A specific number is exactly the kind
of concreteness the existing "leverage" backlog in the Marketing Portal already argues
for elsewhere (removing vagueness at the decision point) — this closes the same kind of
gap on the spec table itself.

---

## Redlines by file

### 1. `00 Marketing Command Center/06 Standards and Conventions/jackman-claude-instructions.md` — line 97

**Current**
> 4. **No load rating, ever.** No JWL / VIA / SAE / TÜV certification claim. In a spec table the cell reads `Load rating: pending engineering release`.

**Replacement**
> 4. **Load rating is confirmed and sayable — by lug pattern.** 5-lug and 6-lug: **2650 lbs**. 8-lug: **4500 lbs**. Still no JWL / VIA / SAE / TÜV certification claim — a load-rating number and a certification are different claims, and only the number is confirmed. If a lug pattern outside these two doesn't have a released figure, the cell reads `Load rating: pending engineering release` — this only lifts the prohibition for 5-lug, 6-lug, and 8-lug.

### 2. `scripts/brand_check.ps1` — lines 76–77 (rule `G4`, WARN)

**Current**
```
@{ L = 'WARN'; R = 'G4'; P = '(?i)\b(load (rating|capacity)|rated (to|for)|weight rating|max load)\b(?!.{0,45}pending engineering release)'; N = $true
   M = "Load claim. Spec cells read 'Load rating: pending engineering release'." }
```

**Replacement**
```
@{ L = 'WARN'; R = 'G4'; P = '(?i)\b(load (rating|capacity)|rated (to|for)|weight rating|max load)\b(?!.{0,45}(2650|4500|pending engineering release))'; N = $true
   M = "Load claim without an approved figure. Approved: 2650 lbs (5-lug/6-lug), 4500 lbs (8-lug). Anything else still reads 'Load rating: pending engineering release'." }
```

This keeps it a WARN, not a BLOCK — the script can't tell from a regex whether a number
it finds is one of the two approved figures attached to the correct lug pattern, only
that *a* load claim is present. A human still reads the hit, same as today.

**Line 50–51 (rule `G4`, BLOCK, JWL/VIA/TUV) — no change.** The certification
prohibition stands exactly as written; this proposal doesn't touch it.

### 3. `00 Marketing Command Center/06 Standards and Conventions/jackman-marketing-department-operating-guide.md` — line 178

**Current**
> **Put in it first** — A PDP audit. One row per live product, checked against your brand pre-flight list: exact finish names, fitment caveat present, no placeholder specs, no load rating claims.

**Replacement**
> **Put in it first** — A PDP audit. One row per live product, checked against your brand pre-flight list: exact finish names, fitment caveat present, no placeholder specs, load rating matches the confirmed figure for that wheel's lug pattern (2650 lbs 5-lug/6-lug, 4500 lbs 8-lug).

---

## What needs re-issuing

Nothing needs correcting on the site itself — this is the unusual case where live copy
was already ahead of the guardrail rather than behind it. Once ratified:

- Spec tables for any wheel **not yet showing** a load rating should get one added, for
  its correct lug pattern.
- Any spec table showing a number that **isn't** 2650 or 4500 needs a second look — that's
  either a lug pattern this proposal doesn't cover yet, or a wrong number.
- The `.claude/skills/cro-agent/SKILL.md` and `.claude/skills/chief-of-marketing/SKILL.md`
  files in this repo both currently summarize guardrail #4 as "no load rating" in a
  parenthetical list — update those to the new rule once this is applied, so future runs
  of those agents don't flag a now-correct number as a violation.

---

## To ratify

Apply the two redlines above (guardrail #4 and `brand_check.ps1` rule `G4`), update the
operating guide line, flag the `jackman-brand-guidelines` plugin for the equivalent
change (outside this repo's reach), then flip `D-06` in the decisions inbox from
`PROPOSED` to `PROPAGATED` and list what changed.

**Applied 2026-09-23.** All three in-repo redlines are live: guardrail #4, `brand_check.ps1`
rule `G4`, and the operating guide's PDP-audit line. The `.claude/skills/chief-of-marketing/SKILL.md`
summary was also updated. `D-06` is now `PROPAGATED`. **Still outstanding:** the
`jackman-brand-guidelines` plugin's own reference files, unreachable from this session —
whoever maintains that plugin should apply the equivalent change there.
