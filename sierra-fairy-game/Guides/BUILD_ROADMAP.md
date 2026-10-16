# A small Terraria-style game, in Sierra's order

For the first version, use **side-view 2D rules with layered art for depth**. This is a practical 2.5D starting route, not a restriction on her final presentation. The included orthographic 3D bench provides a second route for actual 3D props; she can keep movement on a plane when she chooses.

## First playable room

1. One controllable fairy/proxy: left/right, jump or chosen flight, collision, camera and restart.
2. A small painted terrain patch with a foreground solid layer and a separate background layer.
3. Inspect a cell before changing it. Target only the foreground, convert the pointer to cell coordinates, check reach and solid state.
4. Mine exactly one cell and give exactly one item. Held input repeats only at a controlled cadence.
5. Select a hotbar item; place only in an empty reachable cell. Reject placement overlapping the player, then consume one item after success.
6. Show inventory counts. Craft one practice recipe with an all-ingredients check before changing any counts.
7. Save seed, changed cells, player state and inventory. Reopen; verify the same result.

**Godot vocabulary:** CharacterBody2D, CollisionShape2D, AnimatedSprite2D, Camera2D, TileMapLayer, TileSet custom data, Control, Resources, signals and FileAccess. Use `local_to_map(to_local(global_pointer))` for world-to-tile targeting on a transformed TileMapLayer. Use `get_cell_source_id`, `erase_cell`, `set_cell`; update connected terrains when needed. Follow the current API's argument order.

**3D route:** CharacterBody3D and an orthographic Camera3D; choose the permitted movement plane, constrain depth, use 3D collisions consistently and raycast for the target. A 3D model cannot collide through a 2D physics node automatically.

## Grow after the room works

Seeded terrain → cave pockets → loading/unloading chunks → one resource loop → one useful crafted tool → one new region → one creature/hazard → repeatable saves. Keep inventory data separate from its UI; keep terrain data separate from renderer nodes. Start with small bounded terrain instead of generating a world every frame.

## Content she will make

Her fairy/avatar reference; idle/move/air/interact animations; terrain atlas; background layers; tool/item icons; pick-up/hit/step/UI sound; material definitions; recipes; enemies; biomes; progression and dialogue. Start with one item from each category. Reuse the supplied actual tree or geometry as a prop, render reference or study.

Keyboard/mouse and controller should reach the same actions. Choose bindings in lowercase named actions; show text and shape with color. For a handheld, readable text, controller focus and a pause menu matter. For Quest, screen-space testing, stereo VR, hand tracking and Touch controls are separate features with separate tests.

Sierra owns the creative work. This roadmap is a set of small construction tasks and checks; it does not pre-author her finished game.
