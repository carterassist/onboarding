# onboarding

## Install (any machine — no SSH key needed)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/carterassist/onboarding/main/install/install.sh)
```

That's it. The repo is public and uses HTTPS — no credentials, no key setup.

---

## Install a specific version/ref

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/carterassist/onboarding/main/install/install.sh) v1.2.0
```

---

## Optional: register Telegram slash commands during install

```bash
export TELEGRAM_BOT_TOKEN="<your_bot_token>"
export REGISTER_TELEGRAM_COMMANDS=1
bash <(curl -fsSL https://raw.githubusercontent.com/carterassist/onboarding/main/install/install.sh)
```

Registered commands:
- `/onboarding`
- `/onboarding_version`
- `/onboarding_update`
- `/onboarding_install`

---

## Update on any machine

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/carterassist/onboarding/main/install/update.sh)
```

---

## Optional cleanup (remove legacy non-Git skill before reinstall)

```bash
rm -rf ~/.openclaw/workspace/skills/team-onboarding
rm -rf ~/.openclaw/workspace/skills/_legacy/team-onboarding-*
rmdir ~/.openclaw/workspace/skills/_legacy 2>/dev/null || true
```

---

## Contributing (maintainer)

Changes to `main` require a pull request — direct pushes are blocked.

1. Create a branch, make changes, open a PR
2. Merge via GitHub
3. Users get the update on next install/update run

To publish initial repo content (one-time, maintainer only):

```bash
cd ~/.openclaw/workspace/projects/onboarding-git-setup/bootstrap-repo
git remote set-url origin https://github.com/carterassist/onboarding.git
git push -u origin main
```
