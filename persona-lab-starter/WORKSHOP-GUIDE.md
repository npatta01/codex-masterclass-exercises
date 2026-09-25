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

Title: Personalize the Persona Lab company story

Body:

Turn the deliberately generic starter into one coherent fictional company and product story. Keep the simulation workspace and simulated-research disclosure intact.

Create and link these independent sub-issues:

1. Create a brand identity
   - Replace `BRAND_NAME` and `TAGLINE_GOES_HERE`.
   - Choose a simple color palette.
   - Keep the design intentionally appropriate for a workshop prototype.
2. Add fictional clients and teammates
   - Replace the client placeholders with these fictional companies:
     - `CLIENT_NAME_1`: Cart Blanche
     - `CLIENT_NAME_2`: Scroll Patrol
     - `CLIENT_NAME_3`: Button Mash & Co.
     - `CLIENT_NAME_4`: The Loading Company
   - Replace the teammate placeholders with this fictional team:
     - `TEAM_MEMBER_1`: Paige Turner — Product Research
     - `TEAM_MEMBER_2`: Casey Clicks — Simulation Systems
     - `TEAM_MEMBER_3`: Drew Mockup — Product Design
   - Generate a deterministic illustrated portrait for each teammate with the DiceBear HTTP API. Use the teammate's full name as the `seed`, the `lorelei` style, and SVG output. For example: `https://api.dicebear.com/10.x/lorelei/svg?seed=Paige%20Turner&size=160`.
   - Download the generated SVGs into the project rather than hotlinking them at runtime. Add useful alt text and fixed image dimensions.
   - Preserve the existing section structure.
3. Add fictional supporters and company footer
   - Replace the supporter placeholders with `Placeholder Partners`, `Venture Maybe`, and `The Hypothesis Fund`.
   - Replace `COMPANY_INFO_GOES_HERE` with: `Pathlight Labs · Somewhere on the Internet · Built with synthetic personas and suspiciously confident hypotheses.`
   - Generate simple synthetic logo marks for clients and supporters with DiceBear's `initials` or `shapes` style, using each organization name as the seed. For example: `https://api.dicebear.com/10.x/shapes/svg?seed=Cart%20Blanche&size=96`.
   - Download the generated SVGs into the project, label them as fictional placeholder artwork, and add useful alt text and fixed image dimensions.
   - Do not imply real endorsements or investment.
```

Then create the three linked sub-issues, using fictional names only for teammates, organizations, investors, endorsements, and supporters.

After the issues exist, open a separate Codex task/thread for each sub-issue. Give each task only its matching issue and ask it to implement only that work. Run the tasks in parallel when their file changes do not overlap. Finally, review the combined result, resolve conflicts, test the app, inspect it in a browser, then commit and push.

## Task 4 — Review the UI with subagents

After improving the frontend, create the issue first:

```text
Create this GitHub Issue. Do not implement it yet.

Title: Make the site work better on mobile and easier to use

Body:

The site needs a quick usability pass. On smaller screens, check for anything that overflows, feels cramped, or is hard to tap. Also check that text is readable, form fields have clear labels, and you can navigate with a keyboard and see what's focused.

Fix the problems you find and check the result in the browser. Keep this focused on the UI; leave the persona and simulation behavior as it is.
```

Once the issue exists, replace `<ISSUE_URL>` below with its URL and send this follow-up in the same Codex task:

```text
Work on <ISSUE_URL> using two subagents—one to review mobile layout and visual consistency, and another to review accessibility. Have them inspect the site in the browser and report what they find without editing files. Then make the fixes yourself, verify them in the browser, and open a PR linked to the issue.
```

This exercise uses one Codex task and one GitHub Issue. The task delegates the two reviews to subagents, brings their findings together, and produces one PR.
