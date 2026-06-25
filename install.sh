#!/usr/bin/env bash
set -euo pipefail

DESTINATION="${1:-$HOME/.codex/skills}"
TARGET="$DESTINATION/solana-program-release-skill"

mkdir -p "$TARGET"
cp -R skill "$TARGET/"
cp README.md LICENSE "$TARGET/"

echo "Installed solana-program-release-skill to $TARGET"
echo "Skill entry: $TARGET/skill/SKILL.md"
