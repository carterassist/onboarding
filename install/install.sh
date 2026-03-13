#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REF="${1:-main}"
REGISTER_COMMANDS="${REGISTER_TELEGRAM_COMMANDS:-0}"

"$SCRIPT_DIR/update.sh" "$REF"
"$SCRIPT_DIR/version.sh"

if [[ "$REGISTER_COMMANDS" == "1" ]]; then
  "$SCRIPT_DIR/register-telegram-commands.sh"
fi
