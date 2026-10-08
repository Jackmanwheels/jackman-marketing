---
name: wrap-up
description: Park-it skill for the end of a work session. Captures what was decided, what shipped, what's still open, and the single next step, writes it to a handoff note, and offers to save durable facts to memory — so tomorrow's chat starts warm instead of from scratch. Use when Austin says "wrap up", "park it", "let's stop here", "I'm done for the night", "save where we are", or when a long or late-night session is winding down.
---

Austin often builds late (9pm to midnight) and then picks the thread up in a new chat the next day, which starts cold. Your job is a tight close-out: five minutes, no new work.

## 1. Reconstruct the session
From this conversation (not guesses), list:
- **Decided** — choices Austin made, with the reason in a few words.
- **Shipped** — files created or changed (with paths), things sent, things scheduled.
- **Open** — questions unanswered, things blocked and on whom.
- **Next step** — the single most useful first move for the next session.

If something was only discussed and not done, say "discussed, not done". Never present planned work as finished. Report failures and untested things plainly.

## 2. Check the output rule
If any deliverable from this session was left as `.md` only and Austin is meant to read it, run the `ship-doc` skill on it first, or flag it in **Open**.

## 3. Write the handoff note
Create `00 Marketing Command Center\04 Weekly and Monthly Reviews\Session Handoffs\handoff-YYYY-MM-DD-<short-topic>.md` (make the folder if it doesn't exist). Use `date` for today's date. Format:

```
# Handoff — <topic> — YYYY-MM-DD
**Next step:** <one sentence>
## Decided
- ...
## Shipped
- ...
## Open
- ...
## Context the next chat needs
<3 to 6 lines: where the files are, anything non-obvious, anything not to touch>
```

Keep it under a page. The note is for Claude to read at the start of the next session, so it stays `.md` (no .docx/.pdf needed).

## 4. Offer memory saves
Look for durable facts that outlive this session: a preference Austin stated, a correction to how you work, a decision with a reason, a pointer to an external resource. Offer them as a short list and save only the ones he approves, one file per fact in the memory directory, with a `MEMORY.md` index line. Check for an existing memory to update before creating a new one. Don't save anything the repo, git history, or CLAUDE.md already records.

## 5. Close in three lines
1. What's done (one line).
2. The next step, and the handoff note path as a link.
3. How to resume: "Start the next chat with: `Pick up from <handoff filename>`."

## Rules
- Do no new work here. If you spot an unfinished task, list it under Open; don't start it.
- Don't touch the decisions inbox or other canonical files. Austin writes his own answers there.
- Don't send anything or create scheduled tasks. Offer them under Open if relevant.
- Tone: short, calm, no recap speeches. He's tired; make stopping easy.
