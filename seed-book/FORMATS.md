# TO WORLD Seed Book — universal formats and reuse rules
**A target format is not a completed conversion.** Preserve all originals, even when a newer representation is preferred.

| Source type | Preserve the actual original | Broadly portable derivatives | Evidence requirement |
| --- | --- | --- | --- |
| Bedrock Minecraft | .mcworld / level.dat / db/ LevelDB | JSON structures, CSV cells, GLB/glTF scenes, PNG atlas | original version, source hash, actual chunk parse |
| Java Minecraft | .mca regions / NBT | JSON, CSV, .schem where valid, GLB/glTF, PNG | parser compatibility and coordinate check |
| Structures / buildings | block palette + dimension/coords | .glb / glTF 2.0; optional .obj/.mtl, .vox, .schem | block geometry + material/scale confirmation |
| Furniture / props | distinct source build area | individual GLB/OBJ + thumbnails and placement notes | avoid merging all furniture into one giant mesh |
| Maps / biomes / height | world seed/dimension + tiles | PNG/WebP/SVG, CSV, JSON, heightmap TIFF/PNG | local block-space coordinates, NEVER invented geolocation |
| Routes / pathing / railways | actual node and edge graph | JSON/CSV + SVG/map overlay; GeoJSON only marked local CRS | player traversability and source verification |
| Redstone / logic | blockstates and wiring | schematic, state graph JSON, diagram SVG | executable behavior needs in-world test |
| Videos / screenshots | original frame/timecode | PNG/WebP references, storyboard, explicitly *new* reconstruction | a recording alone does NOT contain editable voxel meshes |
| Lore, maps, names | source text and original spelling | Markdown, JSON, HTML cards, PDFs for reading | preserve OLD ROOTS, authorship, canon state |

## Seed artifact record (version 0.1)
Each asset must contain: stable ID; original name as recorded; source version/time/filename/hash; observed category; source rights; source-coordinate system; actual extents; output format and extractor version; visual/geometric QC; public/private flag; OLD ROOTS flag; aliases; Ryan's actual GO/HOLD.

## Excavation pipeline
1. Inventory and fingerprint each saved world (different filenames may be copies).
2. Identify Bedrock/Java and version. Copy byte-for-byte for preservation.
3. Parse world chunks/regions and build usable **scene regions** with origin and dimension.
4. Detect and review roads, rooms, houses, portals, rails, furnishings, machinery.
5. Export **one complete verified sample** to a portable model, a 2D map and source-neutral path JSON.
6. Show Ryan before extending to batch conversion; **block-style is a spatial scaffold**, not a mandate to slavishly reproduce original blocks.
7. Generate source-attributed thumbnails, HTML cards, level pages and model previews.
8. Publish only cleared derivatives and verify public browser access. Mirror index links to each agent's public access route. Private originals remain restricted unless separately cleared.

## Rights and visibility
User-created structures can form the basis for derivatives, but original Minecraft game textures, logos, third-party mods, skins and other creators' work may have separate restrictions. No public upload of unreviewed personal labels, gamer tags, identities or raw saved worlds. Do not invent public models to meet an artifact count.

**Default open interchange:** GLB/glTF for 3D, JSON/CSV for structured data, PNG/SVG for maps, and HTML/Markdown for browsable folios. Maintain native format as first-class provenance.