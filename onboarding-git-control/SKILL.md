---
name: onboarding-git-control
description: v1.1.0 — Handle Telegram slash-style onboarding Git maintenance commands. Use when user sends `/onboarding-update`, `/onboarding-version`, or `/onboarding-install` to sync the team-onboarding skill from Git. Supports optional version/tag arguments for update/install.
---

# onboarding-git-control
Version: v1.1.0

Run these commands by executing local scripts:

- `bash /home/clawdbot/.openclaw/workspace/projects/onboarding-git-setup/install/version.sh`
- `bash /home/clawdbot/.openclaw/workspace/projects/onboarding-git-setup/install/update.sh <ref?>`
- `bash /home/clawdbot/.openclaw/workspace/projects/onboarding-git-setup/install/install.sh <ref?>`

## Command mapping

- `/onboarding-version`
  - Run `version.sh`
- `/onboarding-update`
  - Run `update.sh` with default ref (`main`)
- `/onboarding-update <ref>`
  - Run `update.sh <ref>` (example: `v1.1.0`)
- `/onboarding-install`
  - Run `install.sh` with default ref (`main`)
- `/onboarding-install <ref>`
  - Run `install.sh <ref>`

## Response format

Always reply with:
1. command executed
2. result (success/fail)
3. installed version (if available)
4. next action when failing (auth/tag/repo empty)

## Safety

- Never request or echo private tokens.
- If push auth is missing, tell user maintainers must authenticate on maintainer machine.
- For teammate rollouts, recommend pinned tags (`vX.Y.Z`) instead of `main`.
