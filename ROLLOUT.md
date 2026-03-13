# ROLLOUT.md — Onboarding Skill Release & Deployment

## 1) Maintainer Release Flow (publish changes)

Run from the repo root (`bootstrap-repo` or your cloned onboarding repo):

```bash
# 1) edit files
# team-onboarding/*

# 2) bump version
# team-onboarding/VERSION

# 3) update changelog
# team-onboarding/CHANGELOG.md

# 4) commit
git add .
git commit -m "onboarding: <short change summary>"

# 5) push branch
git push origin main

# 6) tag release (recommended)
VER=$(cat team-onboarding/VERSION)
git tag "v$VER"
git push origin "v$VER"
```

---

## 2) Team/Colleague Update Flow (no login required)

On each OpenClaw setup machine:

```bash
# update to latest main
bash ~/.openclaw/workspace/projects/onboarding-git-setup/install/update.sh

# show installed version
bash ~/.openclaw/workspace/projects/onboarding-git-setup/install/version.sh
```

Because the repo is public, this is pull-only and needs no credentials.

---

## 3) Production Safe Flow (pinned version)

Use explicit release tags for production:

```bash
# install a pinned release
bash ~/.openclaw/workspace/projects/onboarding-git-setup/install/update.sh v1.1.0

# verify installed version
bash ~/.openclaw/workspace/projects/onboarding-git-setup/install/version.sh
```

This prevents accidental upgrades from `main`.

---

## 4) Security Model

- Deployment machines: **pull-only** (no push credentials)
- Maintainers only: push/tag from trusted machines
- Never hardcode private keys or tokens in scripts/repo
- If push auth is needed, use per-user SSH keys or scoped PATs on maintainer machines only
