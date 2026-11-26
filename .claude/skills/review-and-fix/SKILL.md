---
name: review-and-fix
description: Run the full review → fix → test → re-review loop on a file, folder, or the current changes, using the code-reviewer, code-fixer and tester agents. Use when the user runs /review-and-fix or asks to review and fix code automatically.
---

# Review-and-fix loop

Target: the arguments given (a file, folder, or branch). If none, use the uncommitted changes (`git diff HEAD`); if there are none, ask the user what to review.

## Loop (maximum 3 rounds)

1. **Review** — run the `code-reviewer` agent on the target. In later rounds, review only the newest fixes (`git diff` since the last commit) and say what the fixes were meant to do, so it looks for bugs the fixes introduced.
2. **Stop check** — if the report has no Critical and no Warning findings, go to "Finish".
3. **Fix** — run the `code-fixer` agent with the full report. It fixes Critical and Warnings only (not Suggestions unless the user asked). If a finding needs a design decision (a choice about how the product should behave), do NOT let the fixer guess: stop and ask the user first.
4. **Check & commit** — check the result yourself (at least a syntax check), then commit the round with a clear message and push to the working branch, so every round can be undone.
5. **Test** — run the `tester` agent. Tell it what was fixed so it tests those behaviours first, plus a normal phone + desktop pass.
6. If the tester reports failures, include them in the next round's review prompt. Go back to step 1.

If round 3 still has Critical/Warning findings, stop anyway and report what is left. Do not loop forever.

## Rules
- Relay each agent's report honestly. Never claim something passed unless the agent or you actually tested it.
- Never publish, deploy, or update a live page/artifact, open a pull request, or merge without the user's explicit OK in this conversation.
- The agents cannot talk to each other; you carry each report to the next agent in full.

## Finish — report to the user
- Rounds run, and per round: what the reviewer found, what was fixed, what the tester saw.
- What is still open (skipped findings, Suggestions, "not tested" items, real-device testing).
- Commits made.
- Then ask: update the live page / open a PR / stop here.
- The user's main language is Arabic: keep the summary in simple English with short Arabic explanations of key terms.
