# Reuse the asset, preserve its source

The crystal-metal tree is an existing procedural Godot prop by Muse, recovered from its source branch. The `.tscn` is unchanged. OBJ/MTL and GLB are conversions of that geometry, made for transfer. The source remains a prototype; exact runtime/import checks are listed in STATE.md.

| Format | Use |
| --- | --- |
| `.tscn` | Drop into Godot and instance it; source primitives/materials remain editable |
| `.glb` | Godot/Blender and a Unity project with a compatible glTF importer |
| `.obj` + `.mtl` | Basic mesh exchange, including Unity's built-in model import. Keep both files together; check material appearance and scale |
| PNG/WebP/JPG | Still pictures/reference or textures; not automatically a sprite sheet, rig or animated actor |
| WAV/OGG | Audio source when actually provided and permitted; this handoff contains no production soundtrack |

For her own 2D art, keep each tile/frame the same grid size, use transparent PNG when needed, set the intended filter, define the TileSet atlas and collisions, and make animation names explicit. Keep editable originals. For 3D, verify pivot, scale, normals, material, bounds and collision; the tree's hidden Proxy is a visual box, not a physics collision shape.

Do not extract someone else's likeness from a concept sheet and call it Sierra. She supplies her own fairy design. Keep each creator separate from the character depicted. An AI label such as 'canon' or 'free to remix' does not prove owner approval or third-party rights.

The larger private art intake stays outside this public package. It contains references needing individual review, not a library of automatically cleared shipping assets. Add approved original files with creator, source, status, rights and a checksum. Use ASSET_MANIFEST.json as the model.
