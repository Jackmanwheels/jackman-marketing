# Jackman Marketing — File and Folder Naming Convention

**Owner:** Austin Fitzgerald · **Version:** v1 · **Date:** 2026-08-26
**Governed by:** `jackman-brand-guidelines` → `naming-and-nomenclature.md` and
`governance-and-operations.md`. Where this document and the brand guidelines
disagree, **the brand guidelines win.**

---

## Why this exists

Naming discipline looks like fussiness right up until the week a dealer orders the
wrong offset off a sell sheet, or someone ships `Jackman_J70_FINAL_v3.JPG` to a
printer and nobody can tell whether it is the current art. Consistent naming is the
cheapest returns-prevention tool in the business and the only thing that makes search
work at ten times the current file volume.

---

## Folders vs. files — two different rules

They are named differently on purpose, and the reason is who reads them.

| | Convention | Why |
|---|---|---|
| **Folders** | `NN Title Case With Spaces` | Humans browse folders in a web UI. Numbers force the sort order. Title case is readable at a glance. |
| **Files** | `lowercase-hyphenated` | Files get linked, synced, searched, and served. Case-sensitive servers turn `Jackman-J70.jpg` and `jackman-j70.jpg` into two files and one broken link. Spaces become `%20`. |

**No ampersands in folder names.** Use "and." Ampersands break URL encoding in some
tools and have already caused one bad folder name in this library.

**Four levels maximum** below `00 Marketing Department`. Full paths past ~400
characters break OneDrive sync.

---

## The file pattern

```
jackman-[subject]-[descriptor]-[date or version].[ext]
```

Lowercase only. Hyphens — never underscores, never spaces, never camelCase.
Dates as `YYYY-MM-DD` (the only format that sorts chronologically as text).
Versions as `v1`, `v2` — lowercase v, no zero padding, last field before the extension.

### Never the word "final"

There is no final. `final-final-v3-USE-THIS.jpg` is how it always ends.

### Product assets

```
jackman-[model]-[finish]-[view]-[context]-[version].[ext]
```

Model uses the **filename** short code — `j68` for Classic 68, `j69`–`j73` for the
J-Series. Finish is hyphenated lowercase. Views come from a fixed vocabulary:
`front`, `three-quarter`, `profile`, `detail`, `lifestyle`, `studio`, `spoke`,
`cap`, `barrel`.

| Example | What it is |
|---|---|
| `jackman-j68-satin-black-three-quarter-studio-v1.jpg` | Classic 68, Satin Black, studio 3/4 hero |
| `jackman-j70-machined-as-cast-profile-studio-v1.png` | J70, profile, transparent background |
| `jackman-j69-matte-bronze-social-1x1-v3.jpg` | J69 social crop, square, third version |

Social crops carry the aspect ratio in the name — `1x1`, `4x5`, `9x16`. It prevents
the wrong crop shipping to the wrong placement.

### Documents and working files

| Example | What it is |
|---|---|
| `jackman-sell-sheet-j70-2026-q3-v2.pdf` | J70 dealer sell sheet, Q3 2026 |
| `jackman-campaign-brief-sema-2026-v1.docx` | Campaign brief |
| `jackman-paid-results-meta-2026-08.xlsx` | Monthly paid report |
| `jackman-ugc-2026-04-12-handle-permission.pdf` | Filed UGC permission |
| `jackman-email-master-darkmode-tested-v4.html` | Email master template |

### Logo and identity files carry NO version number

There is exactly one current `jackman-lockup-stacked-white.png`. When it is replaced,
the old one moves to `99 Archive / Superseded` under a dated subfolder and the live
filename stays identical — so every link, layout, and template pointing at it keeps
resolving.

**The test:** does anything link to this file by path? If yes, no version number.

---

## The J68 trap

Asset filenames use `J68` for the Classic 68. **Customer-facing copy must always say
"Classic 68."** Both are correct in their own layer, and the line between them is alt
text and captions — which are typed by hand from the copy deck, never copied from the
file browser.

Before anything ships, search the draft for "J68". It should return zero hits in copy.

---

## Finish names — three exact strings

**Satin Black · Matte Bronze · Machined As-Cast**

Never Gloss Black, Flat Black, Copper, Gold, Polished, Chrome, Silver, or bare
"Bronze" / "Black" / "Machined". Each of those causes a specific, traceable return.

---

## Quick reference

| Wrong | Right |
|---|---|
| `Jackman_J70_FINAL_v3.JPG` | `jackman-j70-satin-black-front-studio-v3.jpg` |
| `Sell Sheet (new).pdf` | `jackman-sell-sheet-j70-2026-q3-v2.pdf` |
| `08-13-26 report.xlsx` | `jackman-paid-results-meta-2026-08.xlsx` |
| `02 Product & Marketing` (folder) | `02 Product Marketing` (folder) |
| `logo v2 final.png` | `jackman-lockup-stacked-white.png` (no version) |
| Alt text: `j68-satin-black.jpg` | Alt text: `Jackman Classic 68 in Satin Black` |
