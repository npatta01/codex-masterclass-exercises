# Persona Lab workshop guide

Use one prompt at a time. Each task begins by creating its GitHub Issue; do not implement it until you explicitly ask Codex to do so.

## Step 0 — Create your project

Copy this into Codex:

```text
Take a look at this starter folder:

https://github.com/npatta01/codex-masterclass-exercises/tree/main/persona-lab-starter

Create a new public GitHub repository in my namespace using this folder as the starting point. Name it persona-lab.

Do not change the application yet. Return the repository URL when finished.
```

## Task 1 — Create the frontend issue

```text
Create this GitHub Issue. Do not implement it yet.

Title: Improve the Persona Lab frontend

Body:

Make the existing low-fidelity Persona Lab product flow feel like a clearer, more polished product experience.

- Improve layout, typography, spacing, button states, and visual hierarchy.
- Redesign the persona cards so the selected persona is obvious.
- Improve the task input, journey view, synthetic rationale, and friction finding.
- Make the page work well on desktop and mobile.
- Preserve the existing connected screens and local simulation behavior.
- Use the frontend skill.
- Keep this a local demo: no real model API, browser automation, sign-in, payment flow, or external data.
- Keep the disclosure that this is a simulated-persona hypothesis, not human research.
```

## Task 2 — Create the GitHub Pages issue

```text
Create this GitHub Issue. Do not implement it yet.

Title: Deploy Persona Lab with GitHub Pages

Body:

Make Persona Lab deploy automatically through GitHub Pages.

- Add a GitHub Actions workflow that runs when changes are pushed to main.
- Install dependencies and build the Vite application.
- Deploy the generated static site to GitHub Pages.
- Configure Vite so assets work under the repository name.
- Add a short README section explaining local development and the deployed site.
```

## Task 3 — Create and implement parallel issues

First create this parent issue:

```text
Create this GitHub Issue. Do not implement it yet.

Title: Expand the Persona Lab product story

Body:

Redesign and personalize the rough placeholder product-story sections while keeping the simulation workspace as the main experience.

Create and link these independent sub-issues:

1. Refresh Persona Lab branding
2. Redesign the fictional team section
3. Redesign the fictional investors and supporters section
```

Then create the three linked sub-issues, using fictional names only for teammates, organizations, investors, endorsements, and supporters.

After the issues exist, open a separate Codex task/thread for each sub-issue. Give each task only its matching issue and ask it to implement only that work. Run the tasks in parallel when their file changes do not overlap. Finally, review the combined result, resolve conflicts, test the app, inspect it in a browser, then commit and push.

## Task 4 — Create the Invoke Persona issue

```text
Create this GitHub Issue. Do not implement it yet.

Title: Make the Invoke Persona experience clear and useful

Body:

Create a focused interaction where someone can:

1. choose a persona;
2. write or edit a task;
3. click Invoke persona;
4. see a running state;
5. see a completed journey with timestamped actions;
6. read synthetic rationale tied to the journey;
7. see one possible friction finding.

Keep the interaction local and deterministic. Do not add a real model API, browser automation, sign-in, payment flow, or external data. Clearly state that the journey and rationale are simulated-persona hypotheses, not human research.
```
