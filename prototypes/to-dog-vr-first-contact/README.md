# TO DOG — VR First Contact (Godot 4.7.2)

**Status: ENGINEERING PROTOTYPE — NOT QUEST-TESTED.** Owner approval: October 19, 2026. No changes to frozen `to-dog` baseline. Public character labels only.

## What is supplied

A minimal standalone Godot 4.7 project, procedural placeholder DOG at roughly 40 cm from floor to ear, a 10 cm-scale four-wing faceted Silver Shadow vessel floating nearby, salvage fuse tray, repair socket, two-step repair state, procedurally generated quiet sound cue, tracked XR camera and controller lasers, plus desktop fallback. Uses Godot's stock nodes; no external assets, dependencies, account secrets or unverified ZIP download pages. This is **an opaque VR demo**, not Quest passthrough/MR. The illustrations are references, not 3D meshes.

## Open on Steam Deck or computer

1. Extract this folder. In **Godot 4.7.2**, Import/Open `project.godot` (Compatibility renderer).
2. Press **F5**. When OpenXR isn't running it should fall back to a normal desktop window.
3. Use **F** to collect the fuse, then **F** again to install; alternatively click the fuse in the tray and then the glowing socket on DOG's chest. Use **X** to hide/show the fairy and **Esc** to exit.
4. Read `QA_CHECKLIST.md` and log observed results. This is intentionally separate from the playable fuse-door logic and does not overwrite any World Seed.

## Export to Meta Quest (must be done on a machine with Android tooling/headset access)

1. Install Godot's **matching Android export templates**, OpenJDK 17, and the Android SDK; set editor paths. See [official Android XR deployment guide](https://docs.godotengine.org/en/4.7/tutorials/xr/deploying_to_android.html).
2. Enable Quest **Developer Mode** and connect by USB. In Godot Project > Export, add **Android**; set **XR Mode = OpenXR**. Choose the proper runtime loader / OpenXR Vendors plugin settings as documented for your version and headset. Set `Runnable` for one-click deployment. For vendor-specific settings / stores, follow the official plugin guide. Avoid claiming successful export until an APK is built.
3. Use **Compatibility** renderer (this project already does). Export/install the debug build. The scene initializes OpenXR when a runtime is present; no runtime means desktop preview.
4. In-headset, point either controller at the fuse on the low tray; use **trigger** to collect, then point at DOG's blue chest socket and trigger to repair. Current input uses Godot's auto-generated **default OpenXR action map** for initial testing; confirm button action names (`trigger` / `trigger_click`) on your Quest and create a proper project action map for production.
5. Confirm world scale, height, comfortable target visibility and controls. This scene deliberately makes the targets selectable by laser instead of requiring bending, leaning or touching the physical floor.

**Important:** The headset's native system/menu control is the reliable exit route; keyboard Esc is the desktop route. No AR passthrough, room scanning, collision with real furniture, multiplayer, full skeletal models or real-world autonomous devices are implied.

## What becomes real after hardware tests

1. Replace DOG/fairy primitives with approved optimized **actual 3D source meshes** (renders and dimension sheets are not rigs).
2. Replace the default action map with Quest-tested grip/trigger actions; test laser hover and accessibility.
3. Integrate scene as an **adjacent fork/room**, preserving original seed and event history.
4. Only with approved MR permission and correct vendor features, add an independent passthrough test.

## Source and provenance

Prepared from October 19 concept images provided in chat and the public project hub/Starforge Page; reference: `HUB_VR_GRAPHICS_START_HERE.md`, `MUSIC_BOX_CHAPTER_2026-10-19.md` and public `VR_PASSTHROUGH_SPARK_FAIRY.md`. No binary concept images are republished here. Descriptions and dimensions are approximate artistic targets. This prototype may need corrections after real Godot 4.7.2 runtime/editor/hardware validation.
