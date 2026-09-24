# CRO Note — Cart-Add Anomaly

**Date:** 2026-09-23
**Funnel step:** Product page (with a knock-on effect on Cart/Checkout)
**Metric:** Add-to-cart rate

---

## What was investigated

The Portal's daily diagnosis had been flagging zero cart-adds for 9+ days straight as
of its Sep 20/21 snapshot. Investigated whether that's still accurate and whether
there's a technical cause (broken Add to Cart button, a Preorder/stock contradiction
flagged previously) versus a demand/trust problem.

## Evidence from Shopify data

`FROM sessions SHOW sessions, online_store_visitors, sessions_with_cart_additions, sessions_that_reached_checkout, sessions_that_completed_checkout, conversion_rate SINCE -21d UNTIL today`:
**1,317 sessions · 23 cart-adds · 13 reached checkout · 2 completed checkout · 0.15% conversion.**

Daily breakdown (`TIMESERIES day`, same window) shows the "zero" streak was real through
Sep 20 (9 of the days Sep 6-20 had zero cart-adds), **but it already broke**: Sep 21 (1),
Sep 22 (1), and **Sep 23 (5 — the single highest day in the whole 21-day window)**. The
headline "zero cart-adds" is stale as of today — the real, ongoing problem is a
chronically low cart-add rate (~1.7% of sessions over 3 weeks), not a full stop.

## Live-site test result

Tested the actual purchase mechanism on `jackmanwheels.com/products/j68-classic-68-black`:
**Add to Cart works correctly** (cart drawer opens, correct item/price/qty), and
**Checkout loads cleanly** through the contact/shipping screen (correct subtotal,
express-pay buttons — Shop Pay, PayPal, Google Pay, Venmo — all render). Stopped there;
no personal or payment info entered, no order placed. **No technical bug found in the
core single-item flow.**

The previously-flagged contradiction (every wheel tagged "Preorder" while showing 12
units in stock, from the Portal's own hypothesis backlog) **is no longer present** — no
"Preorder" label appears on this PDP anymore. That friction point looks resolved already.

**Two unrelated but serious problems found on the same page, incidentally, while
testing:**
1. **A specific Load Rating (2650 lbs) is published in the spec table.** Guardrail #4
   is explicit: no load rating claim, ever — the cell should read "Load rating: pending
   engineering release." Decision `D-06` (decisions inbox) is still `OPEN`, blocked on
   Clyde Wheeler, for exactly this reason. This is live on the site right now.
2. **Founder first names appear in customer-facing copy** — "Harry and Sheryl Jackman
   didn't set out to start a movement..." in the Wheel Details section. Guardrail #16
   is explicit that founder first names never appear in anything a customer reads;
   `D-05` already decided to retire them (status `PROPOSED`, awaiting formal
   ratification, but the guardrail already applies regardless).

Also present: "5-Year Limited Lifetime Warranty" — a specific term length combined with
"Lifetime," which reads as self-contradictory and isn't visibly linked to terms
(guardrail #12: unqualified lifetime warranty language must link the terms).

## Recommendation

No technical fix needed for the cart/checkout mechanism itself — it works. The
conversion problem is more likely trust/positioning than a broken funnel, and this test
surfaced concrete evidence for that read: a $1,600+ purchase decision is being asked of
a visitor on a page that currently overclaims a safety-adjacent spec the company itself
hasn't confirmed, names founders the brand already decided not to name, and phrases its
warranty in a way that reads as a contradiction. Fix, in order:
1. Pull the live Load Rating number and replace with "Load rating: pending engineering
   release" — route to Clyde Wheeler per the decisions inbox routing (safety-adjacent,
   does not bend).
2. Replace the founder-names passage with the approved framing ("with members of the
   original Jackman family involved," per guardrail #16) — this is a copy fix, not
   blocked on anyone.
3. Qualify or link the warranty claim.
4. Keep watching the cart-add numbers day to day — today's jump to 5 is one data point,
   not yet a trend; worth another look in a few days once there's more than one day of
   signal.

---

## Update — 2026-09-23, later the same day

Austin answered both open questions this raised, in `D-06` and `D-05` of the decisions
inbox. Revises recommendation #1 above:

- **The load rating does not need to be pulled.** Austin confirmed the figure directly:
  5-lug/6-lug wheels are rated to 2650 lbs, 8-lug to 4500 lbs — the J68's displayed 2650
  lbs was already correct, just ahead of the guardrail authorizing it. Guardrail #4 has
  since been updated to match — ratified and applied 2026-09-23. See
  `01 Brand and Creative/01 Brand Guidelines and Tokens/jackman-brand-change-proposal-load-ratings-v1.md`.
- **The founder-names finding needs no fix, on reflection.** Austin's call: that passage
  links back to Our Story rather than re-telling the heritage story on its own, and it's
  carrying a specific fact (the Classic 68 is a spin-off of the original Harry-and-Sheryl
  wheel) rather than the heritage narrative itself. Guardrail #16 now codifies this as
  the intended exception, not a violation. Recommendation #2 above is withdrawn. See
  `01 Brand and Creative/01 Brand Guidelines and Tokens/jackman-brand-change-proposal-founder-names-v2.md`.

Recommendations #3 (warranty phrasing) and #4 (watch the trend) are unaffected.

---

**FILE →** `04 Ecommerce and Web / 03 CRO Tests and Results` / `jackman-cro-note-cart-add-anomaly-2026-09-23-v1.md`
