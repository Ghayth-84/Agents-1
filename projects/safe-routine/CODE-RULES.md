# SafeRoutine — Code Rules List

Every safety rule the app uses must be checked against the **TSSA / Ontario codes**
(see Sources below) and **approved by the owner**
before the app is published or used for real work.

## Sources (only these count)
All rules must come from **Ontario building codes and gas codes**, as adopted and enforced in Ontario by TSSA:

| Code | What it covers | Notes |
|---|---|---|
| **TSSA Act, 2000 + Ontario Regulation 212/01 (Gaseous Fuels)** | Ontario's gas law: unsafe conditions, red tags, notices to the distributor | TSSA enforces it |
| **Ontario Regulation 215/01 (Fuel Industry Certificates)** | Licence classes and scope (G3 / G2 / G1, BTU/hr limits) | |
| **CSA B149.1** (Natural Gas and Propane Installation Code) | Installation, venting, combustion air, clearances, leak/pressure testing | Use the edition Ontario has adopted |
| **CSA B149.2** (Propane Storage and Handling Code) | Propane tanks and cylinders | Only if propane jobs are in scope |
| **TSSA Code Adoption Document (gas)** | Ontario's changes ("amendments") to the CSA codes | Overrides the plain CSA text in Ontario |
| **Ontario Building Code (O. Reg. 332/12)** | Building rules (e.g. CO alarms, venting through walls, mechanical rooms) | |

Claude must check these code names and numbers too. The owner confirms the editions used.

**Copyright rule:** this list uses our own short wording and a reference only.
No book photos, scans or copied book or code text go in this file or in the app.

**Status values:** `Not checked` · `Approved` · `Wrong — fix needed`

Where the rule came from:
- **Owner** = the owner told Claude (in chat). Still needs a code reference.
- **App** = it was already in the app. Nobody has checked it yet.

## Red tag (unsafe condition)

| # | Rule in the app | Came from | Code to check | Code reference (section) | Status | Owner notes |
|---|---|---|---|---|---|---|
| R1 | For an immediate hazard: shut off the gas to the appliance | Owner | O.Reg 212/01, B149.1 | | Not checked | |
| R2 | Inform the customer | Owner | O.Reg 212/01 | | Not checked | |
| R3 | Tell the gas utility verbally, right away | Owner | O.Reg 212/01 | | Not checked | |
| R4 | Written notice to the gas utility within 14 days | Owner | O.Reg 212/01 | | Not checked | |
| R5 | A red tag can be put on by a licensed gas tech, G3 or higher | Owner | O.Reg 215/01 | | Not checked | |
| R6 | A red tag can only be removed by G2 / G1 or a TSSA inspector, after the defect is corrected | Owner | O.Reg 212/01, 215/01 | | Not checked | |
| R7 | It does not have to be the same technician/company that put the tag on | Owner | O.Reg 212/01 | | Not checked | |
| R8 | A G3 cannot remove a red tag; a G2/G1 must verify the repair | Owner | O.Reg 215/01 | | Not checked | |
| R9 | G2 covers appliances up to 400,000 BTU/hr; above that a G1 is needed | Owner | O.Reg 215/01 | | Not checked | |
| R10 | On removal: record remover's name, address, TSSA certificate number; send the notice to the gas distributor | Owner | O.Reg 212/01 | | Not checked | |
| R11 | Homeowners, landlords, general contractors and helpers may not remove a tag or turn the gas back on | Owner | O.Reg 212/01 | | Not checked | |
| R12 | A job cannot be closed while an immediate-hazard red tag is open, until R1–R3 are recorded | Owner (from answer) | O.Reg 212/01 | | Not checked | |

## Leak test

| # | Rule in the app | Came from | Code to check | Code reference (section) | Status | Owner notes |
|---|---|---|---|---|---|---|
| L1 | Result is one of: Pass / Fail (leak detected) / Inconclusive (re-check needed) | App | B149.1 | | Not checked | |
| L2 | Fail or Inconclusive needs a passing re-test or a red tag before the job can close | Owner (from answer) | B149.1, O.Reg 212/01 | | Not checked | |
| L3 | A leak test may be "skipped" with a written reason | App | B149.1 | | Not checked | Should skipping be allowed on gas installation/replacement jobs? |

## Approval and licences

| # | Rule in the app | Came from | Code to check | Code reference (section) | Status | Owner notes |
|---|---|---|---|---|---|---|
| A1 | A G2 or higher may approve their own job; a G3 may not | Owner | O.Reg 215/01 | | Not checked | |
| A2 | Licence levels in the app: None / G3 / G2 / G1 | Owner | O.Reg 215/01 | | Not checked | |

## Readings and checks (HVAC / gas)

| # | Rule in the app | Came from | Code to check | Code reference (section) | Status | Owner notes |
|---|---|---|---|---|---|---|
| G1 | Readings recorded: inlet pressure (static + dynamic), manifold pressure, temperature rise, flue CO air-free, CO₂, O₂, flame signal, supply and return air | App | B149.1, manufacturer | | Not checked | Are any missing or wrong? |
| G2 | Flue CO ≥ 400 ppm air-free shows a warning only (does not block) | App | B149.1, TSSA CAD, manufacturer | | Not checked | Correct limit? Should it block or require a red tag? |
| G3 | No pressure limits are checked (any positive number is accepted) | App | B149.1, rating plate | | Not checked | Should the app warn outside the rating-plate range? |
| G4 | Required checks: safety limits tested; venting, combustion air and clearances checked; CO alarm present; appliance left safe | App | B149.1, Ontario Building Code | | Not checked | |

## How to approve a rule
1. Check it in your G2 book or the TSSA document.
2. Tell Claude in chat: the rule number, Approved or Wrong, and the reference (e.g. "R4 approved — G2 book Module X").
   You can send book photos privately in chat. They are only used for checking and are never saved in the repo or the app.
3. Claude updates this list and, if a rule is wrong, fixes the app, then re-reviews and re-tests it.
