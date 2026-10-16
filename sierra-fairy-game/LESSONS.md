# Start from zero, build one thing at a time

You do not need to learn two engines at once. Use Godot first. Watch a section, pause, try it, then make a small change without copying. A 50-minute session with a break is a useful stopping point, not a requirement.

**First morning:** download/extract the handoff, import the workshop, watch lesson 01, and make a separate practice character walk and jump. Stop there if that is enough for the day.

Video metadata and creator/source pages were checked on October 16, 2026 UTC. These are links, not downloaded videos; no full-video viewing or code-compatibility test is claimed. YouTube needs internet. The local guides and supplied source projects remain readable offline.

| Order | YouTube lesson | Small result |
| --- | --- | --- |
| 01 | [How to make a Video Game - Godot Beginner Tutorial](https://www.youtube.com/watch?v=LOhfqjmasi0) — Brackeys | Make a separate practice project. Learn the editor, nodes, scenes, movement, collision, animation, camera and UI. Change one thing yourself. |
| 02 | [How to program in Godot - GDScript Tutorial](https://www.youtube.com/watch?v=e1zJS31tr88) — Brackeys | Practice variables, if statements, functions, arrays, dictionaries and signals. Make a counter change when an item is collected. |
| 03 | [TileMapLayer Basics in 4.3](https://www.youtube.com/watch?v=vEyDbROrw0Q) — ThinkWithGames | Paint a tiny floor and cave with collision. Use TileMapLayer in current Godot; older TileMap calls need adapting. |
| 04 | [Crash Course ~ How to Make a Resource Gathering Game in Godot 4!](https://www.youtube.com/watch?v=nQluyQ-1wSI) — Chris’ Tutorials | Learn tools, hit interactions and pickups. Adapt the top-down example to side-view targeting; it is not a Terraria clone. |
| 05 | [How to Create a INVENTORY in Godot 4 (step by step)](https://www.youtube.com/watch?v=X3J0fSodKgs) — DevWorm | Add item data, quantities, slots and a hotbar. First store and display one material. Keep data separate from the UI. |
| 06 | [Saving and loading games with Godot](https://www.youtube.com/watch?v=43BZsLZheA4) — Godotneers | Save the seed, player position, inventory and changed tiles. Close the game, reopen it and verify all four survive. |
| U1 | [How to make a 2D Game in Unity](https://www.youtube.com/watch?v=on9nwbZngyw) — Brackeys | An older Unity introduction for concepts. Follow the current official Unity Essentials course for present menus and setup. |
| Q1 | [Godot XR developer channel](https://www.youtube.com/@BastiaanOlij) — Bastiaan Olij | A creator channel, not a single pinned lesson. Use the official Quest setup guide for the exact engine version. |

## The next systems, in a useful order

| Step | Build / learn | Current primary reference | A useful check |
| --- | --- | --- | --- |
| 1 | Import your own PNG, set filtering and animation | [2D animation](https://docs.godotengine.org/en/stable/tutorials/2d/2d_sprite_animation.html) | Two frames play; art is sharp at the intended scale |
| 2 | Layered depth | [Parallax2D](https://docs.godotengine.org/en/stable/tutorials/2d/2d_parallax.html) | Distant background moves more slowly than foreground |
| 3 | Mine and place tiles | [TileMapLayer API](https://docs.godotengine.org/en/stable/classes/class_tilemaplayer.html) | One click removes one reachable tile, awards one item; placing consumes one item |
| 4 | Hotbar and menus | [Control nodes](https://docs.godotengine.org/en/stable/tutorials/ui/index.html) | Mouse and controller can select the same slot |
| 5 | Simple crafting | [Resources](https://docs.godotengine.org/en/stable/tutorials/scripting/resources.html) | Ingredients are checked before all are consumed; one output appears |
| 6 | Save changed terrain | [Saving games](https://docs.godotengine.org/en/stable/tutorials/io/saving_games.html) | Mined/placed cells and inventory survive restart |
| 7 | Small seeded cave; chunks later | [FastNoiseLite](https://docs.godotengine.org/en/stable/classes/class_fastnoiselite.html) | The same seed recreates the same untouched terrain |
| 8 | One creature or hazard; fair feedback | [First 2D game](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html) | Damage has visible and audible feedback, with no color-only warning |
| 9 | Export a desktop test | [Exporting projects](https://docs.godotengine.org/en/stable/tutorials/export/exporting_projects.html) | Export opens on the intended computer without the editor |
| 10 | Quest route | [MetaQuest/README.md](MetaQuest/README.md) | Record headset, engine, inputs and actual result |

Prefer current **TileMapLayer** and **Parallax2D**. Tutorials recorded on older Godot versions may show TileMap or ParallaxBackground/ParallaxLayer; learn the concept, then use the linked current API. GDScript examples do not become C# by changing the filename.

Unity later: [Unity Essentials](https://learn.unity.com/pathway/unity-essentials), [2D learning](https://learn.unity.com/), and [Unity project instructions](Unity/README.md). Keep this as one set of reusable assets with separate engine adapters.
