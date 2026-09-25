# Marketing Crew — Agents

This folder holds the Jackman marketing AI agents. They're built one at a time, not all
at once.

## Structure

One subfolder per agent:

```
agents/
  executive-assistant/   ← lead agent, ops & reporting
    cro-agent/            ↳ specialist under the EA, funnel diagnosis
  chief-of-marketing/    ← lead agent, campaigns & creative
    content-agent/        ↳ specialist under the COM, drafts blog/social/scripts
    website-agent/        ↳ specialist under the COM, drafts landing/PDP copy
    email-agent/          ↳ specialist under the COM, drafts Klaviyo campaigns/flows
    seo-agent/            ↳ specialist under the COM, audits the live site directly
  <next-agent>/          ← added when we get to it
```

(Specialist agents are noted here as nested under their lead in this diagram; each
still gets its own top-level folder under `agents/` — see each lead's own README for
its actual specialists.)

## Two peer leads, not one hierarchy

There are two leads, each owning a different domain, both reporting directly to Austin:

- **[Executive Assistant](executive-assistant/README.md)** — daily ops: the Portal
  refresh, decision triage. First specialist: the
  **[CRO agent](cro-agent/README.md)** — diagnoses conversion/funnel problems on the
  live site.
- **[Chief of Marketing](chief-of-marketing/README.md)** — campaigns and creative
  direction: turns an idea into a full brief. Specialists: the
  **[Content agent](content-agent/README.md)** (drafts blog posts, social captions, and
  scripts), the **[Website agent](website-agent/README.md)** (drafts landing page and
  PDP copy), the **[Email agent](email-agent/README.md)** (drafts Klaviyo campaigns and
  flows), and the **[SEO agent](seo-agent/README.md)** (audits the live site directly and
  owns the SEO checklist's accuracy).

All four specialists originally named for the Chief of Marketing (Website, SEO, Email,
Content) are now built. Future specialist agents get added underneath whichever lead
would actually task or use them — the EA is the more likely home for what comes next,
since its side only has one specialist (the CRO agent) so far.

## Status

| Agent | Under | Status |
|---|---|---|
| [Executive Assistant](executive-assistant/README.md) | — (lead) | Built — owns the daily Portal refresh + decision/task triage |
| [Chief of Marketing](chief-of-marketing/README.md) | — (lead) | Built — turns a campaign idea into a website/SEO/email/content brief |
| [CRO agent](cro-agent/README.md) | Executive Assistant | Built — diagnoses conversion/funnel problems, live-site testing included |
| [Content agent](content-agent/README.md) | Chief of Marketing | Built — drafts blog posts, social captions, and scripts |
| [Website agent](website-agent/README.md) | Chief of Marketing | Built — drafts landing page and PDP copy, draft-to-file only |
| [Email agent](email-agent/README.md) | Chief of Marketing | Built — drafts Klaviyo campaign and flow emails, draft-to-file only |
| [SEO agent](seo-agent/README.md) | Chief of Marketing | Built — audits the live site directly, owns the SEO checklist's accuracy |

Update this table as agents are added.
