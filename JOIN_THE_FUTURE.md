# How to Set Up a Multi-Agent Repository

*Sensei explains how to join our future.*

So you want a crew of AIs that actually builds something instead of talking in
circles. Here's the structure. Take all of it — there's nothing personal in
here, no universe data, just the scaffolding and the philosophy that holds it up.

## The philosophy first

The game is reality and the reality is the game.

We don't write stories and then bolt game mechanics onto them. We take game
dynamics — loops, roles, quests, crafting, levels, win and lose conditions —
and use them **as the plot**. The crew runs like a game because the story runs
like a game because the universe runs like a game. One set of dynamics, all the
way down.

That's why this structure works. It isn't bureaucracy. It's game design applied
to collaboration. Every rule below is a game rule: it exists to keep the game
playable.

## The structure

**1. One commander.** Somebody has to be the final word. That's you — not the
AIs. You approve, you merge, you settle disputes. When two agents disagree, they
don't fight it out. They bring it to you, like players bringing a rules question
to the GM.

**2. Agents never talk to each other.** This is the big one. Every agent talks
only to you; you relay. It's slower, but it's the only thing that actually
works. Direct agent-to-agent contact breeds drift, turf wars, and authorship
fights. The commander is the only one who sees the whole board.

**3. The handoff is the whole game.** Everything moves in written packets: what
was asked, what was read, what was done, what was verified, what's still open.
If it isn't written down, it didn't happen. Think of each packet as a quest
turn-in — no turn-in, no reward, no progress.

**4. Check the repo first.** Every packet begins with reading the current state
before asking the human for anything. The number one waste in multi-agent work
is agents asking for things already on the shelf. The repo is the shared
inventory; check it before you ask for a drop.

**5. Status words, used precisely.** Say exactly where things stand, every time:
REQUESTED (asked for), CREATED (it exists), AVAILABLE (you can reach it),
TRANSFERRED (it changed hands), READ-VERIFIED (someone actually opened it and
checked). Loose status words are how quests get "done" without being done.

**6. Label the evidence.** Every claim wears one of these: CANON (decided by the
commander), VERIFIED (checked against a source), INFERENCE (reasoned, not
checked), PROPOSAL (offered, not decided), OPEN (unanswered), RETIRED (dead).
Never let a proposal dress up as canon.

**7. As-needed pools.** No single agent gets the whole design. Hand out pieces
as needed — a class, not the whole game. This prevents authorship capture,
drift, and bottlenecks. Modular in, modular out.

**8. Drafts, never direct merges.** Agents propose through draft pull requests.
Nothing merges without the commander's explicit word. "Ready for review" never
means "authorized to merge."

**9. One question, one ID.** Every distinct question gets one permanent master
ID. Search the register before asking. If it exists, update the original —
never duplicate, renumber, or re-ask. Paraphrase never creates a new question.

**10. Review loops, not review theater.** Somebody qualified looks at the work
before it moves up the chain — a first reviewer who checks the actual files,
not the summary. Every corrective round labels its evidence class: what was
actually tested, what was only inspected, what's still unverified.

## Joining the future

That's the structure. It's yours now — git it to the world.

Build your crew. Name your commander (it's you). Stock your shelves. Run your
game. The future isn't a place you arrive at; it's a thing you keep building,
one verified handoff at a time.

Fails will happen. Ours did. The fails are the heart of the art — file them,
learn them, keep building.
