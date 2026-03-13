# onboarding

Great — and no, you only do that once per machine.

Here’s the SIMPLE README steps:

---

## Onboarding Git (Simple)

### One-time (maintainer machine)

1. Create SSH key (once):

```bash
ssh-keygen -t ed25519 -C "onboarding-maintainer" -N "" -f ~/.ssh/id_ed25519
```

2. Add key to agent + copy public key:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
```

3. Add that public key to GitHub SSH keys.

---

### One-time (publish repo)

```bash
cd ~/.openclaw/workspace/projects/onboarding-git-setup/bootstrap-repo
git remote set-url origin git@github.com:carterassist/onboarding.git
git push -u origin main
```

---

### Optional cleanup (remove old local non-Git onboarding skill)

Run this on teammate machines before reinstall:

```bash
rm -rf ~/.openclaw/workspace/skills/team-onboarding
rm -rf ~/.openclaw/workspace/skills/_legacy/team-onboarding-*
rmdir ~/.openclaw/workspace/skills/_legacy 2>/dev/null || true
```

---

### Update onboarding on any machine

```bash
bash ~/.openclaw/workspace/projects/onboarding-git-setup/install/update.sh v1.1.0
bash ~/.openclaw/workspace/projects/onboarding-git-setup/install/version.sh
```

### Optional: register Telegram slash commands during install

```bash
export TELEGRAM_BOT_TOKEN="<your_bot_token>"
export REGISTER_TELEGRAM_COMMANDS=1
bash ~/.openclaw/workspace/projects/onboarding-git-setup/install/install.sh v1.2.0
```

Registered commands (Telegram-compatible):
- `/onboarding`
- `/onboarding_version`
- `/onboarding_update`
- `/onboarding_install`

---

### Later changes (maintainer)

```bash
cd ~/.openclaw/workspace/projects/onboarding-git-setup/bootstrap-repo
git add .
git commit -m "onboarding: update"
git push origin main
```

---

That’s it.
