# Persona Lab workshop guide

Each exercise has two prompts: **1. Create the issue** and **2. Work on the issue**. Send them one at a time. After the first prompt returns an issue URL, use it in place of `<ISSUE_URL>` in the second prompt. Use your new workshop repository for every issue and PR.

## Step 0 — Create your project

Start with your own copy of the workshop app. This gives you a repository where you can create issues, review PRs, and publish the finished site.

Copy this into Codex:

```text
Take a look at this starter folder:

https://github.com/npatta01/codex-masterclass-exercises/tree/main/persona-lab-starter

Create a new public GitHub repository in my namespace using this folder as the
starting point. Name it persona-lab.

If persona-lab already exists in my namespace, it's fine to delete that
repository and recreate it from this starter. Check the exact owner and
repository name first, and only replace that repository. I understand this
removes its existing code, issues, and pull requests.

Do not change the application yet. Return the repository URL when finished.
```

## Task 1 — Improve the frontend

Turn the rough starter into a more polished website. You'll practice describing a visual change in a GitHub issue, then asking one Codex task to implement it and show you the result in a PR.

### 1. Create the issue

```text
Create a GitHub issue called "Improve the Persona Lab frontend".
The starter is deliberately rough. I'd like it to feel like a clearer,
more polished product, with a consistent theme.

- Improve layout, typography, spacing, button states, and visual hierarchy.
- Redesign the persona cards so the selected persona is obvious.
- Improve the task input, journey view, synthetic rationale, and friction
  finding.
- Make the page work well on desktop and mobile.
- Preserve the existing connected screens and local simulation behavior.
- Use the frontend skill.
- Keep this a local demo: no real model API, browser automation, sign-in,
  payment flow, or external data.
- Keep the disclosure that this is a simulated-persona hypothesis, not human
  research.

Just create the issue for now and send me the link.
```

### 2. Work on the issue

```text
Work on <ISSUE_URL> in this Codex task. Use the frontend skill to
improve the design, check it in the browser on desktop and mobile,
and open a PR linked to the issue. Leave the PR open for review.
```

## Task 2 — Deploy with GitHub Pages

Take one issue from implementation to a live website in a single Codex task. You'll review and merge the deployment PR, then ask Codex to check the published site.

### 1. Create the issue

```text
Create a GitHub issue called "Deploy Persona Lab with GitHub Pages".
I'd like the site to deploy automatically whenever changes land on main.

- Add a GitHub Actions workflow that runs when changes are pushed to main.
- Install dependencies and build the Vite application.
- Deploy the generated static site to GitHub Pages.
- Configure Vite so assets work under the repository name.
- Add a short README section explaining local development and the deployed
  site.

Just create the issue for now and send me the link.
```

### 2. Work on the issue

```text
Work on <ISSUE_URL> in this Codex task, without subagents.
Set up the GitHub Pages workflow, check that the production build
and repository asset paths work, and open a PR linked to the issue.
Leave it open for review.
```

After reviewing and merging the PR, send:

```text
The PR is merged. Check the deployment and open the live site.
Verify that the page and its assets load, then send me the URL.
```

## Task 3 — Create and implement parallel issues

Give the fictional company a brand, clients, team, and supporters. You'll split the work into three GitHub issues and use separate Codex tasks, each with its own worktree and PR. Your original task coordinates their progress and passes the brand decisions to the other tasks.

### 1. Create the issue

```text
I'd like to replace the landing page placeholders with a playful
fictional company. Create a parent GitHub issue called
"Personalize the Persona Lab company story" and three linked sub-issues so we
can
work on them separately. Keep the existing demo behavior and research
disclosure intact.

Here's what I'd like in each sub-issue:

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

   - Generate a deterministic illustrated portrait for each teammate with the
     DiceBear HTTP API. Use the teammate's full name as the `seed`, the
     `lorelei` style, and SVG output. For example:
     `https://api.dicebear.com/10.x/lorelei/svg?seed=Paige%20Turner&size=160`.
   - Download the generated SVGs into the project rather than hotlinking them
     at runtime. Add useful alt text and fixed image dimensions.
   - Add fictional client logo marks with DiceBear's `initials` or `shapes`
     style, using each client name as the seed. Save the SVGs locally too.
   - Preserve the existing section structure.

3. Add fictional supporters and company footer

   - Replace the supporter placeholders with `Placeholder Partners`, `Venture
     Maybe`, and `The Hypothesis Fund`.
   - Replace `COMPANY_INFO_GOES_HERE` with: `Pathlight Labs · Somewhere on the
     Internet · Built with synthetic personas and suspiciously confident
     hypotheses.`
   - Generate simple synthetic logo marks for supporters with DiceBear's
     `initials` or `shapes` style, using each organization name as the seed.
     For example:
     `https://api.dicebear.com/10.x/shapes/svg?seed=Placeholder%20Partners&size=96`.
   - Download the generated SVGs into the project, label them as fictional
     placeholder artwork, and add useful alt text and fixed image dimensions.
   - Do not imply real endorsements or investment.

Write these as clear, readable issues with a short checklist for each.
Just create and link the issues for now, and send me all four URLs.
```

### 2. Work on the issue

Use the parent issue URL for `<ISSUE_URL>`. Send this in the coordinating Codex task:

```text
Work on the three sub-issues linked from <ISSUE_URL>.

Create a separate Codex task and worktree for each one, named
Brand identity, Clients and team, and Supporters and footer.

Give each task its issue URL and ask it to implement that issue,
check the result in the browser, and open its own linked PR.

Coordinate them from this task:

- Ask Brand identity to report its chosen name, tagline, and palette
  early in its own task.
- Read that update and send those decisions to Clients and team
  and Supporters and footer using task messages.
- Read their replies and resolve any conflicting assumptions.
- Include a commit or PR link when they need actual code changes.

When they're finished, review the three PRs for overlapping changes
and tell me the recommended merge order.

Leave the PRs open for review.
```

The separate tasks don't need to message one another directly. In the Codex desktop app, the coordinating task can read their updates and send follow-up messages. Sharing a decision does not transfer code between worktrees; code changes still need to be integrated through Git. If task messaging isn't available in your environment, copy the brand update into each task yourself.

## Task 4 — Review the UI with subagents

After improving the frontend, give it a mobile and accessibility review. You'll use one Codex task with two subagents to investigate different parts of the UI. The main agent brings their findings together, makes the fixes, and opens one PR.

### 1. Create the issue

```text
Create a GitHub issue called "Make the site work better on mobile and easier
to use".

The site needs a quick usability pass. On smaller screens, check for anything
that overflows, feels cramped, or is hard to tap. Also check that text is
readable, form fields have clear labels, and you can navigate with a keyboard
and see what's focused.

Fix the problems you find and check the result in the browser. Keep this
focused on the UI; leave the persona and simulation behavior as it is.

Just create the issue for now and send me the link.
```

### 2. Work on the issue

Send this follow-up in the same Codex task:

```text
Work on <ISSUE_URL> using two subagents:

- One to review mobile layout and visual consistency.
- One to review accessibility.

Have them inspect the site in the browser and report what they find
without editing files.

Then make the fixes yourself and verify them in the browser.

Open a PR linked to the issue and leave it open for review.
```

This exercise uses one Codex task and one GitHub Issue. The task delegates the two reviews to subagents, brings their findings together, and produces one PR.
