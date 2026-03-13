# onboarding

Bootstrap repository for OpenClaw team-onboarding skill.

## Structure

- `team-onboarding/` — skill files synced into OpenClaw workspace

Required by local updater:
- `team-onboarding/VERSION`

## Publish to GitHub

```bash
git init
git add .
git commit -m "bootstrap onboarding skill"
git branch -M main
git remote add origin https://github.com/carterassist/onboarding.git
git push -u origin main
```

## Versioning

When you change the skill:
1. bump `team-onboarding/VERSION`
2. update `team-onboarding/CHANGELOG.md`
3. tag release (optional): `git tag vX.Y.Z && git push origin vX.Y.Z`
