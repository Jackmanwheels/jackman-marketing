// Markdown -> styled standalone HTML. Usage: node md2html.mjs <in.md> <out.html>
// Run from a folder where `marked` is installed (ship-doc.ps1 handles that).
import { readFileSync, writeFileSync } from "node:fs";
import { marked } from "marked";

const [, , input, output] = process.argv;
if (!input || !output) {
  console.error("usage: node md2html.mjs <in.md> <out.html>");
  process.exit(2);
}

let md = readFileSync(input, "utf8");
md = md.replace(/^﻿/, "").replace(/^---\r?\n[\s\S]*?\r?\n---\r?\n/, ""); // drop YAML frontmatter
const body = marked.parse(md, { gfm: true });

const css = `
body { font-family: Arial, sans-serif; font-size: 11pt; color: #222; line-height: 1.4; }
h1 { font-size: 22pt; color: #1F3A5F; margin: 0 0 8pt; }
h2 { font-size: 16pt; color: #1F3A5F; margin: 16pt 0 6pt; }
h3 { font-size: 13pt; color: #1F3A5F; margin: 12pt 0 4pt; }
p, li { margin: 4pt 0; }
table { border-collapse: collapse; width: 100%; margin: 8pt 0; }
th { background: #1F3A5F; color: #fff; text-align: left; border: 1px solid #1F3A5F; padding: 4pt 6pt; }
td { border: 1px solid #bbb; padding: 4pt 6pt; vertical-align: top; }
tr:nth-child(even) td { background: #F2F5F9; }
code { font-family: Consolas, monospace; font-size: 10pt; background: #F2F2F2; }
pre { font-family: Consolas, monospace; font-size: 9.5pt; background: #F2F2F2; padding: 6pt; }
blockquote { border-left: 3px solid #1F3A5F; margin-left: 0; padding-left: 10pt; color: #444; }
`;

writeFileSync(
  output,
  `<!doctype html><html><head><meta charset="utf-8"><style>${css}</style></head><body>${body}</body></html>`,
  "utf8"
);
