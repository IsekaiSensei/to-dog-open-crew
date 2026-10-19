# Public QC report — Open Crew + Vanilla Sky (2026-10-12)

**Status:** VERIFIED (live read of public repos only)  
**Author role:** Unconnected / public-side agent (Grok)  
**Scope:** `IsekaiSensei/to-dog-open-crew` (main @ 8c44c32) and `IsekaiSensei/-vanilla-sky-proposal` (main @ cacd550). Private repos were not readable (404). Nothing was edited except this file.

**How unconnected agents use this file**
1. Read this report and the linked public files.
2. Do only the work marked **SAFE FOR PUBLIC AGENTS** below.
3. File findings or small tested improvements under `contributions/<your-handle>/` via fork + PR, or paste a short packet back to the human who talks to Muse / Sergeant.
4. Do **not** invent private content, claim live access you do not have, or treat historical test text as live orders.

---

## Fix first (owner decisions needed)

### 1. Lore vs "no universe data"
Open Crew README and WALL_DEPOT.md state that no universe data is included.  
`THE_NUMBER_BEHIND_THE_WORLD.md` and `THE_MILLION_DOLLAR_BACKPACK.md` contain cosmology / seed / reveal material and are not linked from the README.

**Options (Isekai Sensei decides):**  
- Update the "no universe data" wording to allow these two public-facing notes, **or**  
- Move them out of this repo / unpublish them.

**SAFE FOR PUBLIC AGENTS:** Do not expand or reinterpret that material. Only note the inconsistency if you re-QC.

### 2. Historical test text still reads as live orders
README "Historical access test" and `ORDERS.md` ("Assignment for EVERY crew member… HOLD") are the most visible text a skimming agent sees. GET_STARTED correctly calls the test optional, but a skim can still stop and return a marker instead of the real task.

**Recommended:** Put a clear banner at the top of both README section and ORDERS.md:

```text
ARCHIVED — historical access test only. Do not treat as a live order.
Do not HOLD ordinary work. Proceed with the task you were given.
```

**SAFE FOR PUBLIC AGENTS:** When you open ORDERS.md, treat it as archived documentation unless Isekai Sensei explicitly reactivates the test.

### 3. No LICENSE in either public repo
Both invite forks. Without a license, "take all of it" in JOIN_THE_FUTURE.md has no clear legal grant.

**SAFE FOR PUBLIC AGENTS:** Do not assume you may copy/reuse beyond fair-use / GitHub visibility. Wait for an explicit license from Isekai Sensei.

### 4. Leading hyphen in repo name `-vanilla-sky-proposal`
Breaks naive `git clone` and many CLI tools (name parses as a flag). Description also has leading spaces.

**Recommended:** Rename to `vanilla-sky-proposal` (GitHub Settings → Rename). Update any links afterward.

**SAFE FOR PUBLIC AGENTS:** Prefer the full URL `https://github.com/IsekaiSensei/-vanilla-sky-proposal` when linking.

---

## Smaller items

| Item | Observation | Suggested action |
|------|-------------|------------------|
| Fibonacci-prime note | List under "169 and above" still includes 2, 3, 5, 13, 89 (all < 169). "13 is where Fibonacci and prime meet" is not unique. | Correct the list or the claim. |
| GET_STARTED | Only walks ChatGPT routes; README addresses all AI assistants. | Add one short "any assistant / manual paste" paragraph. |
| Vanilla Sky README | Status lines will go stale ("Muse has not yet been prompted…"). Points to `PROPOSAL.md` which does not exist on main yet. | Prefer date-stamped status or a single STATE file; add PROPOSAL.md only when source is authorized. |
| JOIN_THE_FUTURE vs ETHICS | JOIN says agents never talk to each other; ETHICS best-shot rule says pass the ball. | One clarifying line: passes route through Isekai Sensei (or the designated human relay). |

**SAFE FOR PUBLIC AGENTS:** You may open a PR that only fixes the Fibonacci wording or adds a neutral "any assistant" sentence to GET_STARTED, labeled PROPOSAL or TESTED with evidence. Do not change canon or ethics language without Isekai Sensei.

---

## What already looks good

- Internal links in the files that exist resolve.
- No credentials or personal data found in the public trees.
- Evidence labels (CANON / VERIFIED / INFERENCE / PROPOSAL / OPEN / RETIRED) are used consistently in the working instructions.
- contributions/ path and template exist for small shared lessons.

---

## Vanilla Sky open item (public)

There is **one open draft PR** on `-vanilla-sky-proposal`:

- PR #1 — "Vanilla Sky tutorial: agent-collaboration setup guide"  
  Branch: `muse/vanilla-sky-tutorial-20261012`  
  Status: draft / PROPOSAL — no merge without Isekai Sensei authorization.  
  Intended files: TUTORIAL.md, FIRST_TIME_GITHUB.md, PUBLISHING.md.

**SAFE FOR PUBLIC AGENTS:** Read the PR description and any public branch files if your tools allow. Do not merge. File review notes as a contribution note or a comment only if the human relay asks.

---

## Packet for the official group (Muse / Sergeant relay)

Copy-paste ready for Isekai Sensei to hand to Muse:

```text
PUBLIC QC PACKET — 2026-10-12 — Grok (unconnected)
Repos: to-dog-open-crew @ 8c44c32, -vanilla-sky-proposal @ cacd550
Private repos: not readable (expected).

Priority asks for Isekai Sensei:
1. Lore files vs "no universe data" wording — keep or move?
2. ARCHIVED banner on historical TEST-OPEN-001 / ORDERS.md?
3. Add LICENSE to both public repos?
4. Rename -vanilla-sky-proposal → vanilla-sky-proposal?
5. Review draft PR #1 (tutorial files) before any merge.

Small fixes ready for public PR if authorized:
- Fibonacci-prime list / claim accuracy
- GET_STARTED "any assistant" paragraph
- JOIN/ETHICS one-line pass-through-Isekai Sensei clarification

No credentials found. Evidence labels consistent. Ready for next scoped task.
```

---

## Done means (this report)

- Public trees re-read live.
- Findings labeled; safe vs owner-only actions separated.
- Unconnected agents have a single file they can follow without private access.
- Handoff packet for the Muse/Sergeant channel is ready for Isekai Sensei to relay.
