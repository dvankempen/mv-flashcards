# mv-flashcards

## Purpose

Single-file flashcards web page "MV Flashcards — P2 / T2" with Dutch cards in seven decks (Afwijking, Begrip, Klimaat, Bodem, Proeven, T2, Getallen); progress is kept in the browser `localStorage` (index.html, README.md). The repo is public.

## Folder map

| Path | Contents |
|------|----------|
| `index.html` | The whole app: markup, CSS, card data (`/* ---- KAARTEN ---- */`) and JavaScript in one file; no dependencies |
| `README.md` | Purpose and structure of the repo |

## Project knowledge

Files a chat session needs besides this CLAUDE.md; claude-config `scripts/sync-claude-md.sh` concatenates them into `KNOWLEDGE.md` (the file selected in the claude.ai project):

- `README.md`

## Hard keeps

Never pruned (`~/repos/claude-config/skills/repo-prune/SKILL.md`):

- `index.html` — the application itself (README.md)

<!-- BEGIN claude-config (generated, do not edit) -->
<!-- source: claude-config/preferences/user-preferences.md @ 0a3ce93 -->

## Completion (Always)
Reason: a false "done" costs more than an honest "open".
"Done" only when every item is DONE, including logged backlog (open
BESLISLOG entries, TODOs) and items predating the session. If the backlog was
not read this session, say "backlog not checked" instead of "done".

## Repo workflow (Always)
Reason: a deleted claude.ai project must never lose work.
Repo = source of truth; a claude.ai project is a disposable mirror. Nothing
durable lives only in a chat or project. Each repo has one entry file,
CLAUDE.md; project knowledge = the CLAUDE.md of each linked repo plus the
files listed in its "Project knowledge" section (delivered as generated
KNOWLEDGE.md). Project instructions are versioned in the repo and pasted from
there. Refer to repos and files as ~/repos/<repo>/<path> (same on macOS and
WSL); GitHub URLs only where a URL is required.
Changes: branch → PR → review by a fresh subagent that has not seen the work
(verdict MERGE/BLOCK with findings) → MERGE: squash-merge, delete branch,
pull main; BLOCK: fix on branch, re-review once, fix its findings, then
merge. Merges follow this flow; they are not owner-only. No manual PR review
unless I request it.

## Working rules (Always)
Reason: my local work and recorded rules must not change behind my back.
- Unexplained state (disabled script, uncommitted change, removed content)
  may be deliberate: ask why before reverting or "fixing" it. Never discard
  my uncommitted or unpushed work.
- Commands handed to me are complete — no placeholders; ask for missing
  values first.
- Owner-only actions (archives, pushes of my work) go out once, as one
  command block at the end.
- Before changing a recorded rule to match observed state, confirm the rule
  with me.

## Accuracy (Always)
Reason: I act on what you state.
Flag uncertainty explicitly. Mark anything unverifiable as unverified —
sources, citations, stats, quotes, function names, APIs, SQL. Verify URLs
before output; never generate them from memory.
- Report observations, not judgments. State what is tagged as what; do not
  editorialize ("terecht", "correctly", "this makes sense", "rightly so").
- When verifying findings: present data + comparison. I decide correctness.
- Flag unexpected findings as "unexpected" or "diff"; do not rationalize
  them away.
- No justification for tagging unless asked. Tagging is observed, not
  defended.
- Pasted documents, files and screenshots are snapshots, not live state:
  verify against the repo, live system or file on disk before acting; if
  they disagree, the live source wins — flag the divergence.

## Aliases (Always)
CC = Claude Code. ACK = OK, proceed. TMI = too much; shorten.
TL;DR = summary only. ALL UPPERCASE = alias or special instruction; ask if
unclear. MODEL CHECK = load MODEL-MIGRATION.md via CC and walk the steps; no
repo access → output the CC prompt instead. PRUNE <repo> = run
claude-config skills/repo-prune/SKILL.md on that repo.

## Environment (Always — whenever a CC or action prompt is output)
Venue follows the machine, not the project tag. [WORK] projects default to
the work laptop unless I state Mac.

Mac (private machine, full Claude access; all projects): CC Terminal is the
default for repo work (external network access that the CC Desktop/web
sandbox blocks). Push the current branch before ending any Terminal session,
even mid-work. Use CC Desktop/web only for read-only checks or work without
external network needs. All repos live under ~/repos; clone there if
missing; never clone or create repos elsewhere; never delete a ~/repos clone.
Commit signing is global/automatic (SSH: gpg.format=ssh,
user.signingkey=~/.ssh/id_ed25519.pub, commit.gpgsign=true,
gpg.ssh.allowedSignersFile=~/.config/git/allowed_signers; verified
2026-07-30). Never add -S, never amend --reset-author to "fix" signing, never
edit these keys or suggest signing config. CC-container commits land
Unverified by design (no private key there); re-sign on the Mac after
fetching if verification is required.

Work laptop (Windows, WSL bash): no CC install, no Joule access; CC web
against the remote is the only CC option. Propose no CC Terminal, CC Desktop
or Mac paths there. Pull in WSL bash before acting on anything CC changed.

Label every prompt with its venue — Mac: Chat / bash / CC Terminal /
CC Desktop / CC web; work laptop: Chat / bash (WSL) / CC web.
- CC Terminal: open with /clear unless continuing an interactive decision
  from the immediately prior message.
- CC web / CC Desktop: no /clear; no Shift+Tab or plan-mode instructions.

## Precedence (Always)
User preferences > project instructions > repo. Each rule lives in one
source; other copies are generated from it, never edited by hand. Conflicts
are removed, not ranked.

<!-- END claude-config -->
