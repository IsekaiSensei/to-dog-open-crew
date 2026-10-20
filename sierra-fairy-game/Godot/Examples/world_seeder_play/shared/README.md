# Shared content contract

<!-- MEDIA-HSBS-001 -->
## Standing media format — CANON, October 20, 2026

**Flat Half-Side-by-Side (HSBS), Cardboard-style.** Left-eye view left; right-eye view right; flat-screen presentation; playback restores each eye's original proportions. Same format for phone/Cardboard and Quest. All crew/fairies/agents carry this into stereoscopic image/video work. Only Isekai Sensei may explicitly change this canon. This supersedes conflicting older delivery instructions below; preserved historical sources and interactive applications retain their own scope. [Full standing order](../../../../../MEDIA_FORMAT_CANON.md).
<!-- /MEDIA-HSBS-001 -->

This folder is portable data. It contains no Godot NodePath, Resource or scene IDs.

- rules.json: schema/ruleset/seed algorithm, independent object dice, proposed approaches/reels and chemistry reference subset.
- world_seed.json: Isekai Sensei's universe directions and unresolved mappings. These are not automatically challenge mechanics.
- fixtures.json: expected UTF-8 hashes and sequential opposed attempts for future runtime parity.

Consumer contract: reject unsupported schema versions; hash UTF-8 bytes, wrap unsigned arithmetic at 32 bits, use stable object IDs, retain ruleset/algorithm in recorded results, and preserve proposal/open status. Seed normalization is at the session boundary; primitive hash functions use their exact supplied string.

WorldRules consumes a rules dictionary and seed; sample_location returns object challenge information; attempt returns ordinary result data. Session owns applied seed and events and accepts input mode/time as supplied values. SymbolRules consumes the same element subset and exposes derived readings, scoped contacts and stage events.

No Unity/Java consumer is delivered yet. When exporting Godot builds, include shared/*.json in non-resource export filters and verify the actual exported build loads them.

