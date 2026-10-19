# Networking Station in CIC
**Active public project page** · Status: OPEN / WORKING  
Owner: Isekai Sensei  
Public hub: https://github.com/IsekaiSensei/to-dog-open-crew  
Updated: 2026-10-15

## Purpose
The Networking Station is the CIC (Combat Information Center) for public-facing content distribution and shared methods.  

It exists so that someone watching the videos can see how basic versions are made — ethics, starter workflows, and what a single well-formed prompt can produce — without access to refined private production, private lore, or personal materials.

Secondary goal: help other minor influencers run lighter versions of the same system.

## What the public model includes
- Ethics and collaboration rules (see [ETHICS.md](ETHICS.md))
- Basics: one-prompt AI generation, simple storyboard-to-clip flow, caption/structure templates
- Clear labeling of what is one-prompt draft vs. refined production
- Methods that can be copied and adapted without needing private hub access

## What stays private
- Refined multi-pass production
- Personal continuity pages, private fishbowls, and full agent orders
- Gamer-tag or sensitive-unclassified material
- Unapproved canon and private operational scrolls

## Automated posting system (current ironing)
Goal: the most hands-off pipeline that still keeps a human GO/HOLD gate.

### Working approach under evaluation
1. Structured source of truth (Drive or GitHub folder of approved packets: media + caption + platform notes)
2. Agent or automation reads the packet
3. Platform-aware formatting and scheduling (via MCP-capable scheduler or API)
4. Isekai Sensei or Acting CO reviews and releases
5. Cross-post to Instagram, TikTok, YouTube Shorts, X, and Facebook

### Candidate tools (2026 landscape)
- PostAxis, Socialync, Posta, and similar MCP/API schedulers that accept agent instructions and handle multi-platform formatting
- Bulk clip cutters that turn longer source into short verticals
- Existing Grok Bot (Continuity Watch) for private status; a dedicated public-facing posting bot is under consideration

### Current constraints
- Short clips (<60 s) are strong for discovery but usually ineligible for most platform reward programs
- AI-content disclosure and originality rules must be followed on every public post
- No automatic upgrade of paid agent capacity just because free limits are hit

## How minor influencers can use this
1. Start with the public ethics and GET_STARTED files
2. Build a one-prompt packet (image or short clip + caption)
3. Use the same structured folder → review → schedule pattern
4. Contribute tested improvements back via fork + PR under `contributions/`

## Active work
- [ ] Finalize the minimum packet format (media + caption + disclosure + platform list)
- [ ] Choose and connect one primary scheduler that supports agent/MCP posting
- [ ] Define the GO/HOLD checklist for public release
- [ ] Document the exact one-prompt baseline so viewers can reproduce basic results
- [ ] Test a small batch of public posts and measure discovery-to-Patreon conversion

## Status labels
- REQUESTED: public methods page and automated posting research
- CREATED: this page
- AVAILABLE: in open-crew repo and Drive hub
- TRANSFERRED / READ-VERIFIED / TESTED: pending next review cycle

**Evidence rule:** Posted is not delivered. Delivered is not read. Read is not tested.

Next recommended order: lock the packet format and pick the first scheduler for a 7-day test.  
Isekai Sensei retains final GO/HOLD.  
