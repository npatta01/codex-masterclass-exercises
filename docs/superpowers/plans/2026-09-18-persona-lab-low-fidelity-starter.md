# Persona Lab Low-Fidelity Starter Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the one-screen Persona Lab demo with a connected, responsive low-fidelity prototype covering the full simulated-research workflow.

**Architecture:** Keep the existing Vite/React app and use client-side view state rather than a routing dependency. Static fixtures live separately from focused screen components; `App.jsx` owns navigation and the deterministic run transition.

**Tech Stack:** React, Vite, CSS, Node test runner

**Spec:** `docs/superpowers/specs/2026-09-18-persona-lab-low-fidelity-starter-design.md`

## Global Constraints

- One fictional company platform with multiple internal pages and flows.
- Fake data and deterministic local behavior only.
- No backend, model API, browser automation, authentication, payment, external data, deployment, or GitHub Pages workflow.
- Label outputs as simulated-persona hypotheses, not validated human research.
- Keep the design intentionally low fidelity and responsive.

---

### Task 1: Define the expanded starter contract

**Files:**
- Modify: `persona-lab-starter/tests/starter.test.mjs`
- Create: `persona-lab-starter/src/data.js`

**Interfaces:**
- Produces: exported `platform`, `personas`, `tasks`, `journey`, `findings`, and `comparison` fixtures.
- Consumes: existing Node source-inspection test pattern.

- [ ] Add failing tests for all required screen labels, fixture exports, research disclosures, one-platform language, and absence of a Pages workflow.
- [ ] Run `npm test` in `persona-lab-starter` and confirm the new assertions fail because the expanded screens and fixtures do not exist.
- [ ] Add the minimal static fixture module with the named exports.
- [ ] Run the tests and confirm fixture assertions pass while screen assertions remain red.
- [ ] Commit the contract and fixtures.

### Task 2: Build the connected application shell and screens

**Files:**
- Modify: `persona-lab-starter/src/App.jsx`
- Create: `persona-lab-starter/src/components/Chrome.jsx`
- Create: `persona-lab-starter/src/components/Screens.jsx`

**Interfaces:**
- Consumes: fixtures exported by `src/data.js`.
- Produces: navigation targets `landing`, `overview`, `personas`, `editor`, `tasks`, `setup`, `running`, `evidence`, `findings`, `compare`, and `settings`.

- [ ] Implement `Chrome` with responsive primary navigation and a persistent research disclosure.
- [ ] Implement semantic screen components for the eleven views described in the spec.
- [ ] Implement `App` view orchestration, selected-persona/task state, editor state, page selection, and deterministic running/completed transition.
- [ ] Run `npm test` and confirm every structural/content assertion passes.
- [ ] Commit the connected experience.

### Task 3: Apply the responsive wireframe design system

**Files:**
- Modify: `persona-lab-starter/src/styles.css`

**Interfaces:**
- Consumes: class names rendered by `App.jsx`, `Chrome.jsx`, and `Screens.jsx`.
- Produces: desktop shell, 390px stacked layout, visible focus, loading state, evidence timeline, comparison layout, and print-safe static styling.

- [ ] Add the grayscale wireframe tokens, typography, buttons, cards, forms, page map, timeline, screenshot placeholders, status labels, comparison, and responsive rules.
- [ ] Run `npm test` and `npm run build`.
- [ ] Inspect the app at desktop and 390px widths and correct overflow, focus, or readability issues.
- [ ] Commit the visual system.

### Task 4: Align participant documentation and perform final verification

**Files:**
- Modify: `persona-lab-starter/README.md`
- Modify: `persona-lab-starter/WORKSHOP-GUIDE.md`

**Interfaces:**
- Consumes: the finished starter behavior and existing four-task workshop sequence.
- Produces: accurate setup, boundaries, and participant prompts that improve rather than recreate the product architecture.

- [ ] Update README wording to describe the expanded low-fidelity baseline.
- [ ] Update workshop prompts where they incorrectly describe a one-screen starter, preserving the issue-first teaching flow.
- [ ] Run `npm test` and `npm run build`.
- [ ] Verify every navigation target and the invoke-running-completed sequence in a real browser at desktop and mobile widths.
- [ ] Confirm the console has no application errors and no deployment workflow or external integration was added.
- [ ] Commit documentation and verification changes.
