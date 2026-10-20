# OWNER REQUIREMENT — VIRTUAL 4K / VR180 HEADSET-VIEWABLE EXPERIENCE

<!-- MEDIA-HSBS-001 -->
## Standing media format — CANON, October 20, 2026

**Flat Half-Side-by-Side (HSBS), Cardboard-style.** Left-eye view left; right-eye view right; flat-screen presentation; playback restores each eye's original proportions. Same format for phone/Cardboard and Quest. All crew/fairies/agents carry this into stereoscopic image/video work. Only Isekai Sensei may explicitly change this canon. This supersedes conflicting older delivery instructions below; preserved historical sources and interactive applications retain their own scope. [Full standing order](MEDIA_FORMAT_CANON.md).
<!-- /MEDIA-HSBS-001 -->


**Record:** VR180-4K-REQ-001 · **Date:** 2026-10-19 · **Status:** OWNER-REPORTED REQUIREMENT, NOT VERIFIED DELIVERY
**Project parent:** TO WORLD / GERTECH · **Public owner:** Isekai Sensei
**Source of requirement:** Direct owner instruction in conversation on 2026-10-19: "We have been asking for a virtual 4K over and over VR 180 viewable experience." Repeated clarification reported by owner. Exact prior request count is not independently audited.

## The requirement: do not substitute something else

**Deliver a genuinely headset-viewable, immersive 180-degree experience with a defined, verifiable 4K-class output target.** It must be possible to open the actual deliverable in a compatible VR headset and look around its 180-degree scene; the specification and tests must identify exactly what was delivered.

A flat image, a 4K rectangle played on a virtual cinema screen, a regular 2D video, a rotating 3D model, a 360-degree environment, an AI-generated concept image, a WebXR landing page, and passthrough footage with a floating fairy are **not automatically VR180**. All may be useful separately; none may be relabeled as satisfying this requirement without meeting the checks below.

**Important separation of scopes:** The existing *TO FAIRY* Quest 2 asset-first passthrough effort is real, separate work. The already-reported passthrough app, fairy .glb, proposed TO DOG Godot scene, and VRChat test bed do **not** complete the VR180/4K viewing request. Do not overwrite, delete, reroute, or stop those parallel efforts to 'fix' this document.

## Definitions that all agents must use

| Term | What it means here | What does NOT prove it |
| --- | --- | --- |
| **VR180** | Content projected over a 180-degree viewing hemisphere, with appropriate panoramic projection and headset orientation tracking, so turning the head reveals different parts of that hemisphere. Could be mono or stereo; report which. | A flat 180-degree camera pan; headset 180-degree *physical* field of view; a static video on a big virtual rectangle; 360 content mislabeled as 180. |
| **Virtual / headset-viewable** | Content runs in an actual VR viewer/player or XR scene and responds correctly to head orientation. The user can safely enter, look and exit. | A browser can open a URL in a normal 2D tab; a screenshot or desktop mockup. |
| **4K** | A concrete output resolution target must be written as pixel width × height, **plus whether this describes total packed frames, per-eye images, or rendering per eye**. As an initial, auditable 4K-class total-frame reference, 3840×2160 is acceptable for a *proposal*, not proof of final quality. Alternative 4K-class layouts require an explicit rationale. | Saying "4K" without a count; assuming total side-by-side stereo pixels equal 4K in each eye; equating Quest display-panel specifications with delivered media resolution. |
| **Stereo 3D** | Distinct left- and right-eye images encoded and projected in a compatible arrangement; describe side-by-side, top/bottom, separate-eye rendering, or other actual layout. | Two identical eye frames, a 2D monoscopic panoramic image, or an untested player setting. Stereo may be an enhancement; **do not assume the owner has approved a particular eye layout yet**. |
| **Head tracking** | On-headset motion changes the visible region of the VR180 content as intended. For prerecorded VR180 media, head rotation does not automatically provide positional six-degree-of-freedom parallax. | Scrollbars, mouse panning alone, or a claim that 3D rendering automatically equals head-tracked VR180. |

## Acceptance evidence — required before anybody says DONE

1. **Deliverable location:** Provide the actual file(s), functioning versioned player URL/build if applicable, source or build provenance, and exact paths. A proposal or GitHub Markdown page is not the experience.
2. **Pixels and projection:** Inspect exported media metadata or rendering settings. Report width×height, mono/stereo and eye packing, projection type (e.g. equirectangular 180 or another documented mapping), codec/container if video, and relevant viewer configuration. If no media file exists, report the engine's render-per-eye settings instead. Avoid calling upscaling native 4K.
3. **Device playback:** Test **the actual target headset and player**. Identify headset model, browser/app/player version, build/URL, media/build revision and test date. A user-reported existing Quest 2 passthrough test is evidence for *that app only*, not this deliverable.
4. **VR180 viewing:** Confirm correct hemisphere projection, scene orientation, no broken seam or wrap-around, head-rotation response left/right/up/down, and whether a stereo test displays appropriate depth when stereo is claimed. Record pass/fail, including screenshots/recording if legitimately captured.
5. **Comfort and usability:** Document seated-friendly play, controls, recenter/exit, image alignment, readable content, nausea/visual artifacts and accessibility; do not rely on red-only cues.
6. **Owner review:** Label results **REQUESTED**, **IMPLEMENTED**, **TESTED ON HEADSET**, and **OWNER-ACCEPTED** separately. Only the owner may accept the experience; passing technical tests alone does not change the owner’s intended aesthetic or canon.

## Required return format for Meta, Work, Muse, Grok, and any open agent

```text
Order: VR180-4K-REQ-001
Interpretation: 180-degree projected VR viewing, not passthrough/flat/360
What I actually delivered: <file/build/URL, or NONE>
Source/provenance: <repo, branch, commit, tool/export settings>
Pixel dimensions: <width x height> | total or PER EYE: <explicit>
Projection: <180 equirectangular / documented equivalent / unknown>
Eyes: <mono / stereo SBS / stereo TB / native per-eye / unknown>
Headset + player actually tested: <model/version/date or NOT TESTED>
Head-turn and projection checks: <pass/fail/not tested>
Accessibility + exit: <pass/fail/not tested>
Owner acceptance: <pending/accepted/rejected; never infer approval>
Blocker / next smallest verifiable step: <specific>
```

**For Meta specifically:** Artwork, prompts, an asset manifest, a 3D .glb fairy, and an MR passthrough scene are distinct deliverables; do not present any of these as "4K VR180 complete." If asked for this order, return a working headset-playable VR180 artifact **or** explicitly say only a concept/partial component is available. Do not claim to have used or read GitHub, created a build, exported 4K, or tested a Quest unless you actually did.

## Evidence as of this correction

- **VERIFIED REPOSITORY RECORD:** This requirement document and its referenced current hub/README paths exist only after their GitHub writes are confirmed.
- **OWNER-REPORTED:** A VR180/virtual 4K request has been repeated; owner asks to stop conflating it with other media and MR work.
- **VERIFIED REPO OBSERVATION:** The existing public hub emphasizes TO FAIRY passthrough, a fairy .glb, and conceptual VR design. The inspected public documents do not by themselves demonstrate a tested 4K VR180 player or video.
- **NOT VERIFIED:** A 4K VR180 file, native per-eye resolution, actual headset VR180 playback, a Meta agent read receipt, or owner acceptance. Do not change these labels without evidence.

## Existing scopes, not substitutes

- [VR / graphics hub](HUB_VR_GRAPHICS_START_HERE.md)
- [TO FAIRY Quest 2 passthrough asset-first (separate scope)](https://github.com/IsekaiSensei/chat.work.open.ai/blob/main/TO_FAIRY_QUEST2_START_HERE.md)
- [Historical MR passthrough proposal](https://github.com/IsekaiSensei/chat.work.open.ai/blob/main/VR_PASSTHROUGH_SPARK_FAIRY.md)

**This is a documented acceptance specification, not an implemented/tested headset experience.** Preserve prior Pages, originals, and alternate branches.
