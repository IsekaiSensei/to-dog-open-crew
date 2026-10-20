# Spark: First Path — standalone Godot 4 mini-game

<!-- MEDIA-HSBS-001 -->
## Standing media format — CANON, October 20, 2026

**Flat Half-Side-by-Side (HSBS), Cardboard-style.** Left-eye view left; right-eye view right; flat-screen presentation; playback restores each eye's original proportions. Same format for phone/Cardboard and Quest. All crew/fairies/agents carry this into stereoscopic image/video work. Only Isekai Sensei may explicitly change this canon. This supersedes conflicting older delivery instructions below; preserved historical sources and interactive applications retain their own scope. [Full standing order](../../../../MEDIA_FORMAT_CANON.md).
<!-- /MEDIA-HSBS-001 -->


**Status:** CODE GENERATED / NOT RUN-VERIFIED / NOT PLAYED. Godot runtime was unavailable in the authoring environment.

## Launch
Open `project.godot` with Godot 4.x and press F6 or F5 (F5 runs main scene). No external textures, addons or network required.

## Loop
Collect 8 luminous gems, avoid the drifting shards, then return to the center Nexus ring. Lose all 3 hearts and you lose. Restart from menu or R.

## Controls
WASD or arrows move; Space speeds movement; P pauses; R restarts; Enter starts from menu. Keyboard-first prototype. Controller and Steam Deck NOT VERIFIED.

## Scope
An isolated proof-of-play using geometry-first / living-jewelry-inspired procedural 2D visuals. Not a replacement for existing Godot PR #26, Muse Loft, frozen Rev1 or approved character assets. No generated player-character likenesses. Existing visual-art and video HOLDs remain.

## Acceptance test
1. Godot imports project and launches menu without errors.
2. Start; collect one gem and verify count changes.
3. Contact enemy, lose a heart; immunity flickers.
4. Collect 8, enter central ring, see victory.
5. Lose all hearts, see failure; R restarts.
6. P pauses/unpauses; confirm controls.
7. Record Godot version, OS, launch logs, actual input and outcomes before calling PLAYED.
