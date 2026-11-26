# SafeRoutine — Code Rules List

Every safety rule the app uses must be checked against the **TSSA / Ontario codes**
(CSA B149.1, Ontario Regulation 212/01 and TSSA documents) and **approved by the owner**
before the app is published or used for real work.

**Copyright rule:** this list uses our own short wording and a reference only.
No book photos, scans or copied book or code text go in this file or in the app.

**Status values:** `Not checked` · `Approved` · `Wrong — fix needed`

Where the rule came from:
- **Owner** = the owner told Claude (in chat). Still needs a code reference.
- **App** = it was already in the app. Nobody has checked it yet.

## Red tag (unsafe condition)

| # | Rule in the app | Came from | Code reference | Status | Owner notes |
|---|---|---|---|---|---|
| R1 | For an immediate hazard: shut off the gas to the appliance | Owner | | Not checked | |
| R2 | Inform the customer | Owner | | Not checked | |
| R3 | Tell the gas utility verbally, right away | Owner | | Not checked | |
| R4 | Written notice to the gas utility within 14 days | Owner | | Not checked | |
| R5 | A red tag can be put on by a licensed gas tech, G3 or higher | Owner | | Not checked | |
| R6 | A red tag can only be removed by G2 / G1 or a TSSA inspector, after the defect is corrected | Owner | | Not checked | |
| R7 | It does not have to be the same technician/company that put the tag on | Owner | | Not checked | |
| R8 | A G3 cannot remove a red tag; a G2/G1 must verify the repair | Owner | | Not checked | |
| R9 | G2 covers appliances up to 400,000 BTU/hr; above that a G1 is needed | Owner | | Not checked | |
| R10 | On removal: record remover's name, address, TSSA certificate number; send the notice to the gas distributor | Owner | | Not checked | |
| R11 | Homeowners, landlords, general contractors and helpers may not remove a tag or turn the gas back on | Owner | | Not checked | |
| R12 | A job cannot be closed while an immediate-hazard red tag is open, until R1–R3 are recorded | Owner (from answer) | | Not checked | |

## Leak test

| # | Rule in the app | Came from | Code reference | Status | Owner notes |
|---|---|---|---|---|---|
| L1 | Result is one of: Pass / Fail (leak detected) / Inconclusive (re-check needed) | App | | Not checked | |
| L2 | Fail or Inconclusive needs a passing re-test or a red tag before the job can close | Owner (from answer) | | Not checked | |
| L3 | A leak test may be "skipped" with a written reason | App | | Not checked | Should skipping be allowed on gas installation/replacement jobs? |

## Approval and licences

| # | Rule in the app | Came from | Code reference | Status | Owner notes |
|---|---|---|---|---|---|
| A1 | A G2 or higher may approve their own job; a G3 may not | Owner | | Not checked | |
| A2 | Licence levels in the app: None / G3 / G2 / G1 | Owner | | Not checked | |

## Readings and checks (HVAC / gas)

| # | Rule in the app | Came from | Code reference | Status | Owner notes |
|---|---|---|---|---|---|
| G1 | Readings recorded: inlet pressure (static + dynamic), manifold pressure, temperature rise, flue CO air-free, CO₂, O₂, flame signal, supply and return air | App | | Not checked | Are any missing or wrong? |
| G2 | Flue CO ≥ 400 ppm air-free shows a warning only (does not block) | App | | Not checked | Correct limit? Should it block or require a red tag? |
| G3 | No pressure limits are checked (any positive number is accepted) | App | | Not checked | Should the app warn outside the rating-plate range? |
| G4 | Required checks: safety limits tested; venting, combustion air and clearances checked; CO alarm present; appliance left safe | App | | Not checked | |

## How to approve a rule
1. Check it in your G2 book or the TSSA document.
2. Tell Claude in chat: the rule number, Approved or Wrong, and the reference (e.g. "R4 approved — G2 book Module X").
   You can send book photos privately in chat. They are only used for checking and are never saved in the repo or the app.
3. Claude updates this list and, if a rule is wrong, fixes the app, then re-reviews and re-tests it.
