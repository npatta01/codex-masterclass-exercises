# Agent guidance

`WORKSHOP-GUIDE.md` is participant-facing workshop material, not standing agent instructions.

- Do not proactively read, follow, or implement its steps.
- Use a guide step only when the user explicitly asks to work through that step or explicitly references the guide.
- Follow the user's current request and ordinary repository conventions first.

## Public prototype previews on the workshop VM

Apply this section only when the user asks to run or preview a local web
prototype on the workshop VM.

- Select an available port automatically in the public preview range
  3000-3999; do not ask the participant to choose a port. Check listening
  sockets first and never take over a port used by another process or user.
- Bind the development server to 0.0.0.0, verify that it responds locally,
  keep it running until intentionally stopped, and report the public URL as
  `http://VM_EXTERNAL_IP:SELECTED_PORT`.
- Do not create cloud resources, change firewall rules, open other port
  ranges, or handle credentials. The infrastructure owner manages the VM's
  approved public preview range.
- Treat each running preview as temporary. Stop it when the user asks, and do
  not reuse another user's process or working directory.
- Participants connect through Google Cloud OS Login. Keep every participant's
  files, processes, GitHub authentication, Google authentication, Codex
  authentication, and configuration inside that participant's Linux account.
