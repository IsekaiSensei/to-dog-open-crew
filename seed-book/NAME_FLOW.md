# OLD ROOTS — a name change is an owner decision
**Status:** PUBLIC REVIEW • 2026-10-17 • NO AUTOMATIC RENAME

~~~mermaid
flowchart TD
  A[Agent enters TO WORLD public Hub] --> B[Find source and read original name]
  B --> C{Does this source already have a name?}
  C -->|Yes| D[Preserve exact old name and provenance]
  C -->|No| E[Create PROPOSED Seed ID, not a canon name]
  D --> F{Renaming, merging, or uprooting requested?}
  F -->|No| G[Keep source name; add categories and portable artifacts]
  F -->|Yes| H[Flag OLD ROOTS; show Sensei an alias or branch proposal]
  H --> I{Ryan decision?}
  I -->|APPROVE| J[Add alias/new branch; retain old root and redirect]
  I -->|REJECT| K[Keep old name; note decision]
  I -->|OPEN| L[Hold renaming only; other artifact work continues]
  E --> G
  G --> M[Publish only cleared catalog and derived assets]
  J --> M
  K --> M
  L --> M
  M --> N[Another agent verifies public read and actual artifact]
~~~

## Every hub visitor gets a name decision card
| Field | Fill from evidence, not inference |
| --- | --- |
| SOURCE NAME (exact spelling) |  |
| SOURCE location, date, hash |  |
| OLD ROOTS | YES / NO / UNKNOWN |
| Classification | project, world, build, model, room, actor, path, map |
| Proposed *additional* alias |  |
| Impact on old URLs / save names |  |
| Distinct identities at risk |  |
| Is actual repository setting changed? | NO unless verified |
| Is it publishable / licensed? | OWNER-CLEARED / HOLD / UNKNOWN |
| Ryan decision | OPEN / APPROVED / REJECTED |
| Implementer / evidence | real agent + readback + artifact path |

**OLD ROOTS examples:** to-dog-open-crew is the old public repo slug; **to-world** is a requested settings rename not yet verified. TO DOG remains a game branch but no longer names the entire TO WORLD parent. Original Minecraft save names cannot be substituted with new nicknames. Cody and Code are separate pending visual/source verification.

**Semantic rule:** A flowchart shows options, an information tree classifies, a Git path locates, a registry ID refers, and a name is an observed source label. None silently rewrites any other.

**When another agent has private repo 404:** that is ACCESS BLOCKED, not "no orders." The public mirror intentionally excludes protected source Books and active private orders.