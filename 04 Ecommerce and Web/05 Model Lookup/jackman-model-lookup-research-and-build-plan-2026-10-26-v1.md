# Jackman Model Lookup: App Research + DIY Build Plan

**Date:** 2026-10-26 · **Owner:** Austin · **Status:** Draft for decision

## The short version

- **Idea rating: 8/10.** A "will this fit my truck?" lookup is the most important conversion tool a wheel brand can have. Fitment uncertainty is the biggest reason people bounce off a wheel page. The 2 points off are execution risk, not the idea itself: the hard part is the **vehicle data**, not the widget, and bad fitment data costs you returns and trust.
- **Recommendation: build it yourself (Option C below), with a small vehicle list we curate.** The lineup is 13 wheel SKUs on about 7 bolt patterns, and every one is truck, Jeep or off-road. The cheap apps ($19–49/mo) still make you enter the fitment yourself, so you would pay monthly for a dropdown. The apps that include vehicle data start around $250/mo, which is overkill for 13 wheels.
- **The starter code is already built and tested** against the live catalog (see "What's in this folder"). The real remaining work is filling in one spreadsheet of vehicles.

## What I found on the live store

Pulled from Shopify on 2026-10-26:

| Item | Finding | Why it matters |
|---|---|---|
| Theme | Prestige (Online Store 2.0) | Custom sections drop straight into the homepage and product templates through the theme editor. No app needed. |
| Wheel products | 13 active (Classic 68, J69–J73 across finishes) | Small catalog. A curated lookup is very manageable. |
| Bolt patterns sold | 5x127 (5x5), 5x150, 6x135, 6x139.7 (6x5.5), 8x165.1 (8x6.5), 8x170, 8x180 | About 7 patterns cover the whole lineup. This is what the lookup actually matches on. |
| Variant setup | **One combined option**, e.g. `17x8.5 \| 6x5.5 \| -6 MM`, named "Title" on most wheels | ⚠ See "Things you didn't ask about" #2 |
| Naming consistency | Mixed `17X9`/`17x9`, `12MM`/`12 MM`, double spaces, inch vs metric (variants say `6x5.5`, tags say `6x139`) | The code handles all of these, but it's worth cleaning up. |

## Part 1: Shopify app market research

| App | Price (check listing) | Vehicle data included? | Wheel-specific | Fit for Jackman |
|---|---|---|---|---|
| **EasySearch – Year Make Model Search** (NexusMedia) | From ~$19/mo, free trial | No, you upload fitment by CSV | Custom dropdowns (diameter, bolt pattern, offset) | Good if you want an app. Built for Shopify badge, 4.9★ (~150 reviews). **Best app pick.** |
| **C: Year Make Model Search** (Capacity Web Solutions) | ~$10 / $50 / $75 per mo | No, CSV | Wheel diameter / bolt / offset dropdowns | Budget option, 4.8★ (~95 reviews) |
| **AutoSync – Year Make Model** | $19 / $49 / $99 / $179 per mo | AI maps parts to vehicles | Wheel finder on $99 tier | Interesting AI mapping. Their **wheel visualizer** ("see it on your truck") is a separate sales contract. |
| **PartFinder: Year Make Model** | ~$49/mo, no free plan | No | Has a submodel level (useful for trims) | Fine, few reviews (13) |
| **Convermax** | From ~$250/mo; VIN search ~$850/mo | Yes, connects 15+ data sources incl. wheel-size | Full tire & wheel search | Built for 50k+ SKU catalogs. **Overkill.** |
| **Wheel-Size.com API** (data, not an app) | Free sandbox; ~$450/yr Basic, ~$750/yr Business (per site) | **Yes**: bolt pattern, hub bore, OE sizes, offsets for 60k+ vehicles | The industry-standard wheel fitment database | The best "real data" add-on if we outgrow a hand-built list. Needs dev work. |

**The takeaway:** the affordable apps are a nice UI on top of **data you still have to supply**. Since we have to build the vehicle list either way, the app only saves us the widget, and that's built now.

**When an app *would* be the right call:** if the team can't touch theme code at all, or if you want a turnkey wheel visualizer. If so, go with EasySearch ($19 tier, trial first) and upload the same spreadsheet described below.

## Part 2: Doing it yourself in Shopify

### Option A: Native Shopify only (no code) · 4/10
Use Search & Discovery filters by bolt pattern on collection pages. It's free, but it's not a model lookup: customers have to already know their bolt pattern, which is exactly the problem. It also won't work well until variants are split (see below).

### Option B: Fitment landing pages only · 6/10
One page per vehicle (Tacoma, Bronco, F-150, Wrangler…) showing the wheels that fit. This is great for SEO and already on the list as **W-05**. Keep it, but it's a complement, not the lookup.

### Option C: Custom "Shop by Vehicle" section (recommended) · 8/10
A theme section with Year → Make → Model dropdowns that:
- **Homepage:** shows every Jackman wheel that fits, with direct links to the exact size/bolt/offset variant.
- **Product page:** says "✓ Fits your 2021 Toyota Tacoma, 2 sizes fit" with one-tap variant links, or "No direct fit" with links to shop what does fit or ask the team.
- **Remembers the truck** (a "garage" in the browser), so someone who picks their vehicle on the homepage sees the fit check automatically on every product page.
- Reads vehicle data from one JSON file generated from an Excel sheet. To update it you edit Excel, run the script and re-upload. No code changes.
- Tracks every search (`jackman_fitment_search` event) so we see which vehicles people drive, including ones we **don't fit yet**.

**Cost:** $0/mo. **Effort:** about 1–2 days to install and QA once the vehicle sheet is filled in.

### Option D: Option C + Wheel-Size API · upgrade path
Swap the hand-built vehicle list for live Wheel-Size data (every year/make/model/trim). It runs ~$450–750/yr plus a small proxy, because the API key can't sit in the browser. Do this only if search data shows people looking for lots of vehicles we haven't listed.

## How the custom build works

```
Fitment Excel (you own it)
   │  python3 scripts/excel_to_fitment_json.py "fitment.xlsx"
   ▼
assets/jackman-fitment.json   ← year range, make, model, bolt pattern, hub bore, offset range, diameters, notes
   │
   ▼
sections/jackman-fitment-finder.liquid
   - homepage: reads all products typed "Wheels"
   - product page: reads only that product
   - matches vehicle bolt pattern (+ optional offset range / diameters) against each variant
```

Matching is done on the variant title (`size | bolt | offset`), with inch and metric bolt patterns treated as the same thing (6x5.5 = 6x139.7, 5x5 = 5x127, 8x6.5 = 8x165.1).

## What's in this folder

| File | What it is |
|---|---|
| `theme/sections/jackman-fitment-finder.liquid` | The lookup section. Add it to the homepage and product template in the theme editor. Colors, heading and help link are editable there. |
| `theme/snippets/jackman-fitment-product-json.liquid` | Helper the section uses. |
| `theme/assets/jackman-fitment.json` | Vehicle data. **Currently 13 SAMPLE trucks, which must be verified before launch.** |
| `jackman-vehicle-fitment-TEMPLATE.xlsx` | The sheet to fill in. Columns: year_from, year_to, make, model, bolt_pattern, hub_bore_mm, offset_min, offset_max, diameters, notes. |
| `scripts/excel_to_fitment_json.py` | Turns the sheet into the JSON file and flags bad rows. |

**Tested:** I ran the matching against every real variant name in the store, including the messy ones (`17X9`, `12MM`, double spaces). Every one parsed correctly, and the widget ran in a browser with no errors on desktop and mobile. **Not yet tested:** a live Prestige preview, which needs a duplicated theme (step 3 below).

## Install steps

1. **Fill the vehicle sheet.** This is the real work. Start with the vehicles our ambassadors and customers drive: Tacoma, 4Runner, Tundra, Bronco, F-150, Super Duty, Silverado/Sierra 1500 & HD, Ram 1500/2500, Wrangler, Gladiator. Have whoever owns engineering or fitment sign off on bolt pattern, hub bore and offset ranges.
2. **Run the script** to generate `jackman-fitment.json`.
3. **Duplicate the live theme** (Online Store → Themes → … → Duplicate). Never install on the live theme first.
4. In the duplicate's code editor, upload `sections/jackman-fitment-finder.liquid`, `snippets/jackman-fitment-product-json.liquid` and `assets/jackman-fitment.json`.
5. **Theme editor → Home page → Add section → "Jackman fitment finder"**, placed right under the hero.
6. **Theme editor → Products → Default product → Add section**, placed directly below the product info (above the description).
7. QA on mobile: pick a vehicle on the homepage, click through to a product, and confirm the fit message and variant links select the right size.
8. Publish. In GA4, add a custom event report for `jackman_fitment_search`.

## Things you didn't ask about (but should know)

1. **Your Excel file probably isn't the right data.** A product-info sheet describes the *wheels* (size, bolt pattern, offset, load rating). A model lookup needs the *vehicles* (what bolt pattern, hub bore and offset range each truck takes). That's a second sheet, and it's the one that matters. Send me the product Excel and I can check what's in it and pre-fill as much as possible.
2. **Split the combined variant option.** Right now each wheel has one option holding `17x8.5 | 6x5.5 | -6 MM`. Splitting it into three options (Size / Bolt Pattern / Offset) would turn on Shopify's native filters, cleaner Google Shopping data and a better variant picker on the product page. The lookup works either way, but the variant names would need a matching parser update if they change. Rating: **7/10, do it before or alongside launch**, since every other tool benefits.
3. **Clean up naming.** Use metric bolt patterns everywhere (6x139.7, not 6x5.5 in variants and 6x139 in tags), lowercase `x`, and the same spacing on `MM`. Small effort, prevents future bugs.
4. **Lift and leveling change the answer.** Offset that clears a stock Tacoma differs from a leveled one. Version 1 matches bolt pattern plus optional offset range. Version 2 could add a "Stock / Leveled / Lifted" toggle. Don't build that until search data says people want it.
5. **Hub bore is a silent return-maker.** If a wheel's center bore is smaller than the vehicle's hub, it physically won't go on, even with the right bolt pattern. Add each wheel's bore to the data before launch.
6. **Add a fitment disclaimer** under the results ("Fitment shown for stock vehicles. Confirm with our team for lifted builds.") and link the help button to a real contact or chat. Run the wording past the brand claim rules.
7. **"No fit" searches are R&D gold.** As a manufacturer, the vehicles people search that we *can't* fit tell you which bolt patterns to tool next. Pull that report monthly.
8. **Tie it into W-05 fitment pages and email.** Once someone picks a vehicle, a "Tacoma owners" Klaviyo segment and vehicle-specific landing pages become possible. That's a strong second phase.
9. **Dealers.** The same JSON could power a dealer-facing fitment page or a printable fitment chart.

## Decision needed from you

1. Go with the DIY build (recommended), or trial EasySearch first?
2. Who owns and signs off on the vehicle fitment data?
3. Do we split variants into three options before launch, or after?

## Sources

- [Spark Shipping: The 8 Best Shopify Year Make Model (Fitment) Apps](https://www.sparkshipping.com/blog/the-best-shopify-fitment-apps-for-shopify-year-make-and-model-data)
- [PickYourApp: Best Year Make Model Search Apps for Shopify in 2026](https://pickyourapp.com/blogs/news/best-year-make-model-search-apps-for-shopify-in-2026-a-complete-guide-for-auto-parts-merchants)
- [Rankbase: The 10 Best Year Make Model Apps for Shopify](https://rankbase.io/best-shopify-apps/year-make-model)
- [Craftshift: Best Shopify apps for auto parts stores 2026](https://craftshift.com/best-shopify-apps-auto-parts-stores-2026/)
- [AutoSync – Year Make Model (Shopify App Store)](https://apps.shopify.com/autosync-2)
- [Convermax docs: Other integrations (AutoSync visualizer)](https://docs.convermax.com/shopify/other-integrations/)
- [Wheel-Size developer API](https://developer.wheel-size.com/) · [API plans](https://api-demo.wheel-size.com/api-plans/)
- [Four Wheel Digital: Wheel fitment data guide (Hollander, ACES, PIES)](https://fourwheel.digital/wheel-resellers-guide-to-fitment-data-hollander-aces-pies-and-wheel-size-com-explained/)
- [FitmentPro (Shopify App Store)](https://apps.shopify.com/fitmentpro-automotive-carparts)

App prices come from third-party roundups and app listings as of Oct 2026. Confirm on the Shopify App Store before committing; the App Store itself wasn't reachable from my research environment.
