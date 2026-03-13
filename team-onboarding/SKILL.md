---
name: team-onboarding
description: v1.1.0 — Run a step-by-step Multi-Agent Team Setup wizard in Telegram. Use when a user asks to set up or reconfigure agent names, vibes, emojis, missions, shared USER profile (single setup for all agents), and agent roster (standard + optional extras), or asks to re-run onboarding with replace-and-reapply behavior.
---

# team-onboarding
Version: v1.1.0

Run this skill only on explicit onboarding intent (e.g., `setup agents`, `run onboarding`, `reconfigure agent team`).

## Required behavior

1. **Manifest-first**
   - Read deployment manifest before onboarding:
     - `/storage/system/architecture/deployment-manifest.json`
   - Use pinned architecture/version context in onboarding snapshot message.

2. **Wizard mode (multi-message only)**
   - Send one section per message.
   - Never dump the full onboarding in one response.

3. **Telegram button policy (mandatory for multiple choice)**
   - If channel is Telegram, every multiple-choice step must be sent with Telegram inline buttons.
   - Do not ask users to type `1/2/3` when buttons are available.
   - This includes all continue/cancel gates and review action steps.
   - Keep typed fallback text only as a secondary backup in case button rendering/callbacks fail.
   - Open-text steps (shared USER profile and per-agent fields) must remain free-text.

4. **Team structure awareness**
   - Start from standard 5 agents:
     - main
     - developer-agent
     - research-agent
     - writer-agent
     - test-agent
   - Ask if user wants to add extra agents.
   - Include extras in subsequent per-agent setup steps.

5. **Shared USER capture (single setup, once for all agents)**
   - Before per-agent steps, collect shared user profile once.
   - Keep shared USER focused on global identity/context metadata (name, timezone, locale/language, optional global notes/constraints).
   - Allow long-form entries for global constraints and important notes when the user needs detailed context.
   - Do not duplicate `Name` and `What should agents call you` as separate fields.
   - Put behavior-heavy communication rules in per-agent SOUL profiles to avoid duplication.
   - Write canonical shared profile to shared file (see apply targets).

6. **Per-agent capture fields**
   For each agent collect:
   - Name
   - Vibe
   - Emoji
   - Mission
   - Do (optional)
   - Don’t (optional)

7. **Examples/guidance (mandatory)**
   - For every wizard step, include a clear "What this means" section.
   - In step 5 (vibes), show both default vibes and current active vibes per agent.
   - Do not run a separate mission-mode choice step; set/confirm missions directly in per-agent configuration cards.
   - In every per-agent step, explain how Name/Vibe/Emoji/Mission/Do/Don't affect behavior.
   - Include a richer sample reply in every per-agent step (at least one concrete Do and one concrete Don’t).
   - Do not reuse the user’s current agent names/vibes in generic examples.
   - For open-text reply formats, render templates in code blocks for easier copy.
   - For USER step, include sample values and reply template.

8. **Formatting and clarity standards (mandatory)**
   - Use bold headers and bold subheaders in wizard cards.
   - For each step, include a short `Tip:` block with explicit path wording (for example: `This file is being saved in: <path>`).
   - Keep explanations explicit; avoid vague one-liners.
   - Don’t use very small or clipped sentences on important steps.
   - Be clear and descriptive: the better the instruction, the better the agent behavior.

9. **Re-run semantics (idempotent)**
   - If onboarding is run again, replace previously onboarding-managed settings and reapply.
   - Backup previous onboarding state before apply.
   - For removed agents: default to inactive (do not hard-delete unless user explicitly confirms hard delete).

10. **Editability reminder**
   - In per-agent steps and final message, remind user they can always update any field later via main agent.

## Wizard message sequence

Use message templates in:
- `references/wizard-messages.md`

Use storage/apply mapping in:
- `references/state-mapping.md`

## Apply targets

Primary write targets:
- `/home/clawdbot/.openclaw/workspace/shared/USER.md` (shared user profile; one-time onboarding source for all agents)
- `/home/clawdbot/.openclaw/workspace/agents/<agent-id>/USER.md` (thin pointer to shared USER by default)
- `/home/clawdbot/.openclaw/workspace/agents/<agent-id>/IDENTITY.md` (name/emoji)
- `/home/clawdbot/.openclaw/workspace/agents/<agent-id>/SOUL.md` (vibe/mission/do/don’t section)
- `/home/clawdbot/.openclaw/workspace/AGENTS.md` (agent roster/role list updates when extras are added)

State/backup files:
- `/home/clawdbot/.openclaw/workspace/memory/onboarding-state.json`
- `/home/clawdbot/.openclaw/workspace/memory/onboarding-backups/<timestamp>.json`

## Confirmation gate (required)

Before applying changes, send:
- a full review summary
- replace/reapply warning
- explicit prompt: `confirm apply` or `cancel`

Apply only on explicit confirmation.
