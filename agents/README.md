# Marketing Crew — Agents

This folder holds the Jackman marketing AI agents. They're built one at a time, not all
at once.

## Structure

One subfolder per agent:

```
agents/
  executive-assistant/   ← lead agent, ops & reporting
  chief-of-marketing/    ← lead agent, campaigns & creative
  <next-agent>/          ← added when we get to it
```

## Two peer leads, not one hierarchy

There are two leads, each owning a different domain, both reporting directly to Austin:

- **[Executive Assistant](executive-assistant/README.md)** — daily ops: the Portal
  refresh, decision triage.
- **[Chief of Marketing](chief-of-marketing/README.md)** — campaigns and creative
  direction: turns an idea into a full brief.

Future specialist agents get added underneath whichever lead would actually task them —
Website, SEO, Email, and Content agents sit under the Chief of Marketing, since that's
who generates their briefs. Built one at a time, as Austin decides — there's no fixed
roadmap for which comes next.

## Status

| Agent | Status |
|---|---|
| [Executive Assistant](executive-assistant/README.md) | Built — owns the daily Portal refresh + decision/task triage |
| [Chief of Marketing](chief-of-marketing/README.md) | Built — turns a campaign idea into a website/SEO/email/content brief |

Update this table as agents are added.
