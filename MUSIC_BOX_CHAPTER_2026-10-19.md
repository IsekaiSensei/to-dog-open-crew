# GERTECH — THE MUSIC BOX
## New chapter: Art, Sound, Motion & Narrative

**TO WORLD / GERTECH · Public Page · 2026-10-19**  
**Status: WORKING CHAPTER / PROPOSAL — not locked canon, not an implemented feature.**  
**Origin:** Isekai Sensei's October 19, 2026 creative direction, developed in conversation with ChatGPT. This public Page is a reviewed-for-publication draft, not a claim that every design decision has been approved as final.  
**Hierarchy:** TO WORLD is the parent project; TO DOG is a playable game branch.  
**Prior work:** Preserve earlier Art Pages, source images, World Seeds, and Book versions; this chapter supplements rather than silently replacing them.

> **The physics is already there. The rendering is already there. The UI and input systems are already there. Connect them so what the engine does becomes what the player experiences in the story.**

### 1. Existing engine, narrative language
Do **not** reinvent Godot's physics, renderer, camera, UI, or input system. Keep technical node/class names in engineering documentation; use narrative labels in the player's experience.

| Godot concept | Player-facing interpretation |
| --- | --- |
| `Camera3D` | The Angel's eye / viewpoint |
| `Control` UI and input actions | Instruments, choices, world communication |
| Cursor / targeting / `RayCast3D` | Fairy reaches, inspects, selects |
| `MeshInstance3D` | Visible appearance |
| `CollisionShape3D` | Physical contact boundaries |
| `CharacterBody3D` | Directly moved actors such as DOG |
| `RigidBody3D` | Force-driven craft, objects and constructions |
| `StaticBody3D` | Terrain and fixed structures |
| `Joint3D` families | Physical constraints and articulations |

`PhysicsBody3D` is a base class; `MeshBody` is not a standard Godot 4 node. Camera, cursor, controlled body, and physics body may be different things. Switching control targets need not rewrite the world or its physics.

### 2. The fivefold geometric language
The five Platonic solids are **tetrahedron, cube, octahedron, dodecahedron, and icosahedron**. All **31 nonempty subsets** (5 singles + 10 pairs + 10 triples + 5 quadruples + 1 fivefold) are starting *combination classes*, not a complete count of spatial arrangements. Orientation, ordering, joints, nesting, and fractal recursion create further configurations.

**Origami code; vector lattices; machine-resolved detail.** Store geometry and connection rules as the underlying structural source, not a set of prepainted raster pictures. The machine selects the level of geometric detail appropriate to hardware, viewpoint, and purpose. Actual displays may still rasterize the final image.

The pictured **five-in-one form** is an established visual reference in the working conversation; do not reduce it to an arbitrary generic lattice. Precise geometry, topology, and reproducible fold rules remain to be documented and tested.

### 3. Spark fairy, robot and rocket parts
**The fairy is a light pilot.** A tiny luminous pilot can operate a constructed body or vessel. A flying, fairy-shaped silhouette may be a robot/rocket assembly rather than a biological miniature woman.

The proposed vessel uses fivefold structures, robot articulation, rocket propulsion, and a gummy/translucent shell. The spark carries pilot identity; the assembled vehicle carries mechanical capabilities. How autonomy behaves after the pilot leaves a machine remains an **open design question**.

### 4. Crystal, metal and gummy material language
- **Crystal:** reveals facets, light paths, and interior structure.
- **Metal:** frames, hinges, edges, joints, and engineered connections.
- **Gummy translucence:** softened silhouettes, readable shells, and luminous forms.

These are visual/material expressions of a shared structural grammar. A render is a visual target, not proof of working construction or flight physics. The user's visual world is not automatically every creator's mandatory aesthetic.

### 5. Player control and point of view
Compare control patterns from **Dreams** (Imp cursor), **Tears of the Kingdom** (object manipulation), **Kerbal Space Program** (assembled craft physics), **Minecraft** (character and crosshair), and **Space Engineers** (actor and vehicle control). These are comparative inspirations, not claims of feature parity.

**Candidate modes to test, not completed features:** spark/cursor; builder/fold; pilot/ship; walk/DOG; observer/camera. Preserve the distinction between input, targeting, camera viewpoint, collision body, and physics simulation. A small test can prove that a light pilot selects a part, assembles a thruster, transfers control into the resulting craft, and changes POV without replacing the underlying world.

### 6. The Music Box: sound drives presentation
A beat can time a fold; a sung word can illuminate a geometric relationship; a phrase can accompany a camera move, transformation, or control transfer. This is a proposed *visual/music production grammar*, not yet a working runtime audio-reactive system.

**GERTECH Music Video Line:** combine existing gameplay, portraits, procedural renders, and cinematic clips into music-led vertical videos. Evaluate word-synchronized lyric captions, beat-aligned cuts, and platform music overlays on TikTok/Instagram. Confirm actual tool availability, synchronization quality, and publication/music rights for each release; do not assume music offered for personal posts is cleared for commercial promotion.

### 7. Songs enter slowly as Pages
The soundtrack archive is **not** a bulk list to flatten into canon. Each song or fragment arrives as its own Page, with source, title, original grouping, historical/cultural context, associations, creator explanation, and uncertainty labels. Distinguish observed evidence from assistant interpretation. Preserve originals and provenance. Connected Pages may form Scrolls; Books require review and approval. Avoid republishing unlicensed lyrics.

### 8. Rule of the Music Box
> **Preserve the source. Understand the mechanism. Give it meaning. Let the machine perform. Let the story unfold.**

**Evidence / limitations:** The working TO DOG prototype and the public Psyche 16 Page are separate existing artifacts. The fivefold recursive generator, fairy piloting, machine-resolved detail, and word-driven geometric transformations described here are design targets unless independently implemented and tested. Publication of this Page proves only the document was committed, not website deployment, search indexing, external-agent receipt, or runtime functionality.

**Related public references:** [World Book](WORLD_BOOK.md) · [Concept Page 001](CONCEPT_PAGE_001.md) · [Glossary: Bowl / Page / Scroll / Book](SENSEI_GLOSSARY.md) · [Public index](LINKS.md)

**Public attribution:** Isekai Sensei (creative direction); ChatGPT (drafting/structuring). No private identity or unpublished song archive is included.
