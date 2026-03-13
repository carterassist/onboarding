# State Mapping (v1)

## Fields
Shared user profile (single setup):
- user_name
- user_timezone
- user_preferences
- user_notes (optional)

For each agent:
- name
- vibe
- emoji
- mission
- do (optional)
- dont (optional)

## Apply destinations

### 0) Shared USER profile (one-time)
Write canonical profile to:
- `shared/USER.md`

Agent-local USER files:
- `agents/<agent-id>/USER.md`
- default content should be a thin pointer to shared profile (unless explicit local override requested)

### 1) Identity fields
Write to:
- `agents/<agent-id>/IDENTITY.md`

Map:
- `Name:` -> Name
- `Emoji:` -> Emoji

### 2) Behavioral fields
Write to:
- `agents/<agent-id>/SOUL.md`

Add/update section:
- `## Operator Profile`
  - Vibe
  - Mission
  - Do
  - Don’t

### 3) Team roster metadata
Write/update:
- `AGENTS.md`

Use for:
- standard + extra agent listing
- short role line for each extra agent

### 4) Onboarding state + backups
State file:
- `memory/onboarding-state.json`

Backup file per apply:
- `memory/onboarding-backups/<YYYYMMDD-HHMMSS>.json`

## Idempotent reapply behavior
- Build a desired-state object from the current wizard run.
- Compare with current onboarding-state.
- Backup old onboarding-state.
- Replace onboarding-managed fields with desired-state.
- Reapply to files.
- Mark removed onboarding-managed agents as `inactive` by default.
- Hard delete only on explicit `confirm hard delete`.
