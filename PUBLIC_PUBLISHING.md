# Public publishing — review, QC, go

Ryan’s October 17, 2026 instruction authorizes release of this public glossary and review/fixes of the handoff bridge. It does not grant blanket permission to publish private archives or unrelated drafts.

## One continuous flow
1. **Prepare:** identify the Page, exact source/version, destination and intended audience. Use the existing authority; do not ask for the same GO again.
2. **Review:** correct wording, attribution, rights and private-source boundaries. Keep one canonical source and platform-sized adaptations.
3. **QC:** open the actual artifact, check links and behavior, and record what was really tested. Fix defects before release.
4. **Publish:** execute the authorized release. GitHub source, GitHub Pages deployment, and each social platform need their own successful operation.
5. **Verify:** open the resulting public URL and check the intended version. Record platform, URL, version/date and evidence. A scheduled post is SCHEDULED, not LIVE.
6. **Return receipt:** give Chat the correction and release evidence in this maintained public record. A record posted here is not proof Chat or another agent read it.

## Script QC: what the bridge actually does
- `offline-bridge/index.html`: local text composer. Build/Copy/Save do not publish, send, sync or grant permission. It now stamps the actual build time.
- `offline-bridge/make_packet.py`: local exact-file ZIP builder. No network or automatic directory scan. Public is the default audience and rejects private rows; explicitly authorized private packaging has a separate output name.
- ZIPs contain SHA-256, sizes, provenance and audience. Missing files, unsafe paths and symlinks fail. Output is replaced atomically only after ZIP validation. Failed attempts warn that any previous ZIP is stale for that attempt.
- `.gitignore` guards against accidentally staging inputs, whitelists and output archives. It is not a security boundary and cannot protect files already tracked or deliberately force-added.
- Human clearance remains necessary: the script cannot establish that a rights label is true, or detect every secret in a file marked public.

## Platform adaptation
Use the same cleared glossary source. A Facebook text post can carry the full short summary; TikTok/Instagram can use the short caption below with an approved visual or video. No social publication is implied by storing this caption.

Bowl holds orders. Page presents work. Scroll carries work. Book preserves knowledge. Public Pages can live on GitHub, Facebook, TikTok, Instagram and beyond. Review → QC → publish → verify. A public Page shares cleared work; private Books keep their boundaries. — TO WORLD / GERTECH

## GitHub Pages activation
The repository root `index.html` is the web entry; `offline-bridge/index.html` is the composer. In repository Settings → Pages, select Deploy from a branch → main → /(root) → Save. After deployment, open the URL GitHub reports and verify the glossary and composer. This instruction is configuration guidance, not evidence deployment occurred.
