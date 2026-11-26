#!/usr/bin/env bash
# Copy this repo's Claude Code agents and commands into another project,
# or into your user folder (~/.claude) so they work in every project.
#
# Usage:
#   scripts/install-agents.sh /path/to/other/project   # one project
#   scripts/install-agents.sh --user                   # all projects (~/.claude)
#   add --force to overwrite files that already exist
set -euo pipefail

SRC="$(cd "$(dirname "$0")/.." && pwd)/.claude"
FORCE=0
TARGET=""
for a in "$@"; do
  case "$a" in
    --force) FORCE=1 ;;
    --user)  TARGET="$HOME/.claude" ;;
    -h|--help) sed -n '2,8p' "$0"; exit 0 ;;
    *) TARGET="$(cd "$a" && pwd)/.claude" ;;
  esac
done
[ -n "$TARGET" ] || { echo "Give a project path or --user (see --help)"; exit 1; }
[ "$TARGET" != "$SRC" ] || { echo "Target is this repo itself; nothing to do."; exit 1; }

copied=0; skipped=0
while IFS= read -r -d '' f; do
  rel="${f#"$SRC"/}"
  dest="$TARGET/$rel"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ "$FORCE" -ne 1 ]; then
    echo "skip (exists): $rel"; skipped=$((skipped+1)); continue
  fi
  cp "$f" "$dest"; echo "copied: $rel"; copied=$((copied+1))
done < <(find "$SRC/agents" "$SRC/skills" -type f -print0)

echo "Done: $copied copied, $skipped skipped -> $TARGET"
echo "Start a new Claude Code session there to load the agents."
