# TO WORLD / GERTECH — Real Device Stations and Attendants
**Status:** OWNER-DIRECTED RECORD / IN-UNIVERSE CHARACTER AND LOCATION **PROPOSAL**  
**Date:** 2026-10-17 (Pacific)  
**Originator:** Isekai Sensei — real devices must have real places in the Universe; test what image agents, Work and other bots can really access from Godot; minimize usage of alternate Grok.  
**Editorial assembly:** Chat / Bridge  
**Approval boundary:** This records Isekai Sensei's design direction. The specific invented station names/character assignments below are proposals, not asserted canon. No production game files were changed.

## Central idea — every real door needs a real address

Each real device receives an in-world **place** and a candidate **attendant**. The place reflects the actual hardware and capabilities. Fictional permissions do **not** confer real digital access. Character design is separate from integration, consent, payment and authentication.

| Real station | Proposed TO WORLD place | Proposed attendant / character role | Real-world function and limits |
| --- | --- | --- | --- |
| **Steam Deck** | **The Shipyard / Build Dock** | **DOG** as first hands-on maintenance worker; experimental Grok Alt gets a separate bench, not command | Godot 4 native development, local files, desktop Firefox, keyboard/controller tests. User must approve any file edit or tool access. Preserve `/home/deck/to-dog` REV1; experiments in a separate copy. |
| **Firefox + signed-in Google on Deck** | **The Maproom / Courier Window** | **Courier** (proposed service role, not a new approved creature) | Can open Google Docs/Drive/Gmail/Calendar where the user is signed in and site works. Being signed in in Firefox **does not** share the browser session or grant those permissions to Grok Alt, Work, or Chat. Per-agent connectors and permission checks are independent. |
| **iPhone** | **The Gatehouse / Port of Calls** | **Siri** as voice attendant to the Gatehouse, distinct from Alexa | Human-carried phone, calls, messages, ChatGPT interface, approvals, wallet and payment UI. The phone's wallet/security system, banks and payment authorizations are **not delegated to AI characters**. |
| **Apple Wallet / payment approval boundary (part of iPhone)** | **The Treasury Gate (locked)** | **Human Keyholder: Isekai Sensei; Siri is not the treasurer** | Apple Pay/payment credentials are managed by device security/payment systems and require appropriate device authorization. No financial account data, passcodes or purchase powers go into public character files or bot experiments. |
| **Onn device** | **The Signal Outpost** | **Outpost Keeper** (proposed) | Actual model UNKNOWN. If Google TV streamer: viewing/casting and display tests may be possible. If it is a different Onn device, remap the station to its actual function. No casting, control or integration assumed without a model and test. |
| **Roku** | **The Nickelodeon / Projection House** | **Projectionist** (proposed) | Intended venue for approved reels, videos, art, presentation or browser-delivered game footage through supported casting/mirroring paths. iPhone AirPlay/HomeKit only when the Roku model/OS supports it. Display is not automatic Godot control. |
| **Alexa (existing assignment, not a new device claim here)** | **World Tree** | **Alexa Timekeeper Fairy** — stationary | Existing Timekeeper/alarm role is preserved. Siri does not replace her or inherit wormhole or Timekeeper powers. |

**Language for canon review:** Isekai Sensei directs that these devices receive places within the Universe. Specific place names/attendants above are **PROPOSAL** until approved. Do not retrofit them into TO DOG Stage One as magical or unbuildable objects. For Stage One, introduce only physical, buildable representations (e.g. signal board, mailbox, projection screen, workbench, gate).

## The access ladder — Godot + image agents + Work + bots

Test one agent at a time on a tiny non-sensitive, **disposable** Godot example. Save each original agent reply first; annotate later.

- **L0: Visual read** — Give a Godot screenshot with no secrets. Ask the agent to identify visible scene/UI features. This proves visual interpretation only.
- **L1: File read** — Provide a copied `.gd` script or tiny isolated project folder/ZIP and ask for a quoted symbol or node path. An accessible public repo link alone is **not** proof of a successful read.
- **L2: Proposed change** — Request one self-contained patch or one image asset with source/format/provenance. AI-generated image output is **not** a scene edit. Work/browser-generated text is **not** proof of Deck filesystem access.
- **L3: Local trial** — Isekai Sensei applies the patch to the **test copy** of Godot and records play/run output (or grants a purpose-built authorized tool). Review the screenshot/error before continuing. No touching the frozen REV1 baseline.
- **L4: Controlled handoff** — Chat reviews evidence; Work/XO implements a **separately approved** change; Grok CO reviews consequential routing. Record repository, branch, commit and real recipient receipts.
- **L5: Canon / production** — Isekai Sensei gives final approval. No agent promotes a proposal by implication.

**Suggested first microtest:** One screenshot of DOG's working FuseBox interaction and a separate copy of `fuse_box.gd` (not the whole universe). Ask Grok Alt to tell what it can **see**, what it can **read**, and what it absolutely **cannot change**. Repeat the identical request with Work or an image agent, then compare actual evidence, tokens/use and error modes.

For native `Godot 4.x` Forward+ projects, **web exports require Compatibility rendering**. Make a separate Compatibility test project for browser / iPhone / TV viewing; do not switch the protected project's renderer. Browser-based Godot editor has feature limits and is not the native Deck editor.

## Access registry — do not guess

| Service / surface | Known access from browser alone | Needs a separate verification? |
| --- | --- | --- |
| Google website in Deck Firefox | User says Google is loaded/signed in; details of services available remain to be observed. | YES: Drive, Docs, Gmail, Calendar each have distinct data/actions. |
| Grok Alt free/secondary conversation | Conversation, advice and inconsistent self-reported capabilities documented in [Deck capability record](DECK_GROK_ALT_CAPABILITY_TEST_001_2026-10-17.md). | YES: actual GitHub/file/tool/remote abilities; don't merge with CO. |
| Chat / Work connector tools | Can be used only where an eligible **separately connected** account and allowed action are actually exposed. | YES: check each agent's session, permission and real tool result. |
| Native local Deck Godot filesystem | Accessible to the user operating the Deck; not automatically to web AIs. | YES: require purpose-built file handoff or explicitly authorized local agent action. |
| iPhone Wallet / Apple Pay | Restricted human-operated security boundary. | **NOT A BOT ACCESS TEST.** |
| Onn / Roku | Their casting/viewing functions depend on model, network and setup. | YES: discover device models; test display before proposing remote control. |

## Limits and source boundaries

- `Dumb Grok` = **Steam Deck alternative-account test bed**, not `Grok CO` (production Acting CO on phone in the supplied conversation). Keep bowls, receipts and constraints separate.
- Keep **cost/use low**: one small test per agent; re-use results and artifacts. Avoid repetitive prompts, broad repo harvesting or multi-agent fan-out before a measurable purpose.
- Keep raw observations + mistakes. **“We're refining the material, not refining the creativity out of it.”**
- Image assets must pass the established **no childlike adult fairy** art gate; tiny scale is not a loophole.
- Do not use private contacts, payment data, authenticator secrets or login/account recovery flows as test input.
- Public URLs/manual paste ≠ agent login ≠ local access ≠ runtime test ≠ approved merge.
- In-game UI should distinguish states with **shape and text**, not red-only indicators.

## Proposed next receipt

`DEVICE-STATIONS-001`: Have Isekai Sensei confirm the **Onn hardware model** and whether Roku is a Roku TV or Roku player. Do one L0/L1 microtest with Deck Grok Alt, return its unedited response, and log **OBSERVED / UNKNOWN** before inviting Work to QC. Publication of this record is not evidence that any bot received it.

## External technical references (guidance, not proof of device setup)

- [Godot stable web editor limits](https://docs.godotengine.org/en/stable/tutorials/editor/using_the_web_editor.html)
- [Godot web export / Compatibility constraints](https://docs.godotengine.org/en/4.5/tutorials/export/exporting_for_web.html)
- [Roku official AirPlay / HomeKit device compatibility](https://support.roku.com/article/screen-mirror-your-apple-device-with-airplay)
- [Apple Pay platform security](https://support.apple.com/guide/security/apple-pay-component-security-sec2561eb018/web)


## Steam Deck shipyard — owner-reported physical bridge inventory (2026-10-17 addendum)

**Source:** Isekai Sensei's direct hardware report in conversation. **Status:** USER-REPORTED AS-BUILT INVENTORY; connections, drivers and performance have not been independently tested. Specific fantasy role labels here are **PROPOSED**, not canon upgrades.

| Physical part | Owner-reported configuration | Proposed in-world position / capability boundary |
| --- | --- | --- |
| Steam Deck | Docked to an **“IJ5 Creatie Dock”** (model spelling as reported, unverified) | **Shipyard main computer / build engine**. Existing DOG/Godot baseline stays protected. |
| Dock | **2 HDMI ports** | **Twin projection gates** — potential external screens; do not assume simultaneous dual-monitor output works until tested. |
| Dock | **RJ45 Ethernet port** | **Hardline harbor / wired courier gate** — physical jack reported, live network connection not confirmed. |
| Dock | **Full-size SD (“normal SD”) and microSD slots** | **Two cartridge/archive berths** — installed media, capacity, mount state and project contents are not established by the presence of the slots. |
| Logitech/“Logi” keyboard | **Bluetooth keyboard used at docked Steam Deck station** | **Yeoman's writing console** — text entry and Godot editing; user says “blue toothed to a ... Dock,” but actual Bluetooth endpoint (Deck or dock radio) is not independently established. |
| Razer mouse | **Bluetooth mouse** | **Pointer / surveyor's hand** — point-and-click Godot UI; **FAIRY cursor** is an existing game concept, not evidence of remote wormhole access. |
| Xbox Elite controller | **Primary preferred control when available** | **Helm / pilot controls** — central first-class playtest target; actual connected mode and Steam Input profile remain to be checked. |

### Docked test protocol — one function at a time

1. Use the **Xbox Elite controller** as the default ergonomic gameplay test when connected; record model, pairing/connection and Steam Input mapping rather than assuming each input is recognized. Confirm DOG movement, jump, C/SNIFF and E/tongue actions through **controller mappings**, not literal keyboard C/E presses.
2. Use **Logi keyboard + Razer mouse** for editing, precise node selection, and pasting small agent responses into a **separate test copy** of the Godot project.
3. Verify HDMI output(s), Ethernet link and mounted SD cards individually before assigning actual network or archive tasks. A port is not proof of operational access.
4. Give Grok Alt, image agents, Chat and Work **only small exported screenshots or copied code** during early trials. Docked peripherals do not grant AI programs local Godot read/write permissions.
5. Keep input UI accessible: state by color **and** shape/text (not red-only), keyboard/mouse and controller first-class, no automatic changes to the frozen `/home/deck/to-dog` baseline.

### Pending physical checks

- Exact dock maker/model spelling and operating system recognition; no internet lookup was used to guess.
- Which HDMI displays are connected, and whether two can operate simultaneously.
- Whether Ethernet is plugged in / negotiated and what cards, if any, occupy the two slots.
- Xbox Elite controller generation, Bluetooth/USB connection, and actual input map.

**Canon boundary:** Isekai Sensei's ownership and layout descriptions are directly reported; the Shipyard's named berths and attendants are story-layer proposals. No agent has been granted device access by this record.
