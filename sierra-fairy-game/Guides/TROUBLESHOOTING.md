# When something does not open

| Symptom | Next check |
| --- | --- |
| GitHub private link says 404 | Use this public folder or its downloaded files. No private account is needed |
| Nothing imported | Extract the ZIP first; select the actual project.godot, not a browser page |
| Tutorial uses a missing node | Check engine major version; current TileMapLayer/Parallax2D differ from older tutorials |
| Script parse error | Keep the complete error, file and line, engine version and last small edit. Restore a working checkpoint |
| Black screen | Select the intended main scene/camera; check visibility, light and material; compare the plain workspace |
| Unity errors or missing SDK | Open the documented editor version and install its required modules; read Unity/README.md |
| OBJ looks dark/wrong | Keep MTL with OBJ; check importer, normals and material conversion. OBJ does not carry all Godot shader settings |
| Jan looks like a different instance | Check the selected data folder resolves to this card's Jan/Data, rather than a new host-local folder |
| Save missing on other computer | Export/copy the actual save to the card; source files and engine host saves are different |
| Quest import blocked | Check editor file permission, extraction location, compatible editor and available storage |

Keep one error at a time. Use README.md, STATE.md and the actual file; an assistant can work by manual paste without connected GitHub. Never paste account secrets into a public issue.
