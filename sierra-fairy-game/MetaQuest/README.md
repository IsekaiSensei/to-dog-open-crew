# Meta / Quest pack

<!-- MEDIA-HSBS-001 -->
## Standing media format — CANON, October 20, 2026

**Flat Half-Side-by-Side (HSBS), Cardboard-style.** Left-eye view left; right-eye view right; flat-screen presentation; playback restores each eye's original proportions. Same format for phone/Cardboard and Quest. All crew/fairies/agents carry this into stereoscopic image/video work. Only Isekai Sensei may explicitly change this canon. This supersedes conflicting older delivery instructions below; preserved historical sources and interactive applications retain their own scope. [Full standing order](../../MEDIA_FORMAT_CANON.md).
<!-- /MEDIA-HSBS-001 -->


Start with the ordinary side-view game in Godot. **2.5D presentation does not require an immersive VR conversion.** This pack includes two separate Quest routes:

## Build on the headset

[Godot's official XR editor guide](https://docs.godotengine.org/en/stable/tutorials/editor/using_the_xr_editor.html) links the [Godot Meta Store app](https://www.meta.com/experiences/godot-game-engine/7713660705416473/). The current guide lists Quest 2/3/3S/Pro with Horizon OS v69+, early-access limits, and recommends a keyboard/mouse. It can edit and run non-XR 2D games as well as XR projects. It currently has no C#/Mono support; use the supplied GDScript project on this route. Confirm Sierra's exact headset/OS and store availability when installing.

Transfer the extracted Godot project to a writable local Quest folder by a supported USB/network method; grant the editor file access and import its project.godot. The shared SD card connects the Latitude and Deck; Quest is a separate transfer. The public README/YouTube lessons can be opened in Quest Browser.

## Export from a computer

Use [Godot Android export](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_android.html), then [Android XR deployment](https://docs.godotengine.org/en/stable/tutorials/xr/deploying_to_android.html). Install the matching export templates, OpenJDK/Android SDK specified by that version, enable a Gradle build when required and configure the Android preset. A plain 2D app and an immersive OpenXR app are separate targets. For immersive XR follow [XR setup](https://docs.godotengine.org/en/stable/tutorials/xr/setting_up_xr.html), add XROrigin3D/XRCamera3D and enable OpenXR; choose the compatible OpenXR Vendors plugin where needed. Godot 4.6+ makes that plugin optional but recommended for many cases; vendor features/store release can require it. Check the engine-version documentation rather than an old loader tutorial.

For Unity, use its Android build support and the compatible OpenXR/Meta packages for the actual editor/target. Install through Unity Hub on the host. This handoff supplies source/assets, not a verified Unity or Quest APK build, Meta SDK download, app ID, signing key or store submission.

## Keep the tests separate

1. Open/edit in headset editor; run the non-XR scene.
2. Verify real headset inputs and readable UI.
3. Only for an immersive build: verify stereo view, tracking, comfort and intended movement.
4. Record model, OS, engine, source version and observed result. A desktop screenshot is not a headset test.

[Bastiaan Olij's XR YouTube channel](https://www.youtube.com/@BastiaanOlij) provides implementation demonstrations; the official guides above govern current setup. The bounded [Meta art-relay brief](META_ART_RELAY.txt) can be pasted manually; no Meta agent connection is assumed.
