# TO WORLD — Maximum-Fidelity Graphics Direction

**Status: CANON — ART DIRECTION / PRODUCTION REQUIREMENTS, NOT AN IMPLEMENTATION CLAIM**  
**Approved by:** Isekai Sensei, 19 October 2026  
**Scope:** TO WORLD visual identity and its TO DOG game branch, with device-specific execution.  
**Source:** Isekai Sensei's explicit canon approval following the October 19 graphics-upgrade discussion; interpretation and production framing drafted by ChatGPT.

> **The geometry is the foundation, not the visual ceiling.** The world should be breathtaking, physically intelligible, and buildable. A player should be able to admire a machine, inspect its parts, take it apart, and build something even more extraordinary.

## 1. Visual identity

**Crystalline Industrial Fantasy** is the agreed high-fidelity direction: precision engineering, articulated machines, recovered materials, luminous crystal technology, translucent/gummy shells, and tiny light pilots. Blue, violet, and gold provide a familiar identity, with shape and sound redundant to color. These are design principles, not proof of game assets or finished rendering.

The five Platonic solids and original World Seed are structural grammar. Their functional geometry and provenance survive any change in appearance. A cube remains a cube when detailed with bevels, joints, textures, glass and cinematic light.

**TRON-like wireframe is a purposeful diagnostic presentation**, such as SNIFF/X-ray inspection, not the default look of the finished world.

## 2. Fidelity targets

| From | Toward |
| --- | --- |
| Simple polygons and cubes | Intricate articulated mechanical assemblies |
| Constant glowing outlines | Crystal facets, physical metal edges, sockets and internal light |
| Flat untextured surfaces | PBR surfaces: scratches, wear, metal, glass and translucent shells |
| Basic light | Intentional shadows, reflections, ambient atmosphere and cinematic grading |
| Static shapes | Mechanical folding, visibly connected parts and comprehensible motion |
| Fairy represented only as a glowing point | Distinct spark/light pilot operating a beautifully engineered constructed vessel |
| Empty test rooms | Detailed and believable salvage workshops, fungal environments and other buildable spaces |

Visual detail should express actual structure and purpose rather than conceal it. Crystals reveal light paths and internal structures; metal reveals hinges, frames and mechanical relationships; translucency reveals or softens meaningful silhouettes.

## 3. First quality benchmark — one room, one object, one fairy

Upgrade a **separate development copy/branch** of the already playable TO DOG fuse-repair room as the visual benchmark:

- DOG crosses a believable scratched workshop floor among salvage and mechanical components.
- Its chassis has recognizable construction elements, rather than a single undifferentiated object.
- The repair box, fuse and door retain their **existing gameplay logic** and relationships.
- A small luminous fairy and optional constructed vessel demonstrate the material language, without asserting that piloting or flight mechanics already work.
- SNIFF reveals the underlying geometry as a momentary diagnostic overlay.
- Complete the room's lighting, materials, readability and performance before multiplying unfinished assets.

Do not overwrite or silently change the frozen baseline, immutable seed, original assets or source record. Do not turn the visual milestone into a rewritten game.

## 4. Existing engine, maximum appropriate presentation

Use **Godot's existing renderer, physics, UI, camera, input and scene systems**, not a parallel engine. Target Godot 4 Forward+ for the relevant desktop/Steam Deck branch; select actual available features and test them rather than assuming every effect is supported on every platform.

Candidate production techniques include: PBR material maps, carefully controlled transparency and emission, physical bevels, modular mechanical detail, shadows, reflections, global illumination where supported and performant, exposure/color grading, calibrated bloom, mesh LOD, visibility ranges, and procedural detail rules.

Be accurate about measured results. No claimed frame rates, automatic hardware adaptation, or device support without a test.

## 5. One world, hardware-appropriate detail

The **same seed, object identity, structure and physical rules** should remain legible across capable devices, even when their display fidelity differs.

| Quality goal | Intended environment |
| --- | --- |
| Cinematic | Offline/highest-quality render and showcase, not necessarily playable in real time |
| Ultra | Capable desktop real-time graphics |
| Performance | Steam Deck, tested for sustained playable performance |
| Lightweight | Older or lower-powered systems, simpler mesh/material/light presentation |
| VR | Independent Quest-specific optimized asset and runtime path, subject to headset tests |

The system may choose LOD, shadow quality, reflections and post-processing based on the running hardware, but such automatic selection is a **target** until implemented. LOD changes must not silently rewrite construction, interaction, saved state or physics.

## 6. Scope and accessibility

- **TO WORLD** is the parent; **TO DOG** is a playable branch. Maintain the distinction.
- The separate **TO FAIRY / Quest 2** task is asset-first in its own working WebXR scope. This canon graphics direction does **not** authorize replacing its runtime with Godot or equate art with a headset-tested `.glb`.
- Shapes, readable silhouettes, contrast and distinctive audio cues carry meaning; never depend on red-only cues.
- Avoid rapidly flashing effects and bloom that washes out interfaces or obscures vision, especially in VR.
- Respect the original seed, physics, fabrication/buildability constraints, agency/provenance and crew-return rules.

## 7. Acceptance criteria and evidence

A **canonical target** is not automatically an implemented feature. A successful benchmark should provide source/asset references, tested engine version and target hardware, screenshots or capture, performance measurements, known limitations, and a reproducible build/test procedure. Promote actual build results to **VERIFIED** only after execution and review.

Do not declare a new procedural geometry generator, finished ultra graphics, fairy flight controls, cross-device synchronization or Quest headset functionality just because this direction has been canonized.

**Relationship to prior Pages:** This canon approval locks the overall graphics direction described here. Earlier [Music Box working chapter](MUSIC_BOX_CHAPTER_2026-10-19.md), [Graphics/VR hub](HUB_VR_GRAPHICS_START_HERE.md), incomplete Meta source bundles and separate mechanics remain at their recorded proposal/test statuses where not explicitly approved. No earlier evidence or provenance is overwritten.

**Authority:** Isekai Sensei has final approval. Grok coordinates; Work/XO handles implementation review when tasked; ChatGPT records and relays. Publication alone does not mean independent agents have received or executed an order.
