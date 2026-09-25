# SEO Audit — Full Site Pass

**Date:** 2026-09-25
**Pages/scope audited:** Homepage, `/collections/all-jackman-wheels`, `/collections/17-inch-wheels`, `/collections/accessories`, `/collections/jeep-wrangler-wheels`, `/collections/toyota-tacoma-wheels`, `/products/j68-classic-68-black`, `/products/j69-bronze` — live, direct inspection (page source, JSON-LD, rendered DOM), not a document review.
**Checked against:** `03 Content and Social/jackman-social-seo-action-checklist-2026-09-15-v1.md`

---

## Checklist items verified this pass

- **W-01** — social links in header/footer → still present, confirmed live → not
  re-checked (already done), but its UTM follow-up was never done → split out as new
  `W-10`.
- **W-02** — Organization schema → still only `name` + `url`, unchanged since 15 Sep →
  checklist not updated (still open), fix drafted below.
- **W-03** — duplicate collections → confirmed `17-inch-wheels` returns the identical 13
  products as `all-jackman-wheels` → checklist not updated (still open) — this is a
  merchandising decision, not a copy fix.
- **W-04** — `/collections/accessories` → still empty, still indexable, no `noindex` tag
  → checklist not updated (still open).
- **W-05** — four fitment landing pages → checked 2 of 4 (`jeep-wrangler-wheels`,
  `toyota-tacoma-wheels`), both 404 → checklist not updated (still open) — needs full
  page copy, handed to Website/Content agents.
- **W-06** — J69 H1 vs. title tag mismatch → confirmed live, unchanged → checklist not
  updated (still open), fix drafted below.
- **W-07** — review app / AggregateRating → confirmed ProductGroup schema present, no
  `aggregateRating` field → checklist not updated (still open) — needs an app installed,
  not a draft.
- **W-08** — alt text → confirmed on J69: 8 images alt-texted as repeated product name,
  several lifestyle/safety images with empty `alt=""` → checklist not updated (still
  open), sample fix drafted below.
- **W-09** — HTML spec table per model → **confirmed present on both J68 and J69**, full
  fields (part number, diameter, width, bolt pattern, offset, hub bore, back spacing,
  weight, load rating) → **checklist updated to done.** Nobody had verified or checked
  this off before.

---

## New findings, not on the standing checklist

**W-10 — Social links carry no UTM parameters.** The other half of `W-01` that never
got done. Added to the checklist as its own item so it doesn't stay invisible inside a
checked-off box.

**W-11 — "5-Year Limited Lifetime Warranty" on every PDP.** Confirmed on both J68 and
J69 (shared template, so almost certainly catalog-wide). A specific term length next to
"Lifetime" reads as self-contradictory, and per guardrail #12 an unqualified lifetime
warranty claim must link to terms — this one doesn't visibly link anywhere. Added to
the checklist.

**Confirmed correct, not a finding:** the load rating shown in both PDPs' spec tables
(2650 lbs, 5-lug) matches the figure Austin confirmed in `D-06` — the live site was
already accurate once that decision was ratified. No action needed there.

---

## Fixes drafted (file only — not applied)

### W-02 — Organization schema (Shopify theme, likely `theme.liquid`)

**Current:**
```json
{"@type":"Organization","name":"Jackman Wheels","url":"https://jackmanwheels.com"}
```

**Proposed** (unchanged from the checklist's own draft — still correct, just re-confirmed
as still needed):
```json
{
  "@context": "https://schema.org",
  "@type": "Organization",
  "name": "Jackman Wheels",
  "url": "https://jackmanwheels.com",
  "logo": "https://jackmanwheels.com/[path-to-logo].png",
  "telephone": "+1-562-946-4800",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "15500 Cornet St.",
    "addressLocality": "Santa Fe Springs",
    "addressRegion": "CA",
    "postalCode": "90670",
    "addressCountry": "US"
  },
  "sameAs": [
    "https://www.instagram.com/jackmanwheels/",
    "https://www.facebook.com/profile.php?id=61590115023694",
    "https://www.youtube.com/@JackmanWheels",
    "https://tiktok.com/@jackmanwheels",
    "https://x.com/jackmanwheels"
  ]
}
```
Only placeholder left: the logo file path.

### W-06 — J69 H1

**Current:** `J69 | Matte Bronze`
**Proposed:** `J69 Bronze Truck Wheel — 17" & 18"`

Matches the title tag's keyword coverage while staying inside the `Model | Finish`
labeling convention's spirit — this is prose-facing (an H1, not a table cell), so the
looser "J69 Bronze Truck Wheel" phrasing is consistent with how the title tag already
reads. Apply the same pattern to every other PDP once confirmed — this audit only
checked J69 directly.

### W-08 — Sample alt text rewrites (J69, Matte Bronze)

**Current (repeated 8x):** `J69 | Matte Bronze`
**Proposed, varied by image content rather than repeated:**
- Hero/front shot: `Jackman J69 truck wheel in Matte Bronze, front view`
- Three-quarter shot: `Jackman J69 wheel, Matte Bronze finish, three-quarter angle`
- Detail/spoke shot: `Close-up of J69 spoke detail in Matte Bronze`
- Mounted/lifestyle shot: `Jackman J69 Matte Bronze wheel mounted on a truck`

**Current (empty, lifestyle images):** `alt=""` on `J70-Bronze-Three-Quarter-Dirt-V1-WEB.jpg`, `J69-Bronze-Head-On-V1-WEB.jpg`, `J70-Bronze-Lip-Dirt-V1-WEB.jpg`, `J69-Bronze-Dirt-face-Close-Up-V1-WEB.jpg`
**Proposed:**
- `J70-Bronze-Three-Quarter-Dirt-V1-WEB.jpg` → `Jackman J70 wheel in Matte Bronze, three-quarter view on a dirt trail`
- `J69-Bronze-Head-On-V1-WEB.jpg` → `Jackman J69 wheel in Matte Bronze, head-on view`
- `J70-Bronze-Lip-Dirt-V1-WEB.jpg` → `Close-up of Jackman J70 wheel lip in Matte Bronze, dirt trail setting`
- `J69-Bronze-Dirt-face-Close-Up-V1-WEB.jpg` → `Close-up of Jackman J69 wheel face in Matte Bronze on trail`

This is a sample, not the full catalog rewrite — `W-08`'s own 1-day estimate still
stands for doing every product. Written from what's visible in each filename/context;
verify against the actual image before publishing, per the guardrail against writing
alt text from a filename alone.

### W-10 — UTM-tagged social links

Append to each footer/header social href:
- Facebook: `?utm_source=site&utm_medium=social-icon&utm_campaign=footer`
- Instagram: `?utm_source=site&utm_medium=social-icon&utm_campaign=footer`
- YouTube, TikTok, X: same pattern.

### W-11 — Warranty line

**Current:** `5-Year Limited Lifetime Warranty`
**Proposed:** `Limited lifetime structural warranty and a five-year finish warranty — see full terms` (linked to `/pages/warranty`)

This is the exact approved phrasing already specified in `scripts/brand_check.ps1`'s own
`G12` rule message — not a new invention, just finally applied to the live PDP template.

---

## Handed off, not drafted here

- **W-05** (four fitment landing pages) — full new page copy, not a metadata fix. Handed
  to the Website agent (page structure/build notes) and Content agent (the actual
  200–400 words of fitment copy per page).
- **W-03** (duplicate collections) — needs Austin's decision on approach (fix the
  tagging so each collection actually filters, or consolidate and canonicalize) before
  anyone drafts a fix.
- **W-04, W-07** — an indexing/app-install decision and an app install, neither is a
  copy or markup draft.

---

## Brand guardrail check

W-06 and W-08's drafted text checked against `jackman-brand-guidelines` — no invented
spec, no filename-only alt text left as final (flagged as sample/needs-verification
above), correct `Model | Finish` conventions maintained. W-11's proposed line is the
guardrail's own already-approved phrasing, not new copy requiring a fresh check. `humanizer`
pass: all four drafted alt-text lines and the H1 kept short and literal, consistent with
how alt text and H1s should read (not marketing copy).

---

**FILE →** `04 Ecommerce and Web / 04 SEO` / `jackman-seo-audit-full-site-2026-09-25-v1.md`
