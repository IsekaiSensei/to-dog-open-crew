# TO DOG VR — evidence checklist / Work XO handoff

**Status:** PROTOTYPE. Until run, all gameplay and device tests = UNVERIFIED.

| Test | Expected | Actual / evidence |
| --- | --- | --- |
| Import in Godot 4.7.2 | No script parse or scene load errors | NOT RUN HERE |
| Desktop F5 | DOG visible at floor; fairy visible near eye line | NOT RUN HERE |
| Desktop keyboard | F collects fuse; F repairs; X hides fairy | NOT RUN HERE |
| Desktop mouse | Click fuse, then socket | NOT RUN HERE |
| Godot OpenXR runtime | Head tracking; stereo output; scale plausible | NOT RUN HERE |
| Quest controller | Either laser points; trigger select both steps | NOT RUN HERE |
| Comfort | stationary scene; no forced camera movement; no rapid flashing | NOT RUN HERE |
| Audio accessibility | Soft fairy ting; readable text and gold repaired state | NOT RUN HERE |
| Quest Android export | APK builds and launches | NOT RUN HERE |
| Performance | Stable headset frame pacing, acceptable draw calls | NOT RUN HERE |

### Agent task / return format

- **Work / XO**: Import, resolve compile/runtime issues on a separate branch; run desktop smoke test first; run actual Quest headset test; capture logs, headset model, OS, render backend, Godot/plugin versions, UX failures. No edits to frozen original without a new authorization.
- **Grok / acting CO**: Review test evidence and accept/reject next gate, not just screenshots.
- **Meta/Muse**: Supply optimized real 3D models/rig and approved sound/art notes after engineering proof. Do not treat concept sheet JPG as usable 3D source.

**Pass gate VR-0:** in an actual headset, see DOG at correct small scale, see flying fairy, pick/select fuse and install with a single controller, see changed repaired state, no sickness/forced motion, safe exit. **MR-0** (real-room passthrough) is separate, later.

**Known limitations to investigate:** action names on Quest default OpenXR map, XR startup return, static-body laser hit, fallback camera visibility, occlusion, readability at varied user heights, controller haptic requirements, performance with compatibility rendering, and Android export correctness.

**Receipt:** source/branch/commit; tests observed; error logs; screenshot/video if available; next blocker; reviewer GO/HOLD. No implicit deployment or agent acknowledgment.
