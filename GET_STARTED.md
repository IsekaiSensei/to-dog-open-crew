# Join Open Crew: your repository, your assistant, shared lessons

<!-- MEDIA-HSBS-001 -->
## Standing media format — CANON, October 20, 2026

**Flat Half-Side-by-Side (HSBS), Cardboard-style.** Left-eye view left; right-eye view right; flat-screen presentation; playback restores each eye's original proportions. Same format for phone/Cardboard and Quest. All crew/fairies/agents carry this into stereoscopic image/video work. Only Isekai Sensei may explicitly change this canon. This supersedes conflicting older delivery instructions below; preserved historical sources and interactive applications retain their own scope. [Full standing order](MEDIA_FORMAT_CANON.md).
<!-- /MEDIA-HSBS-001 -->


**For Silver Shadow’s game files and beginner lessons, use the [actual Godot/Unity/Quest package](sierra-fairy-game/README.md).** The general account/repository steps below are optional onboarding, not the game asset handoff.
Updated October 11, 2026.

Use your own project repository for your work. Use [Open Crew](https://github.com/IsekaiSensei/to-dog-open-crew) to share tested improvements to the collaboration process. Reading this public repository needs no invitation. Contributing through a fork and pull request does not require direct write access.

## 1. Create your own repository
Sign into your own GitHub account and open https://github.com/new. Choose yourself as owner, enter a project name, choose visibility, initialize a README, and create the repository. Keep unfinished personal work private if that suits your project. Choose a license only when you have decided what permissions to grant.

Your assistant can prepare the files and guide you through the screens. Treat creation as a human step unless your current session actually exposes and successfully uses a repository-creation tool.

## 2. Choose the available ChatGPT route
Use your own ChatGPT account. A paid subscription is not a prerequisite for the manual workflow below. Do not buy an API key for this workflow.

**Connected route:** If your app exposes Plugins, look for GitHub, inspect its permissions, install it, and authorize your own GitHub account. Select your project repository where repository selection is offered. In a new chat, ask the assistant to read your README and report the actual repository, branch and content it accessed. An installed plugin is not proof of successful repository access. Availability depends on the account and app surface; use the manual route if GitHub is absent or access fails.

**Manual route:** Paste the current relevant files into ChatGPT, including their paths and the branch or commit when known. Ask for complete replacement text or a small patch. On GitHub, open or create the file, paste the reviewed result, and commit it. For changes to someone else's repository, use the fork/PR route below. Label pasted material as manual context; the assistant must not claim it read GitHub live.

Keep the current files as your continuity record. A new conversation should read them again. Model names and versions do not define project roles.

## 3. Seed four small files
Create these alongside your README. The examples are deliberately short; replace brackets with actual information.

### README.md
```markdown
# [Project name]
Purpose: [one sentence]
Owner: [person or handle]
Starting engine: [Godot / Unity / undecided]
Current milestone: [one small playable result]
Start here: AGENTS.md, STATE.md, then WORK.md.
Public methods hub: https://github.com/IsekaiSensei/to-dog-open-crew
```

### AGENTS.md
```markdown
# Working instructions
Read GitHub first when live access is available; otherwise request current files.
Report the actual repository, branch and access method. Never invent access or tests.
Read STATE.md and WORK.md before proposing the next step.
Work only on the requested scope. Preserve unrelated work.
Distinguish confirmed decisions, observations and proposals.
Verify what changed; report what was actually tested and what remains blocked.
Use a branch and pull request for shared changes; do not merge without owner approval.
Keep human source/credit information when relevant. No AI authorship roster is required.
```

### STATE.md
```markdown
# Current state
Confirmed decisions: [short list]
Working now: [one milestone]
Evidence: [actual files, commit or run result]
Open decisions: [unresolved choices]
Blocked by: [dependency, or none]
Updated: [date]
```

### WORK.md
```markdown
# Current work
NOW: [one authorized task]
HOLD: [deferred work and dependency]
Done: [result and verification]
Next: [smallest useful step]
```

Keep each fact in one maintained place. Git history preserves old versions; do not grow duplicate status documents or copy every conversation into the board.

## 4. Start the first work packet
Paste this into your assistant after supplying access or current files:

> My project is [repository URL], branch [branch]. Read README.md, AGENTS.md, STATE.md and WORK.md. If you cannot access them, say so and use the files I supply. Summarize the current goal, confirmed decisions and blocker. Help me finish only [task]. Distinguish proposals from decisions. Report changed files, actual checks, unresolved blockers and the next step.

A good first task is adding the seed files or making one tiny playable scene. End the packet by updating the relevant state/work entries with actual results. An assistant saying a game works does not replace running it.

## 5. Share one improvement with Open Crew
1. Read this guide, README.md and ETHICS.md in the public repository.
2. Fork Open Crew into your own GitHub account. Create a branch for one contribution.
3. Add a small note under `contributions/<your-handle>/<date>-<topic>.md`, or improve a specific instruction directly.
4. Commit the change to your branch and open a pull request targeting `IsekaiSensei/to-dog-open-crew` on `main`.
5. Explain what you tried and the evidence. Respond to review; the owner handles acceptance and merge.

Use the note template below. A suggestion without a trial is welcome when clearly marked **PROPOSAL**. Do not label it tested.

```markdown
# [Short improvement title]
Status: TESTED / OBSERVED / PROPOSAL
Situation: [app surface and relevant setup; no credentials]
Tried: [steps]
Observed: [actual result or error]
Suggested improvement: [one concrete change]
Evidence: [public link, commit or concise reproduction]
Still unknown: [limits or unanswered question]
```

Share methods and appropriately cleared examples. Keep private chats, personal details, credentials, unpublished lore and unapproved assets in their proper project. Public access does not itself grant permission to reuse every asset. Human contributors keep meaningful source and credit information; routine notes need no multi-agent author/approver chain.

The older TEST-OPEN-001 access exercise is historical and optional. Its read-only/HOLD directions apply to that test, not to ordinary onboarding or an explicitly requested contribution.

## Done means
You own a repository with the four starter files; your assistant has demonstrated live access or is honestly using supplied files; you have completed one scoped packet; and, when ready, a small public contribution is submitted for review. A submitted PR is not a merged change.

## Official references
- [GitHub: create a repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository)
- [GitHub: contribute through a fork and pull request](https://docs.github.com/en/get-started/exploring-projects-on-github/contributing-to-a-project)
- [ChatGPT: plugins](https://learn.chatgpt.com/docs/plugins)
- [ChatGPT: current plans and availability](https://learn.chatgpt.com/docs/pricing)

Account features and interface labels can change. Verify the options actually shown in your account; the manual route remains usable without a GitHub connection.
