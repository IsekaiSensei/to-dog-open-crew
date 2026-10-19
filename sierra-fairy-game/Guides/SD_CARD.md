# One card, two computers

Copy the extracted **TO_WORLD_SD_CARD** folder onto the existing SD card. Do not format the card for this handoff. The master carries Jan, Silver Shadow's Godot/Unity source, common assets, documentation and checkpoints.

- Close Jan, Godot and Unity before ejecting; safely unmount, move the card, then reopen on the other computer.
- Use a card filesystem that both installed operating systems already read and write. SteamOS commonly uses ext4 for game storage; Windows needs appropriate support for ext4. exFAT can be shared but is a choice to make after protecting existing contents. This package performs no repartitioning or formatting.
- Keep the folder's internal structure. The Linux and Windows launchers resolve their own location, so the mount point or drive letter may differ.
- Install a compatible engine/runtime for each host OS. One Windows executable does not become a native Linux app by moving it. This card is a portable workspace; it does not install or boot SteamOS on the Latitude.
- Rebuild `.godot` and Unity `Library`, `Temp`, `obj` caches per machine when necessary; retain source and `.meta` files. Save a checkpoint and keep a second backup of important work.
- Godot `user://` and Unity persistentDataPath normally point to host storage. Use an explicit chosen save/export folder on the card for cross-host saves. Moving project source alone does not migrate those saves.
- Quest receives a copied project/ZIP or an exported build over a supported transfer path. No microSD slot or direct SD-card sharing with Quest is assumed.

Jan's current portable identity and migration instructions are in the master card's Jan folder. A public download contains no pre-existing personal Jan chats, private Books, account tokens or model weights.
