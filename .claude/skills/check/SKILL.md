---
name: check
description: Review and test a file, folder, or the current changes WITHOUT changing anything, using the code-reviewer and tester agents. Use when the user runs /check, or wants to know the state of some code before deciding whether to fix it.
---

# Check (read-only)

Target: the arguments given (file, folder, branch, or commit range). If none, use the uncommitted changes (`git diff HEAD`); if there are none, use the latest commit (`git diff HEAD~1 HEAD`). If there is still nothing to check, ask the user.

## Steps
1. Run the `code-reviewer` agent on the target. If the target is a diff, tell it what the change was meant to do (read the commit messages) so it can find bugs the change introduced.
2. If the target includes a web page or app that runs in a browser, run the `tester` agent on it. Tell it the main features and any risky areas the review found, so it tests those first. Skip this step for code that has no browser UI and say so.
   - Steps 1 and 2 are independent: run them in parallel when possible.
3. Do NOT run `code-fixer`. Do NOT edit, commit, publish, or open pull requests.

## Report to the user
- One-line verdict: **Healthy**, **Has warnings**, or **Has critical problems**.
- Reviewer findings grouped by Critical / Warnings / Suggestions, each in one or two simple sentences.
- Tester results: what passed, what failed, what was not tested, and the limits of the test (e.g. no real phone).
- Clearly mark anything that BOTH agents found (strongest evidence) and anything only one found.
- Then ask: run `/review-and-fix` on the findings, or stop here.
- The user's main language is Arabic: use simple English with a short Arabic summary at the end.
