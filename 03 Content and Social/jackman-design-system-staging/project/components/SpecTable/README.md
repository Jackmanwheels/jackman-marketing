The spec table is how fitment gets read. Provide the rows from the engineering spec sheet, never from memory.

- Header row is a `silver` fill with `jackman-black` text (11.2:1) in `eyebrow` style, in every theme.
- Data cells use `part-number` (monospace). The first column (size or label) is `body-strong`.
- Separate rows with a 1px `rule` line. No zebra fills, no bronze or yellow header.
- Notation: sizes `17x9`; bolt patterns metric first with the imperial equivalent `6x139.7 / 6x5.5"`; offsets always signed `+18mm`, and zero is `0mm`, never `+0mm`; backspacing in inches with one decimal.
- Unpublished values (load rating, certifications, torque, per-model offsets) show `pending engineering release`. Never leave a blank cell and never estimate.
- Wrap the table in a horizontally scrolling container on narrow screens; do not shrink the type below `part-number`.
