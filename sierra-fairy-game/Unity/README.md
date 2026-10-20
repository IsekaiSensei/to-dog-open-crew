# Unity package on the same card

<!-- MEDIA-HSBS-001 -->
## Standing media format — CANON, October 20, 2026

**Flat Half-Side-by-Side (HSBS), Cardboard-style.** Left-eye view left; right-eye view right; flat-screen presentation; playback restores each eye's original proportions. Same format for phone/Cardboard and Quest. All crew/fairies/agents carry this into stereoscopic image/video work. Only Isekai Sensei may explicitly change this canon. This supersedes conflicting older delivery instructions below; preserved historical sources and interactive applications retain their own scope. [Full standing order](../../MEDIA_FORMAT_CANON.md).
<!-- /MEDIA-HSBS-001 -->


Godot is Silver Shadow's first engine. This is a **native Unity project scaffold and reusable asset package**, with no claim of a completed Unity game or editor test.

1. Install Unity Hub and a compatible Unity 6 editor on the host. The scaffold records **6000.0.71f1**, an existing Unity 6.0 release verified on the official release page; it is a reproducible reference, not a claim to be the latest version. Use a copy if upgrading it.
2. Add Unity/SierraWorkshop in Hub. Let Unity import the project and its built-in modules.
3. Choose **Gertech → Create a fresh asset bench**. Save the new scene under Assets/Scenes. The helper asks to save any currently modified scene before switching.
4. Alternatively, import GertechSharedAssets.unitypackage into her existing Unity project. Inspect the import list so it does not overwrite her own files unintentionally. The same tree OBJ/MTL and JSON are included.

Keep `.meta` files with source; don't move `Library`, `Temp`, `obj` or host-specific caches between active editors. This project uses no purchased assets, external paid plugin or automatic account connection. No Unity executable/license, Android SDK, XR SDK, signing material or export is bundled.

Unity's Linux support is version/distro specific. SteamOS is not an automatically supported Ubuntu install. Carry the Unity source on the card even if the Latitude is the only editor host; verify actual editor compatibility before promising Deck authoring. [Unity system requirements](https://docs.unity3d.com/6000.0/Documentation/Manual/system-requirements.html), [reference release](https://unity.com/releases/editor/whats-new/6000.0.71f1), [Unity Essentials](https://learn.unity.com/pathway/unity-essentials).

Godot GDScript and native scenes require their own Unity implementation. JSON and model transfer do not prove identical gameplay, materials, input or performance. The GLB in Shared/Models is optional; use an appropriate glTF importer if chosen. OBJ is provided for the built-in model path.
