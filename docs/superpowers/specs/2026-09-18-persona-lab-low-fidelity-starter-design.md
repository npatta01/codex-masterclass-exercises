# Persona Lab Low-Fidelity Starter Design

## Goal

Replace the current single-workbench Persona Lab starter with a connected, low-fidelity product prototype that gives workshop participants a meaningful product to improve. The starter remains local, deterministic, fake-data-only, and intentionally visually unfinished.

## Product model

Persona Lab is used by one company to test pages and flows within its own platform. The company does not manage unrelated target domains. A project contains a page map, editable simulated personas, tasks, deterministic journey runs, evidence-linked findings, and neutral-baseline comparisons.

The prototype presents simulated-persona hypotheses, not validated human research. It must distinguish:

- observed product or site friction;
- a blocked or failed browser/test session;
- an unsupported inference.

## Experience architecture

The React application uses one persistent shell and client-side view state. No router, backend, authentication, model API, browser automation, payment flow, external data, or deployment configuration is added.

The connected screens are:

1. Public landing page with an explanation, simple workflow, disclosure, and entry CTA.
2. Project overview for one fictional company platform and its internal page map.
3. Persona library with several fake personas and a create/edit action.
4. Persona editor for context, goals, constraints, and preferences.
5. Flow-task builder for a named task and success condition.
6. New simulation setup combining persona, task, and platform pages.
7. Simulation in progress with deterministic staged progress.
8. Journey evidence with outcome, timestamped actions, pages, screenshot placeholders, and concise simulated reactions.
9. Friction findings with evidence references and confidence/status labels.
10. Persona-versus-neutral-baseline comparison.
11. Project settings with the platform URL and editable page map represented as local form controls.

Primary navigation connects Overview, Personas, Tasks, Runs, and Settings. Contextual buttons move through the creation and review sequence. Browser refresh may reset the fake state.

## Visual direction

Use an intentionally rough grayscale wireframe language:

- off-white canvas, charcoal text, gray borders, and one restrained blue interaction color;
- system or monospace typography;
- square cards, dashed screenshot placeholders, handwritten-style annotations implemented with rotated labels rather than image assets;
- visible screen labels and incomplete-looking placeholder regions that invite participant redesign;
- responsive stacking at narrow widths without turning the starter into a polished final product.

The low fidelity is deliberate, but the hierarchy, keyboard focus, landmarks, form labels, and mobile layout must remain usable.

## State and data

All content is stored as static JavaScript fixtures. React state tracks the current screen, selected persona, editable task text, selected platform pages, run status, and editor form values.

Invoking a simulation advances through deterministic local progress states and then reveals a fixed evidence set. No claim should imply the run actually visited the fictional platform.

## Workshop boundaries

The starter should provide enough product structure for participants to practice frontend improvement, GitHub issue planning, parallel changes, CI/CD setup, and focused interaction work. It must not pre-complete those exercises:

- no polished brand system;
- no team or investors/supporters sections;
- no GitHub Pages workflow;
- no production integrations;
- no real accounts or sensitive data.

The existing `WORKSHOP-GUIDE.md` should be revised only where its description of the starter is no longer accurate. Its four-task teaching sequence remains intact.

## File structure

- `src/data.js`: fake platform, page, persona, task, run, evidence, and finding fixtures.
- `src/App.jsx`: application shell, navigation, view orchestration, and deterministic workflow state.
- `src/components/`: focused screen and shared UI components.
- `src/styles.css`: wireframe design system and responsive behavior.
- `tests/starter.test.mjs`: source-level structural and boundary checks.
- `README.md`: accurate starter description and local commands.
- `WORKSHOP-GUIDE.md`: participant prompts aligned with the expanded baseline.

## Verification

- Run `npm test` in `persona-lab-starter`.
- Run `npm run build` in `persona-lab-starter`.
- Inspect the connected flow in a real browser at desktop and 390px mobile widths.
- Verify keyboard-visible focus, labeled form controls, navigation between every screen, deterministic running/completed behavior, and the research disclosure.
- Confirm no GitHub Pages workflow or external integration was added.

## Publishing boundary

Implementation stays on the local `codex/persona-lab-low-fi-starter` branch until the user reviews the rendered replacement and explicitly approves pushing or publishing it.
