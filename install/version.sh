#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=common.sh
source "$SCRIPT_DIR/common.sh"

installed="unknown"
if [[ -f "$TARGET_DIR/VERSION" ]]; then
  installed="$(tr -d '[:space:]' < "$TARGET_DIR/VERSION")"
fi

echo "Onboarding skill version"
echo "- Installed: $installed"
echo "- Target: $TARGET_DIR"

if [[ -f "$META_FILE" ]]; then
  echo "- Source metadata:"
  cat "$META_FILE" | sed 's/^/  /'
else
  echo "- Source metadata: not set"
fi
