#!/usr/bin/env bash
set -euo pipefail

REPO_URL="https://github.com/carterassist/onboarding.git"
TARGET_DIR="/home/clawdbot/.openclaw/workspace/skills/team-onboarding"
META_FILE="$TARGET_DIR/.git-source"
TMP_DIR="${TMPDIR:-/tmp}/onboarding-git-sync"

ensure_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "error: missing required command: $1" >&2
    exit 1
  }
}

ensure_prereqs() {
  ensure_cmd git
  ensure_cmd rsync
}

is_repo_empty() {
  local repo_dir="$1"
  if git -C "$repo_dir" show-ref --head --quiet; then
    return 1
  fi
  return 0
}
