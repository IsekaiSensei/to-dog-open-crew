# TO WORLD — offline agent handoff bridge (public Glass)

The entry is [START_HERE.txt](START_HERE.txt). Anyone with the **downloaded files** can compose a complete agent handoff while disconnected from GitHub/Drive/other bots. Cloud assistants still need their own internet service when actually running. This is neither private Worldbook Alpha nor live command infrastructure.

## Two complete methods

**Text-only:** Fill every field in [ONE_PASTE_AGENT_PACKET.txt](ONE_PASTE_AGENT_PACKET.txt), or open [index.html](index.html) locally to copy/save the entire TXT. Paste it into the agent's own chat. All necessary source text must actually be in that handoff. Ask for [RETURN_RECEIPT_TEMPLATE.txt](RETURN_RECEIPT_TEMPLATE.txt) back.

**Real media/engine assets:** From the offline-bridge directory create a local `inputs/` folder. Put ONLY explicitly owner-cleared inputs there, no symlinks. Create `APPROVED_INPUTS.tsv` in that same directory with a tab-separated header and one row per actual input file:

```tsv
relative_path	source_creator	rights_status	purpose
sample.png	Creator Name	PUBLIC-CLEARED	Authorized example
```

Replace this **illustration** with genuinely cleared files, not invented sample filenames. For private owner-authorized transfers, use `AUTHORIZED-PRIVATE` for the rights status and **do not upload the generated output to public GitHub**. `PUBLIC-CLEARED` requires real rights/clearance; the name alone does not grant permission.

Run `python3 make_packet.py` using Python 3.9+ (standard library only). It creates a **local** `TO_WORLD_AGENT_HANDOFF_LOCAL.zip` with the TXT, exact listed source files, SHA-256 / byte-size / provenance manifest, and ZIP integrity check. It never uses the network. Unlisted files are NOT included; missing listed files stop the handoff. If the whitelist is absent/empty, it packages only text and says no media was included.

Do not commit the outputs or a populated private input area back to the public repo. Do not mistake this packet for automatically delivered/read/tested/accepted work. `ORDERS.md` is an archived access test; do not use it as live active work orders. Frozen TO DOG Rev1 remains untouched.

## Scope
This is a **process-level** public starter, not a private fishbowl, full history, original art or game release. Every agent has its own real account and actual capabilities; the packet gives it complete task instructions but grants no tools or permissions. Ryan decides canon, release and merge; any future current orders must be checked after reconnect. No internal paths, private packet names or manuscripts belong here.


## Reviewed release correction — 2026-10-17
The default public audience rejects AUTHORIZED-PRIVATE rows. Only an authorized private transfer may use `python3 make_packet.py --audience private`; it produces the distinctly named `TO_WORLD_AGENT_HANDOFF_PRIVATE.zip`. Audience labels do not grant rights. The ZIP includes AUDIENCE.txt. Invalid inputs fail before replacing an existing archive; a failed attempt leaves the previous archive unchanged and stale for that attempt. Canonical paths and symlinks are checked. Generated ZIPs, input folders and populated whitelists are ignored by Git as accidental-staging protection (not an access control).

**Does this publish? No.** Python builds a local ZIP; HTML builds/copies/downloads text. Publication is a separate authorized action followed by public URL verification. See [Public publishing flow](../PUBLIC_PUBLISHING.md).
