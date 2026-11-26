# Agents-1

Claude Code **agents** and **commands** that review, fix and test code, plus the first project they were used on.

> **بالعربي:** هذا المستودع فيه ثلاثة وكلاء (agents): واحد يراجع الكود ويبحث عن الأخطاء، وواحد يصلحها، وواحد يختبر الصفحة في متصفح حقيقي. وفيه أمران: `/review-and-fix` يشغّلهم كلهم بالترتيب، و`/check` يراجع ويختبر فقط بدون أي تعديل.

## The agents (`.claude/agents/`)

| Agent | What it does | Can edit files? |
|---|---|---|
| [`code-reviewer`](.claude/agents/code-reviewer.md) | Finds bugs, security and quality problems. Every finding has a `file:line` and a concrete failure scenario. Verdict: *Ready / Fix before merging / Needs major rework*. | No |
| [`code-fixer`](.claude/agents/code-fixer.md) | Takes a review report and fixes Critical + Warnings with the smallest change. Checks each finding is real first; runs tests. Never commits. | Yes |
| [`tester`](.claude/agents/tester.md) | Opens the page in a headless browser at phone and desktop size, clicks/taps/holds everything, collects console errors, takes screenshots. Says "not tested" instead of guessing. | No |

**Why three separate agents?** Each has a different job *and* different permissions. The reviewer and tester cannot edit, so they cannot hide a problem by "fixing" it. The fixer does not grade its own work.

**The agents cannot talk to each other.** The main Claude session carries each report to the next agent.

## The commands (`.claude/skills/`)

### `/review-and-fix <target>`
```
round 1..3:
  code-reviewer  → report
  (stop if no Critical / Warning)
  code-fixer     → fixes        (asks you first if a design decision is needed)
  commit + push  → each round can be undone
  tester         → browser test of the fixes + phone/desktop pass
  → failures go into the next round's review
summary → you decide: update the live page / open a PR / stop
```

### `/check <target>`
Review + test only. Changes nothing. Use it to see the state of some code before deciding to fix it.

## Use the agents in another project
```bash
scripts/install-agents.sh /path/to/other/project   # one project
scripts/install-agents.sh --user                   # every project (~/.claude)
scripts/install-agents.sh --user --force           # overwrite older copies
```
Then start a **new** Claude Code session there — agents load when a session starts.

## Projects
- [`projects/water-heater-simulator/`](projects/water-heater-simulator/index.html) — interactive 3-D water heater for G2 Module 18 (Learn / Operate / Diagnose / Code). Fixed over 3 rounds of `/review-and-fix`: a 5-minute pilot relight wait that cannot be skipped (and only counts with the knob OFF), reachable ECO trip, correct dip-tube fault, camera fit on phone/desktop, clear pilot-out messages.

## Lessons from the first run
- **Always review again after a fix.** Every second review found bugs that the previous fixes had introduced.
- **An independent tester matters.** It caught a bug in code that had only been syntax-checked.
- **Max 3 rounds.** Real code rarely gets to zero findings; stop and decide instead of looping forever.
- **Headless tests are not a real phone.** Always try the result on a real device too.

Project rules for Claude (language, honesty, study-material rules) are in [`CLAUDE.md`](CLAUDE.md).
