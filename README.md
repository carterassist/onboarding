# onboarding

Bootstrap repository for OpenClaw `team-onboarding` skill.

## Structure

- `team-onboarding/` — skill files synced into OpenClaw workspace

Required by local updater:
- `team-onboarding/VERSION`

---

## Maintainer SSH setup (private repo)

Generate key:

```bash
ssh-keygen -t ed25519 -C "onboarding-maintainer"
```

When prompted with:

```text
Enter file in which to save the key (/home/clawdbot/.ssh/id_ed25519):
```

press **Enter** to use the default path.

Then run:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

Add the printed public key to GitHub:
- GitHub → Settings → SSH and GPG keys → New SSH key

Test:

```bash
ssh -T git@github.com
```

---

## Publish to GitHub (maintainer)

```bash
git init
git add .
git commit -m "bootstrap onboarding skill"
git branch -M main
git remote add origin git@github.com:carterassist/onboarding.git
git push -u origin main
```

---

## Versioning

When you change the skill:
1. bump `team-onboarding/VERSION`
2. update `team-onboarding/CHANGELOG.md`
3. tag release (recommended):

```bash
VER=$(cat team-onboarding/VERSION)
git tag "v$VER"
git push origin "v$VER"
```

---

## Team rollout (pull-only, no login)

If teammates only update/install and do not push:

```bash
bash ~/.openclaw/workspace/projects/onboarding-git-setup/install/update.sh v1.1.0
bash ~/.openclaw/workspace/projects/onboarding-git-setup/install/version.sh
```
