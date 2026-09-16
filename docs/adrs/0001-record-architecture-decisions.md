# 1. Record architecture decisions

**Date:** 2026-09-15
**Status:** Accepted

---

## Context

This project is run by one person. There is no default second reviewer, no standup
where a choice gets explained out loud, and no pull request where someone asks "why
this and not the other thing." A decision gets made in an afternoon and is load-bearing
by the following week.

Two systems already exist and neither one holds reasoning:

- **Asana** answers *what am I doing next.* Tasks close and the reasoning closes with them.
- **This folder tree** answers *where does the file live.* It holds what was produced,
  not why that shape was chosen over another.

The gap is visible in the work already here. The social strategy moved v1 → v2 in a
single day and retired an entire six-pillar framework — the v2 header records *that* it
superseded v1, but the argument for the new pillar set lives inside a 22,000-character
document rather than anywhere you could find it in ten seconds. The founder-names change
exists as a standalone proposal doc, which is the right instinct and the wrong filing
system: it has no number, no status, and nothing links to it. The brand palette is marked
provisional. The guidelines list the source-of-truth DAM as [TBD]. Each of those is a
decision that is either pending, made-but-unrecorded, or made-and-already-reversed.

Three weeks from now the reasoning is recoverable. Six months from now it is not, and the
cost lands as re-litigation: the same question re-argued from scratch, usually with less
context than the first time.

## Decision

We will record significant decisions as Architecture Decision Records, in the format
described by Michael Nygard.

- One decision per file, in `docs/adrs`.
- Sequentially numbered, never renumbered: `NNNN-short-title-in-kebab-case.md`.
- Each carries a **Status** — Proposed, Accepted, Superseded, or Deprecated.
- Sections: Context, Decision, Consequences.

**An accepted ADR is immutable.** When a decision changes, write a new ADR that supersedes
it and mark the old one `Superseded by ADR-NNNN`. Do not edit the original to reflect the
new thinking — the wrong turn is most of the value. An ADR that only ever contains the
final answer teaches nothing.

### What gets an ADR

The test is whether reversing it later would be expensive. Roughly: anything that
constrains future work, sets a standard others must follow, or was chosen over a
credible alternative.

Yes — the folder taxonomy itself. The Asana/SharePoint split. The naming convention.
Brand rules that govern all copy. Retiring founder names from consumer-facing work.
The DAM source of truth. Channel strategy that commits a quarter of effort.

No — copy drafts, campaign results, a caption that didn't land, a one-off scheduling
call, anything already covered by an existing brief or report. Those have homes in the
department tree and belong there.

Empty months are the expected state. Most weeks produce no ADR at all.

## Consequences

**What this buys.** A decision log that survives a six-month gap in attention. A place to
point when someone asks why a rule exists, instead of reconstructing it. Proposed ADRs
give a solo operator something to argue against — the closest available substitute for a
second reviewer. And the superseded chain makes reversals legible as reversals rather
than as quiet inconsistency.

**What it costs.** Writing one takes twenty to forty minutes of real thinking, and the
thinking is the point, which means it cannot be rushed without losing the benefit.
Discipline is the binding constraint: a log that captures four of the last ten decisions
is worse than none, because it implies the other six were never decided.

**The failure mode to watch.** ADRs written for things that should have been a Slack
message. The standing rule from `00-START-HERE` applies here too — this folder becomes
worthless the moment it turns into a second junk drawer. When in doubt, don't write one.

**Open.** This directory sits outside the 13-department structure and does not follow the
`jackman-` filename convention, both of which are themselves decisions this tree has
already made. Reconciling that — either by moving ADRs under `11 Marketing Operations /
04 SOPs and Process`, or by formally exempting `docs/` — is itself ADR-worthy, and should
be ADR-0002.
