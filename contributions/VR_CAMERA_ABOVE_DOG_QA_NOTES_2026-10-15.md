# VR / HTML Muse Concept Track for TO DOG – QA & Continuation Notes
**Date:** 2026-10-15
**Author:** Grok (via IsekaiSensei session)
**Status:** Notes for QA, crew, and further design

## Canon Recap (Confirmed)
- Choose-your-own-adventure movie style. Heavy automation so the player can “just drive.” Meaningful choices still matter.
- Current viewpoint: In VR the player is the camera above DOG. DOG is the companion that acts in the world.
- Separate from the Godot project. Long-term modular VR universe ambition. Cross-device roles are future concept only. AI “overtake or assist” is still open.

## Key Open Design Choice
How much direct influence the player has over DOG while staying the elevated camera.

### Proposed Spectrum for Testing (for QA / Prototype)
1. **Minimal Influence (Pure Observer / Drive Mode)**  
   Player only orients the camera and issues high-level intents (e.g. “follow that path,” “investigate the light”). DOG autonomously executes with heavy AI assistance. Good for “just drive” feel.

2. **Medium Influence (Intent + Nudge)**  
   Player can set waypoints, point at objects, or trigger specific actions via simple gestures/voice while camera stays elevated. DOG interprets and acts. Balances agency and automation.

3. **High Influence (Puppet Mode – optional toggle)**  
   Temporary direct control of DOG movement or actions while camera remains the viewpoint (or switches briefly). Useful for precise interactions but may break the elevated-camera fantasy if overused.

**Recommendation for First Prototype:** Start with Medium. Measure how often players feel they need more or less control.

## Prototype: “First Corridor – Camera Above DOG”
- Short linear corridor with branching points.
- Player camera locked above/behind DOG at adjustable height.
- DOG walks forward automatically; player can nudge direction or select interaction points (doors, objects, NPCs).
- Success metric: Player feels in control of the story without micromanaging DOG’s every step.

## HTML Muse Track Notes
- Parallel web/HTML experience could serve as low-friction entry or companion to VR.
- Same choose-your-own structure, but mouse/keyboard or touch as elevated “camera” over a 2D/3D DOG sprite or model.
- Useful for accessibility, testing narrative branches, and non-VR devices.
- Modular so assets (DOG animations, corridor pieces) can be shared or ported later.

## For QA
- Test camera comfort (height, lag, motion sickness).
- Track how often players attempt to directly control DOG vs. issuing intents.
- Log choice points where automation feels too heavy or too light.
- Ensure meaningful story branches still land even when player is mostly “driving.”

## Open Questions for Crew
- Preferred default influence level?
- Any specific DOG behaviors that should always be player-triggered vs. autonomous?
- Should the HTML Muse version be developed in parallel or after VR prototype?

---
These notes are additive to `VR_CAMERA_ABOVE_DOG_CONCEPT_2026-10-15.md`. Use for QA sessions, design reviews, and next prototype iteration.
