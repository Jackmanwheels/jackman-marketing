# Documents and decks

How to build the files the team makes most: Word documents and PDFs, slide decks, and spec or dealer sell sheets. Every value below is a token on the Colors, Typography and Spacing pages.

## Word documents and PDFs

| Setting | Value |
|---|---|
| Page | Letter, portrait |
| Margins | 0.5in (`space-12`). Text-heavy memos and SOPs may go to 0.75in. This is a recommendation, not source policy. |
| Font | Poppins. Body Regular, headings Bold. Install it before opening a template. |
| Body | 10pt on 15pt, `ink` (#1C1C1C) |
| Title (`h1`) | 30pt on 34pt, ALL CAPS, character spacing expanded 0.18em (about 5.4pt in Word) |
| Section heading (`h2`) | 20pt on 24pt, ALL CAPS, expanded 0.18em |
| Sub-heading (`h3`) | 14pt on 18pt, ALL CAPS, expanded 0.18em |
| Caption | 8pt on 11pt |
| Legal | 6.5pt on 9pt, never under 6pt |
| Page ground | White when printed on an office printer. Bone (`surface`, light theme) when the file will only be read on screen as a PDF. |
| Accent | One `bronze` rule under the title block and above each `h2`. Nothing else is bronze. |

**Header band:** the stacked lockup (`jackman-lockup-stacked-black`) on a light page, at least 1.0in wide, with 1X clear space on all sides, in the top-left of the margin. Document title and date sit to its right. The lockup never moves into running headers on later pages: use the word "Jackman" in `eyebrow` style there.

**Footer:** `Jackman Wheels · Document title · v1.0 · Month D, 2026 · Internal use only`, in `caption`.

**Tables:** header row filled `silver` with `ink` text in `eyebrow` style, body rows `ink` on bone or white with a 1pt `rule` line under each row, numbers right-aligned. Never fill a table header with bronze or yellow.

**Callouts:** a 3pt bar on the left in `signal` (warnings and torque), `bronze` (heritage and notes) or `highlight` (the one item the reader must not miss), with the text in `ink` on a bone or white panel. Use at most one `highlight` callout per page.

## Slide decks

| Setting | Value |
|---|---|
| Size | 16:9, 1920 x 1080 |
| Default ground | Dark. `surface` (#1C1C1C) with `ink` text. A light content slide (bone ground) is fine for dense tables. |
| Title slide | Dark ground, `jackman-lockup-stacked-white` at least 480px wide, 2X clear space, one `bronze` rule, deck title in `hero`. |
| Content slide | `h1` for the slide title (ALL CAPS), body at 24pt minimum for projection. This size is a recommendation; the digital floor in the guide is 16px. |
| Margins | 64px (`space-16`) all sides. Logo-safe: nothing inside 1X of the logo. |
| Section divider | `highlight` fill with `on-highlight` text, used for section dividers only, one per section. |
| Data | `bronze` and `highlight` for emphasis on dark; `silver` and `khaki` for supporting series. Never more than five colors in one chart. |
| Footer | Slide number and the word Jackman in `eyebrow` style, bottom-right. The logo appears on the title and closing slides only. |
| Photography | Full-bleed or in a bone-bordered frame. Never overlay type directly on spoke detail: use a solid `surface` bar. |

## Spec sheets and dealer sell sheets

A spec sheet is read by someone deciding whether a wheel fits a truck. Legibility and accuracy beat everything else.

1. **Header:** `Model | Finish` as the title in `h1`, for example `J70 | Machined As-Cast`. Stacked lockup top-left on a light sheet or white lockup on a dark band.
2. **Fitment table:** header row `silver` fill, `eyebrow` style. Every value in `part-number` (monospace) so columns align. Columns in fixed order: Size, Bolt pattern, Offset, Backspacing, Center bore, Part number.
3. **Notation:** `17x9`, `6x139.7 / 6x5.5"`, `+18mm` with the sign always present, backspacing in inches with one decimal (`4.5"`), center bore never rounded. Full string: `J70 · 20x9 · 6x139.7 / 6x5.5" · +18mm`.
4. **Pending values:** load rating, certifications, torque, per-model bolt patterns and offsets are not published. If engineering has not supplied it, the cell reads `Load rating: pending engineering release`. Never copy a number from a competitor or from memory.
5. **Finish swatches:** photograph the actual finish. Do not fill a swatch with a brand token. Satin Black, Matte Bronze and Machined As-Cast are product names with their own screen approximations that appear only in product imagery.
6. **Warranty line:** "Limited lifetime structural warranty and a five-year finish warranty — see full terms." Link or print the terms, never paraphrase them.
7. **Dealer sheets:** add the dealer's logo only beside a divider rule with 2X clear space between rule and each mark. The Master Parts List governs fitment. Never write "guaranteed fit."
8. **Technologies:** mark ™ on first use and describe by function, not by superlative: "Radial Flow Form™ (R-FF™) controls radial material flow during forming to strengthen the barrel."

## Quick checks before anything leaves the building

- [ ] Poppins everywhere; JetBrains Mono only for part numbers
- [ ] Headings in caps with 0.18em tracking, body in sentence case
- [ ] Right logo file for the ground (`-black` on light, `-white` on dark), clear space intact, never recolored
- [ ] Bronze and yellow not in the same component; yellow never on a light ground as text
- [ ] No banned words, no unpublished specs, warranty wording exact
- [ ] Offsets signed, bolt patterns dual notation, straight inch marks
