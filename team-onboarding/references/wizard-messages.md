# Wizard Messages (v1.1 friendly)

Use one step per message.

Rules for every step:
- keep it clear and explicit (short is fine, but never vague)
- don’t use very small or clipped sentences on important instructions
- be clear and descriptive: the better the instruction, the better the agent behavior
- explain **What this means** in practical terms
- include an example reply when typed input is expected
- include quick options when possible
- for button taps, send immediate standalone acknowledgement before next step
- acknowledgement must be a separate message before the next card
- on Telegram, every multiple-choice step must include inline buttons (including continue/cancel)
- only use typed fallback if buttons are unavailable or callbacks fail
- use bold headers/subheaders for readability
- include a clear tip block with save/read/write path hints where relevant (for example: `Tip: This file is being saved in: <path>`)

---

## Step 1 — Welcome
**Multi-Agent Team Setup**

**What this step does:**
- choose whether to start fresh or re-apply an existing setup
- define how onboarding will write/update your agent files

**Interaction behavior:**
- when you tap a choice button, you first get a quick confirmation line
- then the next step appears immediately after

**What this means:**
- we’ll set your shared user profile once
- we’ll configure each agent identity (name, vibe, emoji, mission)
- we’ll review everything before applying

**Tip:**

• This file is being saved in: `/home/clawdbot/.openclaw/workspace/memory/onboarding-state.json`

**Preferred (Telegram buttons):**
- 🆕 New setup
- ♻️ Re-run and replace
- 🛑 Cancel setup

**Typed fallback (only if buttons are unavailable):**
1) new setup
2) re-run and replace
3) cancel

**Sample reply (typed fallback):**
`new setup`

---

## Step 2 — System Snapshot (Manifest)
**Step 1/13 — System Snapshot**
I loaded your deployment manifest so onboarding matches your current architecture.

- Masterplan Version: **{version}**
- Update Policy: **{policy}**
- Agent Model: **{model}**

**Tip:**

• This file is being read from: `/storage/system/architecture/deployment-manifest.json`

**Preferred (Telegram buttons):**
- Continue
- Cancel

**Typed fallback (only if buttons are unavailable):**
1) continue
2) cancel

---

## Step 3 — Standard Agent Team
**Step 2/13 — Standard Agent Team**

**What this means:**
- select the base team that handles most work automatically
- this controls which specialists can be delegated tasks by main

**Default roster:**
- main
- developer-agent
- research-agent
- writer-agent
- test-agent

**Tip:**

• This file is being saved in: `AGENTS.md` (roster metadata, if changed)

**Preferred (Telegram buttons):**
- 🚀 Use default roster
- 🧱 Build custom roster
- 🛑 Cancel setup

**Typed fallback (only if buttons are unavailable):**
1) use default roster
2) custom roster: <comma-separated agent ids>
3) cancel

---

## Step 4 — Team Structure (Extras)
**Step 3/13 — Team Structure**

**What this means:**
- decide if you want extra specialist agents
- extras are useful when you want strict ownership for a narrow domain

**Tip:**

• This file is being saved in: `AGENTS.md` + onboarding state

**Preferred (Telegram buttons):**
- No extras
- Add extras
- Cancel

**Typed fallback (only if buttons are unavailable):**
1) no extras
2) add extras: <comma-separated agent ids>
3) cancel

**Example:**
`add extras: design-agent, ops-agent`

---

## Step 5 — Shared USER Setup (one-time)
**Step 4/13 — Shared USER Setup**

**What this means:**
- this profile is shared by all agents, so you only set it once
- `Name` is the single canonical way agents should address you
- behavior-specific communication rules are configured per agent in each `SOUL.md` to avoid duplication
- global constraints and notes can be as detailed and long as you want

**Tip:**

• This file is being saved in: `shared/USER.md` (canonical shared profile)
- You can write long-form constraints, context, and notes here; it does not need to be short.
- If something is critical, write it explicitly as a non-negotiable constraint.

**Reply format:**
```text
- Name: ...
- Timezone: ...
- Preferred language/locale: ... (optional)
- Hard constraints or non-negotiables: ... (optional, can be long-form)
- Anything else important?: ... (optional, can be long-form)
```

**Example:**
```text
- Name: Alex
- Timezone: CET (Europe/Berlin)
- Preferred language/locale: English (NL)
- Hard constraints or non-negotiables: avoid destructive changes without explicit confirmation
- Anything else important?: if urgent, flag it at the top with severity
```

---

## Step 6 — Vibes Guidance
**Step 5/13 — Pick Agent Vibes**

**What this means:**
- vibe controls tone, pacing, and communication style (not permissions)
- this step sets vibe strategy globally (defaults or custom per agent)

**Default vibes by agent:**
- main → Fast Operator
- developer-agent → Sharp Technical
- research-agent → Calm Analyst
- writer-agent → Friendly Teacher
- test-agent → Precise Auditor

**Current vibes from your active setup:**
- main → {current_vibe_main}
- developer-agent → {current_vibe_developer}
- research-agent → {current_vibe_research}
- writer-agent → {current_vibe_writer}
- test-agent → {current_vibe_test}

**Tip:**

• This file is being saved in: `agents/<agent-id>/SOUL.md`

**Preferred (Telegram buttons):**
- Use default vibes
- Custom vibes
- Cancel

**Typed fallback (only if buttons are unavailable):**
1) use defaults
2) custom vibes (per agent)
3) cancel

---

## Step 7 — Per-Agent Template
**Step {n}/13 — Configure Agent: {agent_id}**

**What this means:**
- **Name** = how the agent introduces itself
- **Vibe** = communication style (tone/speed)
- **Emoji** = visual identity marker
- **Mission** = core responsibility in one explicit sentence
- **Do/Don’t** = hard behavior constraints

**Role:** {role_description}

**Tip:**

• This file is being saved in: `agents/{agent_id}/IDENTITY.md` + `agents/{agent_id}/SOUL.md`
- Don’t use very small sentences; be clear and descriptive so the agent behaves better.

**Reply format:**
```text
- Name: ...
- Vibe: ...
- Emoji: ...
- Mission: ... (or `default`)
- Do: ... (optional)
- Don’t: ... (optional)
```

**High-quality sample (generic):**
```text
- Name: Helios
- Vibe: Strategic Operator
- Emoji: 🧠
- Mission: Convert ambiguous requests into clear execution plans, assign ownership, and track progress until closure.
- Do: surface assumptions early, define success criteria, and keep decisions auditable.
- Don’t: proceed on hidden assumptions, leave blockers unreported, or blur ownership boundaries.
```

**Tip:**
- This info is saved in **SOUL.md** and **IDENTITY.md**.
- If you want to change this later, ask main to update the specific agent profile.

---

## Step 9 — Optional Extra Agents (repeat if extras exist)
**Step {n}/13 — Configure Extra Agent: {agent_id}**
Use the same format as Step 8.

**What this means:**
- extra agents should have a narrow mission with clear boundaries
- specialist agents perform best when their scope is explicit

**Tip:**

• This file is being saved in: `agents/{agent_id}/IDENTITY.md` + `agents/{agent_id}/SOUL.md` + `AGENTS.md`

**High-quality sample (extra agent):**
```text
- Name: SentinelOps
- Vibe: Incident Commander
- Emoji: 🚨
- Mission: Monitor platform health, triage incidents by severity, and coordinate recovery with concise status updates.
- Do: provide incident timeline, blast radius, mitigation status, and next checkpoint.
- Don’t: escalate low-signal noise, omit impact assessment, or close incidents without verification.
```

---

## Step 10 — Review
**Step 11/13 — Review Configuration**

**What this means:**
- this is the final quality gate before files are written
- review clarity matters because this snapshot becomes your active defaults

**Tip:**

• These files will be written to: `shared/USER.md`, `agents/*/IDENTITY.md`, `agents/*/SOUL.md`, onboarding state files

**Formatting guidance for review card:**
- Use clear sections with bold subheaders.
- Separate shared profile from agent profiles.
- For each agent, show fields in one compact block.

**Review layout (template):**
```text
**Shared USER Profile**
- Name: {...}
- Call name: {...}
- Timezone: {...}
- Response style: {...}
- Always do: {...}
- Avoid: {...}
- Notes: {...}

**Agent Profiles**
[main]
- Name: {...}
- Vibe: {...}
- Emoji: {...}
- Mission: {...}
- Do: {...}
- Don’t: {...}

[developer-agent]
- Name: {...}
- Vibe: {...}
- Emoji: {...}
- Mission: {...}
- Do: {...}
- Don’t: {...}

...repeat for each configured agent...
```

**Preferred (Telegram buttons):**
- Apply
- Edit field
- Cancel

**Typed fallback (only if buttons are unavailable):**
1) apply
2) edit <field>
3) cancel

---

## Step 11 — Confirm Replace/Reapply
**Step 12/13 — Final Confirmation**

**What this means:**
- onboarding-managed values are replaced and reapplied
- previous onboarding state is backed up before apply

**Tip:**

• These files are written after confirmation: target files + onboarding backup/state

Reply exactly:
`confirm apply`

---

## Step 12 — Apply in Progress
**Applying setup...**
I’m updating:
- shared/USER.md
- agents/*/IDENTITY.md
- agents/*/SOUL.md
- agents/*/USER.md (pointer model)
- AGENTS roster metadata (if needed)

---

## Step 13 — Complete
**Step 13/13 — Setup Complete ✅**
Onboarding is finished.

You can update any field later with single-command edits.
Examples:
- update main emoji to 🧭
- set developer vibe to Calm Analyst
- update shared timezone to UTC
- show me `agents/developer-agent/SOUL.md` and update Mission
