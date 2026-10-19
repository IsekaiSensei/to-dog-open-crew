# Garden drop — Meta modular graphics implementation proposal (source pending)

**Status:** PROPOSAL — PENDING SOURCE REVIEW · **INCOMPLETE INTAKE RELAY**  
**Version:** INTAKE-v0.1 (2026-10-19; **not** Meta's original file version)  
**Contributor / origin:** Meta agent, as relayed in the user's conversation  
**Relayed to GitHub by:** ChatGPT, working from the provided summary only  
**Parent project:** TO WORLD / GERTECH · **Target:** Psyche 16 Starforge and TO DOG  
**Authority:** Isekai Sensei retains final canon and publication approval.  
**Approval / verification:** NOT APPROVED · original HTML and promised Markdown NOT RECEIVED or inspected · no asset import, runtime execution, visual QA, or deployment test.

> **Intake integrity:** This document preserves what was *reported in the handoff*, **not** the complete implementation artifact, original asset table, or source-observation citations. The accompanying Meta HTML was shared through a temporary Facebook CDN address that could not be opened from this session; the stated `/mnt/data/...` location belongs to the originating environment, not this repository. **Replace this incomplete relay with the actual original Markdown and separately attach/archive the HTML only after obtaining those files.** Do not describe this as an exact source export.

## Situation

An external agent examined the public landing page and offered a proposed modular art and implementation specification. The creator clarified that the five Psyche 16 functions are **module types, not a mandatory checklist or universal verbs**. The proposal is intended to give a graphics team buildable instructions, not final graphics or a claim that a module assembler already operates.

The five names and general functions can be cross-referenced against the existing owner-approved [Concept Page 001](../../../CONCEPT_PAGE_001.md) (use [direct link](https://github.com/IsekaiSensei/to-dog-open-crew/blob/main/CONCEPT_PAGE_001.md)). The additional graphics details below are **Meta's reported design proposals**, not owner-approved additions to Concept Page 001.

## Reported proposal — faithful summary of the received handoff

### 1. Module type semantics

| Optional type | Reported proposed visual / implementation meaning |
| --- | --- |
| **Sucker** | Grip / salvage interface |
| **Thruster** | Propulsion |
| **Inhabitor** | Where something lives / pilots |
| **Frame** | Chassis / skeleton |
| **Power** | Heart / energy |

- There are **five types, combinable and optional**; a build does **not** need one of each. Examples in the handoff explicitly allow **Frame-only** and **all-Sucker** assemblies as valid **compositions**.
- Valid composition **does not prove the assembly can move, operate, balance its energy budget, attach physically, or pass gameplay validation**. Functional requirements must be assessed independently under the actual world's construction/physics rules.
- This is a **candidate clarification** for gameplay/asset validation, not evidence that every existing prototype already uses optional-module logic.

### 2. TO DOG attachment silhouette (reported; wireframe not received)

Meta reports a low scan silhouette with proposed attachment-point identifiers:

`SOCKET_A` · `SOCKET_B` · `CARRY` · `SALVAGE_ARM` · `SCAN`

These are **reported labels only**. The exact geometry, orientations, socket transforms, scale, rigging, and interaction semantics remain **UNVERIFIED** without the original wireframe. Do not invent placements from this list.

### 3. Asset matrix and technical limits (reported; table not received)

- Reported variants: **S / M / L**, described as **three per module type**. The 15 variant rows, meshes, per-row materials, attach points and animations are **not contained in the handoff**.
- Reported tri-count values: **200 / 600 / 1,500 triangles**, with trim-sheet guidance for **Godot / Unity / Meta Quest**. The handoff does **not** prove which number belongs to which mesh, variant, device tier or LOD; confirm using the source artifact.
- Animation states and socket rules are reported as present but **not transcribed**. No mesh, texture, trim sheet, or export was inspected or tested.

**Required follow-up:** obtain and preserve the **complete original 15-row asset table, animations, attach-point definitions, trim-sheet/export specifications, and performance acceptance tests**. These are **MISSING**, not silently inferred.

### 4. Proposed visual language and provenance

- Suggested material palette: **rusted metal / salvaged plastic / painted stone**.
- Reported Dovahcrab-inspired remembrance marks: **1–3 hand-placed dots, coins, or tally scratches per module**.
- Reported metadata keys: `found_by` and `found_location`, associated by Meta with Vanilla Sky-style evidence/provenance reporting.
- These specific per-module counts and fields are **proposed graphics specifications**, not independently verified canon; do not identify a remembrance marking as proof of actual historical ownership.

### 5. Guardrails — do not reintroduce the checklist error

1. Do **not** demand Frame + Power + Inhabitor or all five module types for every assembly merely because an earlier demo was written that way.
2. Do **not** turn the five **types** into required verbs, mandatory parts or a complete description of every world object.
3. Do **not** confuse an assembly's allowed composition with proven functionality or game integration.
4. Do **not** replace verified source art / original author provenance with synthesized assumptions.
5. Do **not** claim the reported HTML was opened, tested, published, rendered, or merged into canon here.

**Compatibility note:** Historical Starforge prototypes may enforce stricter demo-specific connectivity and required-part checks. Preserve those historical versions. Any change to such validators is a **separate scoped engineering review**, not an automatic correction from this Garden Page.

## Tried and observed

- **Observed from the relay:** Meta states it assembled an interactive HTML spec and a versioned Markdown Garden proposal; both the designer's claims and its access-blocked GitHub warning were passed along.
- **This intake actually did:** transcribe the summary, separate reported specifications from public source, and identify missing files/uncertainties.
- **Not verified:** actual Meta HTML contents, full Markdown Page, claimed line citations, exact 15-row matrix, wireframe, assets, runtime performance, Unity/Godot/Quest compatibility.
- **Source access limitation as reported by Meta:** `LIVE_CRAWL_POLICY_BLOCKED` for GitHub links. The relay's statements about public-site observations were not reproduced with their original citations.

## Sources and attribution

1. Meta-originated handoff summary supplied in the conversation dated **2026-10-19**. **Primary source for this intake's proposed specs**, but only a partial summary of the missing original artifact.
2. [Public Concept Page 001](../../../CONCEPT_PAGE_001.md) — independently available GitHub source for five module **types** and their broad functional meanings; **does not** establish the Meta asset table or tests.
3. [Sensei Glossary](../../../SENSEI_GLOSSARY.md) · [Garden rules](../../README.md) — contribution/status vocabulary, review and privacy boundaries.
4. [Vanilla Sky proposal](https://github.com/IsekaiSensei/vanilla-sky-proposal) — relevant public conceptual context; **does not** verify the proposed metadata schema's implementation.

No original Meta source file, full transcript, line-numbered citation table, original diagram, or hash is included here. Preserve each separately on receipt.

## Open questions / review gate

- [ ] **Receive the original Markdown** exactly as Meta exported it, including source quotations/citations.
- [ ] **Receive and inspect the HTML** implementation artifact; store a reviewable version without transient Facebook signature parameters or hidden/private data.
- [ ] Cross-check every proposed function, variant and wording against public source READMEs and Concept Page 001; label any conflicts as proposals.
- [ ] Review the reported 15-row asset table, trim sheets, polygon budgets and animation state names.
- [ ] Assess how optional assembly validity relates to older prototype-specific mandatory-part validation.
- [ ] Confirm licensing, third-party art rights and any personal-data traces before publication.
- [ ] Record owner decision, version, actual engine tests and final source links **before** any canon promotion or technical implementation order.

**Intake outcome:** a traceable **Garden-only relay awaiting source**, not a finished Page/Scroll/Book, tested design, or approval to revise frozen gameplay code.
