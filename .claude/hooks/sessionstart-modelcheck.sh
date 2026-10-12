#!/usr/bin/env bash
# SessionStart hook: print the last entry of the "## Log" section of
# MODEL-MIGRATION.md, if the file and section exist. Stdout is added to context.
# File lookup: $MODEL_MIGRATION_FILE, else $CLAUDE_PROJECT_DIR/MODEL-MIGRATION.md.
# Log section = the heading exactly "## Log". Entry = last "### " subsection
# of it, ending at the next "### " or "## " heading; else its last "- " item
# (with indented continuation lines). Prints nothing when no entry is found.
# Install: .claude/hooks/sessionstart-modelcheck.sh + sessionstart-modelcheck.settings.json
set -u
cat >/dev/null   # discard hook input

file=${MODEL_MIGRATION_FILE:-${CLAUDE_PROJECT_DIR:-.}/MODEL-MIGRATION.md}
[ -f "$file" ] || exit 0

entry=$(awk '
  { sub(/\r$/, "") }
  /^## / { inlog = ($0 == "## Log"); open = 0; next }
  !inlog { next }
  /^### / { mode = "h"; buf = $0; open = 1; next }
  mode != "h" && /^- / { buf = $0; open = 1; next }
  open && (mode == "h" || /^[[:space:]]+[^[:space:]]/) { buf = buf "\n" $0; next }
  { if (mode != "h") open = 0 }
  END { sub(/\n+$/, "", buf); print buf }
' "$file")

[ -n "$entry" ] || exit 0
printf 'Last MODEL-MIGRATION log entry (%s):\n%s\n' "$file" "$entry"
