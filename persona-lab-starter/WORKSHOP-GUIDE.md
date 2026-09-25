# Persona Lab workshop guide

Create your project in Step 0. For each implementation task, send the **Create the issue** and **Work on the issue** prompts one at a time in the same Codex task. Codex can use the issue it just created; you do not need to paste its URL into the follow-up prompt. Use your new workshop repository for every issue and PR.

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

Modernize the existing landing page's presentation while keeping its workshop placeholders. You'll practice describing a focused visual change in a GitHub issue, then asking one Codex task to implement it and show you the result in a PR. Task 3 replaces the placeholders with the supplied company story.

### 1. Preview your new project

In the `persona-lab` repository you created in Step 0, ask Codex to show you the starter before changing it. Copy this into Codex:

```text
In my new persona-lab repository, start a preview in the sandbox following
the repository's preview instructions. Check that the connected paper mock
loads, then give me its browser-accessible URL. Keep the preview running
while I review.
```

Open `/` on the preview URL to click through the Landing, Workspace, and Results paper sketches.

Task 1 uses the sketch as a layout reference. The prepared logo, portraits, client stories, and supporters are for Task 3.

### 2. Create the issue

```text
Create a GitHub issue called "Modernize the Persona Lab landing page".
The starter is deliberately rough. I want to modernize its visual design,
while leaving the workshop content placeholders for later issues.

- Use public/workshop/mock/landing.png as the rough layout reference.
- Improve only the landing page's layout, typography, spacing, visual
  hierarchy, and button and focus states. Make it work on desktop and mobile.
- Keep the existing landing-page sections and placeholder content. Retain
  labels such as BRAND_NAME, TAGLINE_GOES_HERE, client and team placeholders,
  supporter placeholders, and COMPANY_INFO_GOES_HERE. If turning the sketch
  into HTML, carry these placeholders into the new page.
- Do not add the prepared Persona Lab logo, animal portraits, client stories,
  team members, supporter logos, or final company copy. Those are for Task 3.
- Do not add new sections, screens, product features, or simulation behavior.
  Keep the Landing → Workspace → Results links working and leave Workspace
  and Results for later exercises.
- Keep any simulated-persona/not-human-research disclosure visible.
- Use the frontend skill to implement and check this visual change.

Just create the issue for now and send me the link.
```

### 3. Work on the issue

```text
Work on the issue you just created above in this Codex task. Modernize only
the existing landing page's visual design; preserve its placeholders and the connected paper mock
journey. Use the frontend skill, check it in the browser on desktop and mobile,
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
Work on the issue you just created above in this Codex task, without subagents.
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

The content and assets are already prepared. This task fills in the brand,
clients, team, and supporters left as placeholders in Task 1.

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

Send this follow-up in the same coordinating Codex task that created the parent issue and sub-issues:

```text
Work on the three sub-issues you just created under the parent issue above.

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
Work on the issue you just created above using two subagents:

- One to review mobile layout and visual consistency.
- One to review accessibility.

Have them inspect the site in the browser and report what they find
without editing files.

Then make the fixes yourself and verify them in the browser.

Open a PR linked to the issue and leave it open for review.
```

This exercise uses one Codex task and one GitHub Issue. The task delegates the two reviews to subagents, brings their findings together, and produces one PR.
