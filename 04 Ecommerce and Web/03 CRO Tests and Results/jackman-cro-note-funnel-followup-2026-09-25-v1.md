# CRO Note — Funnel Follow-Up

**Date:** 2026-09-25
**Funnel step:** Site-wide, with a second live checkout test (Product page → Cart → Checkout)
**Metric:** Add-to-cart rate, conversion rate

---

## What was investigated

Follow-up to the 2026-09-23 cart-add investigation: pulled fresh 14-day funnel numbers
and re-tested the checkout mechanism on a different product (J70, Machined As-Cast)
to see whether the pattern has moved and whether the mechanism still holds up.

## Evidence from Shopify data

`FROM sessions SHOW sessions, online_store_visitors, sessions_with_cart_additions, sessions_that_reached_checkout, sessions_that_completed_checkout, conversion_rate SINCE -14d UNTIL today`:
**955 sessions · 16 cart-adds (1.7%) · 10 reached checkout · 3 completed checkout ·
0.31% conversion.**

That conversion rate is roughly double the original baseline (0.16%) and the 21-day
figure from two days ago (0.15%) — **3 completed checkouts in 14 days is the best
stretch since tracking started.** Daily breakdown shows why: Sep 23 had 7 cart-adds
(the best single day in a month), Sep 24 dropped back to 0, Sep 25 (today, partial) has
1 so far.

**Caveat on the Sep 23 number:** at least 1 of those 7 cart-adds was the CRO agent's own
live-site test that day (a Classic 68 added to cart during the previous investigation),
not a customer. Treat that day as ~6 genuine adds, still the strongest day in the
window. **Today's own test (below) will show up as +1 in tomorrow's count for the same
reason** — worth remembering when reading day-to-day swings, since agent testing itself
now adds a small amount of noise to this metric.

## Live-site test result

Tested `jackmanwheels.com/products/j70-machined` — a different product than the 9/23
test, for broader coverage. **Add to Cart works correctly** (confirmed via the cart
page: correct item, $434.00, quantity 1). **Checkout loads cleanly** through the
contact/shipping screen — correct subtotal, express-pay options present. No personal or
payment info entered, no order placed. No "Preorder" label present. **No technical bug
found** — this is the second product and the second full mechanism check (9/23 and
9/25) to come back clean, on different products both times.

No founder names present on this page's Wheel Details section, consistent with the
9/23 finding that the "Harry and Sheryl" mention is specific to the J68 (its direct
lineage story), not template-wide.

## Decisions inbox check

Reviewed current `OPEN` items (`D-03` domain, `D-07` part numbers, `D-08` palette,
`D-09` budget, `D-11` Facebook page) — none plausibly explain the cart-add pattern.
`D-07` (part number structure unconfirmed) isn't actually blocking anything on the PDP:
the live product schema already carries real Shopify-assigned MPNs (e.g. `J6978515900`),
not invented ones.

## Recommendation

Two clean mechanism checks on two different products, four days apart, plus a real
(if early) improvement in completed checkouts, points away from a technical bug and
toward the same read as before: the checkout works, the constraint is upstream —
getting more of the ~1,700 weekly visitors to add to cart in the first place. That's
still the "leverage" backlog's territory (Set-of-4 option, pre-cart-leak focus, email
reactivation) rather than anything new this pass surfaced. Given the mechanism has now
checked out clean twice, **future CRO runs probably don't need to re-test the full
checkout every time** — a periodic (e.g. weekly) health-check is likely enough unless a
new anomaly shows up, saving the self-inflicted cart-add noise mentioned above for when
it's actually needed.

---

**FILE →** `04 Ecommerce and Web / 03 CRO Tests and Results` / `jackman-cro-note-funnel-followup-2026-09-25-v1.md`
