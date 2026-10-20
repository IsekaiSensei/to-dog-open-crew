# GERTECH / TO WORLD — Platonic Escape Room 001 (VRChat)

**Status: PUBLIC SOURCE CODE — EXPERIMENTAL. No Unity compilation, VRChat build, headset QA, or world upload has been performed.**

This is an **importable source overlay** for a VRChat Creator Companion **Worlds/UdonSharp** Unity project, **not** a standalone Unity project or a playable world URL. The protected Godot `TO DOG` game is unchanged.

## Creative brief
Five explorable Platonic-solid chambers, interconnected with deliberately unpredictable opaque teleport portals. You cannot tell how many doors the next room contains. Architecture tilts; **the player's head/camera and world gravity are not forcibly rolled**. Visitors may wander, use optional floating locomotion, watch slow-moving sculptures, or use a HOME reset at any time. No timer or mandatory puzzle. A casual sightseeing visitor is the primary user.

| Room | Actual faces | Portal markers |
|---|---:|---:|
| Tetrahedron | 4 | 2 |
| Cube — starting hub | 6 | 4 |
| Octahedron | 8 | 6 |
| Dodecahedron | 12 | 8 |
| Icosahedron | 20 | 10 |

Face selection is repeatable from an editor seed. Each portal gets 1–3 candidate destination rooms, chosen locally for each traveler at entry. **These are teleports, not see-through/mirror camera portals.** All five shells are generated as static meshes by an editor tool, not at VRChat runtime.

## Build / install on a Windows machine
1. Install VRChat Creator Companion (VCC) and create a new **Worlds** project with UdonSharp. Use the Unity editor version recommended/installed by the current VCC; the official supported version on 2026-10-19 documentation is **2022.3.22f1**. Enable Android Build Support for Quest.
2. Copy this folder's `Assets/GERTECH` **into the new Unity project** at `Assets/GERTECH`, preserving `Runtime` and `Editor`. This repo does not bundle the VRChat SDK or Unity itself; acquire both from the official VCC.
3. Open the project with Unity. Resolve compiler errors if any and review the Console. Then choose **Tools > GERTECH > Generate Platonic Escape Prototype 001**. This opens a **new scene**, constructs geometry/materials/portals, and saves `Assets/GERTECH/Generated/Platonic_Escape_001.unity`.
4. Open **VRChat SDK > Show Control Panel > Builder**. Add exactly one **VRCSceneDescriptor**. Set its spawn to the generated **`Arrival_Safe` at x=36** for **`1_CUBE`** (second arrival in the hierarchy), not the default world origin. Check spawn and collision clearance.
5. Inspect portal and button reachability, render orientations, mesh colliders, and safety/reset affordances. The buttons are named `FLOAT / NORMAL` and `HOME / RESET` (the names are GameObject names, not automatically visible text labels). Tune placement in Unity as required.
6. Under the SDK's Build panel run **Build & Test Your World** on desktop first. Then switch to the Android/Quest platform and test again in an actual headset; adjust performance, materials, locomotion, colliders, and build issues as necessary.
7. Once **all tests pass**, in the authenticated SDK Builder select **Build & Publish Your World Online**. The uploader needs an eligible VRChat.com account (trust rank New User or higher). Choose a **private/unlisted** staging release first, if the available visibility choices support it. Record the VRChat world ID and permalink in the tracking issue **only after actually uploading**. Public release requires project owner approval.

## Interactions
- **Blue disk**: enter trigger sphere or interact to teleport to a locally chosen destination.
- **Teal sphere**: interact to toggle optional low-gravity floating; Jump rises, Drop descends. Platform controller bindings differ; validate on Quest.
- **Gold sphere**: interact to return to the tetrahedron hub arrival and restore normal gravity. **Known caveat:** the actual starting spawn is the cube, but this HOME button targets room 0 (tetrahedron) in this code. Fix this during scene QA if HOME should return to the cube.
- Rotating sculpture: decorative only; never rotates players.
- Non-color-only cues: basic portal glyphs and readable signs are intended. **Validate actual readability and accessibility during QA; these are not yet verified.**

## Mandatory QA before any VRChat world is described as playable
- [ ] C# editor/runtime compilation in VCC Unity project
- [ ] All five Platonic meshes: faces, normals, colliders, walkable pads
- [ ] Exactly one world descriptor, CUBE spawn actually safe
- [ ] Trigger-and-Interact portal works; repeat visits demonstrate local routing
- [ ] FLOAT controls validated separately in desktop and Quest
- [ ] HOME reset restores gravity and cannot trap visitors
- [ ] Two-player test: teleporting one does not teleport the other
- [ ] No accidental headset roll; comfort and accessibility check
- [ ] Quest draw calls/materials/performance inspected
- [ ] Successful online staging upload plus tested world URL
- [ ] Owner review and approval for wider publication

## Preservation and roles
- This is an **experimental VRChat branch**, not a change to the existing Godot simulation or canonical TO WORLD architecture.
- Idea / setting: GERTECH / TO WORLD — **Isekai Sensei**. Prototype scripts and generator: ChatGPT. The Unity/VRChat QA and live publishing are not completed.
- **Silver Shadow** is a potential voluntary player-feedback source, **not a production or QA assignee**.
- Build/review can be coordinated with Work/XO and Grok/CO. No agent or collaborator is credited with an unverified build.
- Do not commit VRChat credentials, Unity licenses, tokens, third-party unauthorized assets, or other private project material.

## Official documentation
- https://creators.vrchat.com/getting-started/
- https://creators.vrchat.com/worlds/creating-your-first-world/
- https://creators.vrchat.com/worlds/udon/udonsharp/
- https://creators.vrchat.com/worlds/udon/udonsharp/editorscripting/
- https://creators.vrchat.com/platforms/android/quest-content-optimization/

Tracking / recruiting: https://github.com/IsekaiSensei/to-dog-open-crew/issues/12
