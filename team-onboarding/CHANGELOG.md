# CHANGELOG

## 2026-03-12 — v1.1.0
- Added shared USER profile step (single setup) before per-agent configuration.
- Defined canonical USER write target as `shared/USER.md` with agent-local `USER.md` pointer model.
- Added onboarding guidance samples for USER step and "What this means" explanatory lines for wizard steps.
- Updated step numbering/content to include shared USER in review and confirmation flow.
- Added Telegram callback flow reference with mandatory immediate standalone selection acknowledgement and button-first multi-choice policy.
- Enforced separate acknowledgement message before each next-step card after button taps.
- Enforced Telegram inline buttons for all multiple-choice steps, including continue/cancel gates.
- Expanded per-agent step guidance with clearer field semantics and richer sample responses.
- Expanded extra-agent guidance with specialist-focused explanation and concrete sample.
- Upgraded wizard templates with bold section structure, save-path hints, and clearer long-form explanations.
- Added step-5 current-vibe display placeholders and step-6 default-mission matrix + mission-mode explanation.
- Converted typed reply formats to code blocks for easier copy/paste.
- Improved review-step layout with clearer shared-profile vs per-agent profile blocks.
- Simplified Shared USER fields to global identity metadata only; moved behavior-heavy response rules to per-agent `SOUL.md` guidance.
- Corrected Step 1 save-path messaging to be step-scoped only (state write only, no config-file writes before final confirmation).
- Simplified Shared USER schema: removed duplicate call-name field, made `Name` canonical, and expanded optional global metadata fields (locale, non-negotiables).
- Clarified Shared USER guidance: constraints/notes can be long-form and explicit when needed.
- Updated wording-quality rule to explicit plain language: avoid very small/clipped sentences on important steps; be clear and descriptive so agent behavior improves.
- Removed separate mission-mode selection step; mission values are now set directly during per-agent configuration.
- Updated per-agent tips: removed show/edit phrasing and added explicit clarity guidance (avoid very small sentences; be clear and descriptive).
- Standardized tip formatting to explicit phrasing style: `This file is being saved in:` / `This file is being read from:`.

## 2026-03-09 — v1.0.0
- Initial release.
- Adds a multi-message Telegram onboarding wizard for team agent setup.
- Includes manifest-first behavior, standard+extra agent setup, per-agent identity/vibe/mission prompts, and reapply semantics.
- Defines idempotent re-run behavior (replace onboarding-managed settings, backup, reapply).
