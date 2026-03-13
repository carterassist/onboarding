#!/usr/bin/env bash
set -euo pipefail

REF="${1:-main}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=common.sh
source "$SCRIPT_DIR/common.sh"

ensure_prereqs
mkdir -p "$TMP_DIR"
REPO_DIR="$TMP_DIR/repo"

if [[ ! -d "$REPO_DIR/.git" ]]; then
  git clone "$REPO_URL" "$REPO_DIR" >/dev/null 2>&1 || {
    echo "error: failed to clone $REPO_URL" >&2
    exit 1
  }
else
  git -C "$REPO_DIR" fetch --all --tags --prune >/dev/null 2>&1
fi

if is_repo_empty "$REPO_DIR"; then
  echo "error: remote repo is empty ($REPO_URL)" >&2
  echo "hint: push onboarding files to the repo first, then run update again." >&2
  exit 1
fi

if git -C "$REPO_DIR" rev-parse --verify "$REF" >/dev/null 2>&1; then
  git -C "$REPO_DIR" checkout -f "$REF" >/dev/null 2>&1
elif git -C "$REPO_DIR" rev-parse --verify "origin/$REF" >/dev/null 2>&1; then
  git -C "$REPO_DIR" checkout -f -B "$REF" "origin/$REF" >/dev/null 2>&1
else
  echo "error: ref not found: $REF" >&2
  exit 1
fi

if [[ ! -d "$REPO_DIR/team-onboarding" ]]; then
  echo "error: expected folder missing in repo: team-onboarding/" >&2
  exit 1
fi

if [[ ! -f "$REPO_DIR/team-onboarding/VERSION" ]]; then
  echo "error: expected file missing in repo: team-onboarding/VERSION" >&2
  exit 1
fi

mkdir -p "$(dirname "$TARGET_DIR")"
mkdir -p "$TARGET_DIR"

rsync -a --delete \
  --exclude '.git' \
  --exclude '.DS_Store' \
  "$REPO_DIR/team-onboarding/" "$TARGET_DIR/"

COMMIT="$(git -C "$REPO_DIR" rev-parse --short HEAD)"
VERSION="$(tr -d '[:space:]' < "$TARGET_DIR/VERSION")"
UPDATED_AT="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

cat > "$META_FILE" <<EOF
repo=$REPO_URL
ref=$REF
commit=$COMMIT
version=$VERSION
updated_at=$UPDATED_AT
EOF

echo "onboarding updated"
echo "- version: $VERSION"
echo "- ref: $REF"
echo "- commit: $COMMIT"
