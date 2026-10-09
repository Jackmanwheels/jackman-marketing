Jackman Wheels is a heritage California wheel brand returning in 2026 under Official Wheel Company. Everything made for it, from a Word memo to a trade-show panel, should read as one continuous brand. Precision is the argument: a revival that looks inconsistent reads as a licensing deal, not a continuation.

Start here, then read **Documents and decks** and **Logo and rules** before you build anything.

## Content fundamentals

- **Story sets up, spec closes.** One warm sentence, one hinge, then numbers. Never blend them in a sentence. "Harry Jackman flame-cut spokes by hand and welded them to 3/8-inch outer rims." Then the hinge. Then the spec.
- **Three voice traits, all required:** enthusiast-fluent (never define offset to an enthusiast), story-driven (California, a garage, Harry and Sheryl, racers and Volkswagen culture), technical and precise (numerals, short sentences, no filler adjectives).
- **Sentence case** for body and sub-heads. Headlines and model names are ALL CAPS in the `hero`, `h1`, `h2` and `h3` styles, already tracked at 0.18em.
- **Calm, not loud.** No exclamation marks, no hype words (best, ultimate, legendary about the product, beast, unleash, game-changer). Replace every superlative with a fact.
- **Banned claims:** "guaranteed fit," "lifetime warranty" without its qualifier, "DOT approved," any load rating or certification (JWL, VIA, SAE, TÜV), "race proven," "safe/safer." Nothing about a founding decade. When in doubt, cut the sentence.
- **Warranty wording, always:** "Limited lifetime structural warranty and a five-year finish warranty — see full terms."
- **Names:** "Jackman" in copy, "Jackman Wheels" in legal text. Models are `Classic 68` (space, never "J68" in copy) and `J69` to `J73` (no space, never "J70 Series"). Finishes are `Satin Black`, `Matte Bronze` and `Machined As-Cast`. Pair them as `Model | Finish` in labels, captions and tables.
- **Spec notation:** sizes `17x9`; bolt patterns metric first `6x139.7 / 6x5.5"`; offsets always signed `+18mm`; backspacing `4.75"`; straight inch marks `"`, never curly. Set all of these in `part-number`.
- **Trademarks:** ™ on first use per piece: Radial Flow Form™ (R-FF™), Reverse Draft Technology™, Dual Vector Retention™ (DV-RET™). Enhanced Bead Retention takes no ™.
- **No emoji.** The brand has none in its voice.

## Visual foundations

- **Ground:** dark is the default. Use `surface` with `ink` text on screens, decks and social. Documents and PDFs use the light theme: `surface` bone with `ink` text.
- **Ratio:** roughly 60% dark, 25% bone, 10% bronze, 5% everything else. Restraint is the visual argument; volume brands are the ones that shout.
- **Two accents with two jobs.** `bronze` is the signature: rules, key numbers, large headlines, heritage and story pieces. `highlight` (yellow) is for the single element that must be seen: the primary button, the one callout, a flag. Never use both in one component, and never put yellow on a light ground as text or a line (1.5:1).
- **Warnings:** `signal` is a bar or rule beside the message. The message itself is set in `ink`.
- **Support colors:** `silver` for spec-table headers and diagram lines, `graphite` for panels, `khaki` for apparel and story layouts.
- **Contrast traps, memorize these:** bronze on graphite (2.87:1), signal on dark (2.3:1), bone on khaki (2.0:1), bronze on khaki (1.7:1), highlight on bone (1.5:1). All fail. Bronze on `surface` clears 3:1 only, so it is for large text and UI, not paragraphs.
- **Finishes are not brand colors.** Satin Black, Matte Bronze and Machined As-Cast are product names. Never fill a swatch, product image or spec sheet with a brand token to stand in for a finish.
- **Type:** Poppins everywhere, matching jackmanwheels.com. Headings Bold ALL CAPS at 0.18em tracking; body Regular. JetBrains Mono for part numbers and fitment strings only. Both are free on Google Fonts. Install Poppins (Regular, Medium, SemiBold, Bold) and JetBrains Mono on every machine that makes documents.
- **Shape:** corners stay near-square (`radius-none`, `radius-sm`, `radius-md`). No shadows, glows, gradients or bevels.
- **Layout:** 12 columns, 12pt (`space-4`) gutter, 0.5in (`space-12`) margin, 3pt baseline. Keep logos and critical copy 0.25in inside trim.
- **Photography:** real wheels on real vehicles, finish shown accurately. Never composite the logo onto a wheel face. Never place the logo over a busy spoke photograph; use a solid dark bar or quiet sky.
- **Focus and states:** a 2px solid `focus` ring on every interactive element. Disabled is `ink-muted` at the text level, never an opacity fade on the logo.

## Iconography

The brand has no icon set. Do not invent a pictogram language. Use plain text labels, and use `bronze` hairlines (`rule`-weight, 1 to 2px) as the only graphic device. Emoji and stock icon packs are out.

## Open items

- Palette values are provisional in the source guide and unconfirmed against print proofs. The dark ground is set to the live site's #1C1C1C, so print black `jackman-black` (#0E0E0E) and screen `surface` differ by design.
- `highlight` (#F1C400) is a team addition that is not yet in the source brand guide.
- Radius tokens are a proposal, not source values.
- No horizontal one-line logo lockup and no SVG logo exist yet. Do not make your own.
