---
name: ship-doc
description: Converts a markdown deliverable into .docx and .pdf next to it (same basename) so Austin can actually open and forward it. Use whenever a written deliverable (brief, strategy, report, playbook, spec, summary) has been saved as .md, when Austin says "ship it", "make it a Word doc / PDF", "I can't open that", or at the end of any task that produced a .md meant for him to read. Austin cannot open .md files, so never hand one over as the final deliverable.
---

Austin can't open markdown. The `.md` stays as the editable source; the `.docx` and `.pdf` are what he reads and forwards. Same folder, same basename.

## Run it

```bash
powershell -NoProfile -ExecutionPolicy Bypass -File "C:/Users/AustinFitzgerald/OneDrive - arproseries.com/Documents/00 Marketing Department/.claude/skills/ship-doc/ship-doc.ps1" -Source "<full path to the .md>"
```

- `-ExecutionPolicy Bypass` applies to that one command only (scripts are blocked on this machine by default). Don't change the system policy.
- Use a full path. Takes a few seconds; the first-ever run also installs `marked` into `%TEMP%\shipdoc-work` (outside OneDrive).
- Expected output: two `OK` lines (docx, pdf) and `headings=N`. `headings=0` on a doc that had `#` headings means something went wrong; investigate before telling Austin it's done.
- Put a timeout on the command (`timeout 120`). It normally finishes in seconds.

## What it does
Markdown (YAML frontmatter stripped) → styled HTML (Arial, navy `#1F3A5F` headings, bordered tables with header fill and zebra rows) → Word via COM (US Letter, 1" margins, page-number footer) → saves `.docx` and exports `.pdf`. Headings become real Word Heading 1/2/3, so the navigation pane works.

## Rules
- **Only close Word processes this script launched.** The script already snapshots Word PIDs and cleans up just its own instance. Austin may have Word open with unsaved work: never `Stop-Process` or `taskkill` a Word you didn't start, and never kill by name.
- **Known trap:** Word hangs if a path reaches `SaveAs2` / `ExportAsFixedFormat` as a PowerShell-wrapped string (e.g. straight from `Join-Path`). The `[string]` / `[int]` casts in the script are required; keep them if editing it.
- Spreadsheets already ship as `.xlsx`; don't convert them. Handoff notes from `wrap-up` are for the next chat, not a deliverable, so they stay `.md`.
- Don't overwrite a `.docx` or `.pdf` Austin may have edited by hand: if one already exists and is newer than the `.md`, ask before replacing it.
- After shipping, tell Austin the two filenames and the folder. Link them.
