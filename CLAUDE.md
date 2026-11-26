# Project rules for Claude

## Who I work with
- The owner's main language is **Arabic**; second language is English.
- Write in simple English. Explain hard English or technical words in simple English or in Arabic.
- Be direct and honest. Never flatter. If the work, the plan or the code has a problem, say so clearly.
- Report results truthfully: if a test failed or a step was skipped, say so. Never claim something works unless it was tested.

## Study material (G2 gas technician)
- When working with photos of the G2/G3 book or exams: read everything carefully and do not skip anything. If something was skipped, say so.
- Answer exam questions exactly as written.
- Do not add content from outside the book. If a fact is not in the book pages provided, say so instead of guessing.

## Agents in this repo (`.claude/agents/`)
| Agent | Job | Edits files? |
|---|---|---|
| `code-reviewer` | Finds bugs, security and quality problems, with `file:line` and a failure scenario | No |
| `code-fixer` | Fixes findings from a review report, smallest change, runs checks | Yes (never commits) |
| `tester` | Tests pages/apps in a real headless browser (phone + desktop) | No |

The agents cannot talk to each other. The main session carries each report to the next agent **in full**.

## Commands (`.claude/skills/`)
- `/review-and-fix <target>` — review → fix → commit → test → re-review, max 3 rounds.
- `/check <target>` — review + test only. Changes nothing.

## Workflow rules
- Always re-review after a fix: fixes often introduce new bugs.
- If a fix needs a **design decision** (how the product should behave), stop and ask the owner. Never let an agent guess.
- Commit each fix round separately so it can be undone.
- Never publish/update a live page or artifact, open a pull request, or merge without the owner's explicit OK.
- Never commit while an agent is still editing files.

## Projects
- `projects/water-heater-simulator/` — 3-D G2 Module 18 water-heater trainer (single HTML file, Three.js r128). It is a copy of a claude.ai artifact; changes here do not change the live page until it is republished with the owner's OK.
- `projects/safe-routine/` — SafeRoutine field-service app (single HTML file). Copy of a claude.ai artifact; same republish rule as above.
  - **Never publish SafeRoutine** until every rule in `projects/safe-routine/CODE-RULES.md` is marked Approved by the owner against the TSSA / Ontario codes (CSA B149.1 etc.).
  - Never invent or guess a code rule or limit. A rule with no checked source stays "Not checked".

## Copyright (G2/G3 book)
- Book photos and book text are **private between the owner and Claude**, used only to check rules.
- Never put book photos, scans or copied book text in the repo, the apps, or anything published. Use our own short wording plus a reference only (e.g. "G2 book, Module 18").

## Test notes
- In this cloud environment the CDNs are blocked: browser tests serve local copies of three@0.128.0 (`npm pack`) through Playwright `page.route`.
