#!/usr/bin/env bash
set -euo pipefail

BOT_TOKEN="${TELEGRAM_BOT_TOKEN:-}"
SCOPE="${TELEGRAM_COMMAND_SCOPE:-default}"
LANG_CODE="${TELEGRAM_COMMAND_LANG:-}"

if [[ -z "$BOT_TOKEN" ]]; then
  echo "error: TELEGRAM_BOT_TOKEN is required" >&2
  exit 1
fi

API="https://api.telegram.org/bot${BOT_TOKEN}/setMyCommands"

COMMANDS='[
  {"command":"onboarding","description":"Run team onboarding wizard"},
  {"command":"onboarding_version","description":"Show onboarding installed version"},
  {"command":"onboarding_update","description":"Update onboarding from git"},
  {"command":"onboarding_install","description":"Install onboarding from git"}
]'

payload=(--data-urlencode "commands=$COMMANDS")

case "$SCOPE" in
  default)
    payload+=(--data-urlencode 'scope={"type":"default"}')
    ;;
  all_private_chats)
    payload+=(--data-urlencode 'scope={"type":"all_private_chats"}')
    ;;
  *)
    echo "error: unsupported TELEGRAM_COMMAND_SCOPE: $SCOPE" >&2
    exit 1
    ;;
esac

if [[ -n "$LANG_CODE" ]]; then
  payload+=(--data-urlencode "language_code=$LANG_CODE")
fi

resp=$(curl -sS -X POST "$API" "${payload[@]}")

echo "$resp" | grep -q '"ok":true' || {
  echo "error: failed to register commands: $resp" >&2
  exit 1
}

echo "telegram commands registered"
