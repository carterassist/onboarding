# Telegram Callback Flow (v1.1.0)

Use callback state for all multiple-choice onboarding steps.

## State file

`/home/clawdbot/.openclaw/workspace/memory/onboarding-state.json`

Minimum shape:

```json
{
  "version": "1.1.0",
  "session": "telegram:<chat_id>",
  "step": "scope",
  "updatedAt": "ISO-8601"
}
```

## UX rule (mandatory)

On every callback button tap:
1. Immediately send acknowledgement as a standalone short message.
   - Format: `<Step name>: <choice> selected ✅ Preparing next step...`
   - Example: `Setup scope: New setup selected ✅ Preparing next step...`
2. Then send the next step card in a separate message.
3. Never leave button taps without immediate feedback.
4. Do not combine acknowledgement + next card in one message.

## Callback keys

- `onboarding:new_setup`
- `onboarding:rerun_replace`
- `onboarding:cancel`
- `onboarding:roster_default`
- `onboarding:roster_custom`
- `onboarding:extras_none`
- `onboarding:extras_add`
- `onboarding:vibes_default`
- `onboarding:vibes_custom`
- `onboarding:missions_default`
- `onboarding:missions_custom`
- `onboarding:review_apply`
- `onboarding:review_edit`

## Recommended Telegram button labels (friendly)

Step 1 (scope):
- `🆕 New setup`
- `♻️ Re-run and replace`
- `🛑 Cancel setup`

Step 2 (roster):
- `🚀 Use default roster`
- `🧱 Build custom roster`
- `🛑 Cancel setup`

## Button policy

- Use Telegram buttons for all 1/2/3 style choices.
- Use text input only for open-ended fields (USER profile, per-agent details).
- Keep button labels neutral (no bright/vibrant styles).

## Mandatory button coverage by step

Buttons required:
- Step 1: scope (`new_setup`, `rerun_replace`, `cancel`)
- Step 2: roster (`roster_default`, `roster_custom`, `cancel`)
- Step 3: extras (`extras_none`, `extras_add`, `cancel`)
- Step 5: vibe mode (`vibes_default`, `vibes_custom`, `cancel`)
- Step 7: mission mode (`missions_default`, `missions_custom`, `cancel`)
- Step 11: review action (`review_apply`, `review_edit`, `cancel`)

If any of the above is sent without buttons, immediately re-send that same step with buttons.
