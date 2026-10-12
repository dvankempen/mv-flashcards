#!/usr/bin/env bash
# Stop hook: block ending the turn while the current branch has commits that
# are on no remote-tracking ref. Guarded by stop_hook_active (one block per
# stop attempt, then Claude may stop).
# Install: .claude/hooks/stop-unpushed.sh + stop-unpushed.settings.json
set -u

input=$(cat)

field() {
  if command -v jq >/dev/null 2>&1; then
    printf '%s' "$input" | jq -r --arg k "$1" '.[$k] // empty'
  else
    printf '%s' "$input" | sed -n "s/.*\"$1\"[[:space:]]*:[[:space:]]*\"\{0,1\}\([^\",}]*\).*/\1/p" | head -n1
  fi
}

[ "$(field stop_hook_active)" = "true" ] && exit 0

cwd=$(field cwd)
if [ -n "$cwd" ] && ! cd "$cwd" 2>/dev/null; then
  echo "stop-unpushed: cannot cd to '$cwd'; unpushed-commit check skipped" >&2
  exit 0
fi
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || exit 0
branch=$(git symbolic-ref --quiet --short HEAD) || exit 0   # detached HEAD
[ -n "$(git remote)" ] || exit 0                            # no remote configured

count=$(git rev-list --count HEAD --not --remotes 2>/dev/null) || exit 0
[ "$count" -gt 0 ] || exit 0

# Upstream remote of the branch; else origin if present; else the first remote.
remote=$(git config --get "branch.$branch.remote" 2>/dev/null)
if [ -z "$remote" ] || [ "$remote" = "." ]; then
  remote=$(git remote | grep -qx origin && echo origin || git remote | head -n1)
fi

echo "Branch '$branch' has $count unpushed commit(s). Push before ending: git push -u $remote $branch" >&2
exit 2
