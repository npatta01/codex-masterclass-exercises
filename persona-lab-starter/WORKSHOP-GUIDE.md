# Persona Lab workshop guide

Each exercise has two prompts: **1. Create the issue** and **2. Work on the issue**. Send them one at a time. After the first prompt returns an issue URL, use it in place of `<ISSUE_URL>` in the second prompt. Use your new workshop repository for every issue and PR.

## Start with the paper mock and prepared assets

After Codex creates your workshop repository in Step 0, ask it to start a preview in your sandbox and send you the browser-accessible URL. Codex handles setup and the development server. Open these paths on that preview URL:

- `/` (or `/workshop/mock/index.html`) — connected Landing, Workspace, and Results sketches.
- `/workshop/index.html` — the new Persona Lab logo, character portraits, fictional client and supporter logos, and customer stories.

All files are included under `public/workshop/`. Read
`public/workshop/ASSETS.md` for the asset map and
`public/workshop/content.json` for the supplied copy. The sketches are layout
references; their older placeholder names are superseded by this content file.
You do not need to upload assets, invent a byline, or use an image service.
Choose your own website palette and typography. Keep the starter rough until
you begin the design exercise.

Copy this into Codex when you are ready to preview:

```text
Start a preview of my Persona Lab starter in the sandbox, following the
repository's preview instructions. Check that the paper mock loads, then give
me browser-accessible URLs for it and the prepared asset page. Keep the preview
running while I review.
```

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
- Focus on the landing page, using public/workshop/mock/landing.png as
  the rough layout reference. Leave the other screens for later exercises.
- Use the supplied Persona Lab logo, tagline, team, fictional client stories,
  and supporters from public/workshop/content.json. All referenced assets
  are inside public/workshop/. Do not ask me to supply assets or a byline.
- Include the female fox CEO, Codex CTO, and dog product lead.
- Put the supplied animal portraits alongside the customer testimonials,
  with the label "Fictional customers. Wildly fictional results."
- Make the page work well on desktop and mobile.
- Preserve the connected Landing, Workspace, and Results journey. The paper mock has no live simulation.
- Use the frontend skill.
- Keep this a self-contained demo: no real model API, browser automation, sign-in,
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
- Add a short README section explaining sandbox preview and the deployed
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

The content and assets are already prepared. This is an alternative way to
divide the landing-page work from Task 1, not a requirement to redo it.
If the landing page is already finished, use the Workspace and Results
practice exercise below instead.

### 1. Create the issue

```text
I'd like to replace the landing page placeholders with a playful
fictional company. Create a parent GitHub issue called
"Personalize the Persona Lab company story" and three linked sub-issues so we
can
work on them separately. Keep the connected paper prototype and research
disclosure intact.

Here's what I'd like in each sub-issue:

1. Create a brand identity
   - Use the Persona Lab name, logo, and tagline supplied in
     public/workshop/content.json and public/workshop/logos/persona-lab.svg.
   - Choose a simple color palette.
   - Keep the design intentionally appropriate for a workshop prototype.

2. Add fictional clients and teammates

   - Use Acorn Commerce, Pawprint, Slow & Steady, and Tall Order.
     Their logos, animal portraits, and absurd Persona Lab success stories
     are supplied in public/workshop/content.json.

   - Replace the teammate placeholders with this fictional team:
     - Felix Pivot — CEO & cofounder (female fox)
     - Codex McCompile — CTO & cofounder (Codex robot)
     - Barkley Clicks — Head of Product (dog)

   - Use the supplied files in public/workshop/characters/ and logos/.
     No new images, uploads, or image-service calls are needed.
   - Add useful alt text and fixed image dimensions.
   - Keep "Fictional customers. Wildly fictional results." beside the quotes.
   - Preserve the existing section structure.

3. Add fictional supporters and company footer

   - Replace the supporter placeholders with `Placeholder Partners`, `Venture
     Maybe`, and `The Hypothesis Fund`.
   - Replace `COMPANY_INFO_GOES_HERE` with: `Persona Lab · Somewhere on the
     Internet · Built with synthetic personas and suspiciously confident
     hypotheses.`
   - Use the prepared supporter SVGs in public/workshop/logos/.
     Add useful alt text and fixed image dimensions.
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

### Practice: create the Workspace and Results tasks yourself

Try the same workflow with two larger pieces of the site. Create one issue
for the Workspace overview and one for Example results, using
`public/workshop/mock/workspace.png` and `results.png` as the references.
Keep the sample data bundled and label results as simulated hypotheses.

Start a separate Codex task for each issue. Give both tasks the theme from
your landing page, the prepared asset folder, and their own worktree.
Ask each to own its page and avoid changing shared navigation
or global styles without coordinating. Review their PRs together and
check the Landing → Workspace → Results → Workspace journey.

You write the issue-creation and follow-up prompts this time. No backend,
live persona execution, or real research is required.

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
focused on the UI; keep results clearly labeled as synthetic examples.

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
