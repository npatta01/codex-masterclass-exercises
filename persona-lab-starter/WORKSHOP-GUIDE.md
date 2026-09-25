# Persona Lab workshop guide

Use one GitHub repository and one Codex project for this exercise. A **Codex project** groups tasks around the checkout on your workshop VM; a **GitHub repository** stores the code, issues, and pull requests. Create them in Task 0. Then use separate Codex tasks for deployment and visual modernization. Within each task, send the issue-creation and implementation prompts one at a time in the same conversation.

- **Task 0:** Create the repository and Codex project; preview the paper mock.
- **Tasks 1 and 2:** Run GitHub Pages/CI and landing-page modernization in parallel Codex tasks.
- **Task 3:** Fill in the fictional company placeholders.
- **Task 4:** Review mobile usability and accessibility.

## Task 0 — Create your project and preview the paper mock

### 1. Create your GitHub repository

Start with your own copy of the workshop starter. Copy this into Codex:

```text
Take a look at this starter folder:

https://github.com/npatta01/codex-masterclass-exercises/tree/main/persona-lab-starter

Create a new public GitHub repository in my namespace using this folder as the
starting point. Name it persona-lab. Clone my new repository into my account
on the workshop VM and tell me the checkout path.

If persona-lab already exists in my namespace, it's fine to delete that
repository and recreate it from this starter. Check the exact owner and
repository name first, and only replace that repository. I understand this
removes its existing code, issues, and pull requests.

Do not change the application yet. Return the repository URL and checkout path.
```

### 2. Add the Codex project

In Codex, choose **Add new project** and select the `persona-lab` checkout on your workshop VM using the path returned above. Start the next Codex task inside that project. The GitHub repository and Codex project are separate: the project points Codex at the repository checkout. See [Projects and chats](https://learn.chatgpt.com/docs/projects) if you need the app's project controls.

### 3. Preview the paper mock

In your new Codex project, copy this into a task:

```text
Start a preview of this persona-lab repository on the workshop VM, following
its preview instructions. Check that the paper mock loads at / and give me
its browser-accessible URL. Keep the preview running while I review.
```

Open the URL and click through **Landing → Workspace → Results**. This is the rough starting point; do not change it yet. The prepared logo, portraits, client stories, and supporters are for Task 3.

## Task 1 — Deploy with GitHub Pages and CI/CD

After seeing the paper mock, start a **new Codex task in the persona-lab project**, using its own worktree. This task owns the deployment workflow and build configuration. Task 2 can run in parallel in a different worktree.

### 1. Create the issue

```text
Create a GitHub issue called "Deploy Persona Lab with GitHub Pages".
I'd like the paper-mock site to deploy automatically whenever changes land
on main.

- Add a GitHub Actions workflow that runs when changes are pushed to main.
- Build the site and deploy the generated static output to GitHub Pages.
- Check that paths work under the repository name and the paper mock loads.
- Add a short README section explaining the deployed site.
- Keep this issue about CI/CD and deployment. Do not redesign the pages or
  replace the workshop placeholders.

Just create the issue for now and send me the link.
```

### 2. Work on the issue

```text
Work on the issue you just created above in this Codex task, without subagents.
Set up GitHub Pages and CI/CD, verify the production build and repository
asset paths, and open a PR linked to the issue. Leave it open for review.
Do not change the visual design or workshop content.
```

After reviewing and merging the deployment PR, send in this same task:

```text
The PR is merged. Check the deployment and open the live site.
Verify that the page and its assets load, then send me the URL.
```

## Task 2 — Modernize the landing page

Start a **separate Codex task in the same project and a separate worktree** while Task 1 works on CI/CD. This task owns only the landing page's visual design. Keep its workshop placeholders so Task 3 can fill in the company story later.

### 1. Create the issue

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
- Leave CI/CD and GitHub Pages changes to the parallel deployment task.
- Use the frontend skill to implement and check this visual change.

Just create the issue for now and send me the link.
```

### 2. Work on the issue and show a preview

```text
Work on the issue you just created above in this Codex task. Modernize only
the existing landing page's visual design; preserve its placeholders and the
connected paper mock journey. Use the frontend skill. Show me a browser-
accessible preview of your changes and check desktop and mobile layouts.
Open a PR linked to the issue and leave it open for review.
```

### 3. Annotate and make one change

Open the changed preview. Annotate one element in Codex's browser with a specific visual change you want. Send that annotation to the **same Codex task** and ask Codex to make the small change, refresh the preview, and update the same PR. Check the result yourself.

```text
Make the specific visual change I annotated in the preview. Keep the other
pages and placeholders as they are. Show me the updated preview, check the
change on mobile, and update the same PR.
```

The deployment and modernization tasks can run at the same time because they own different files. Review both PRs. Merge the deployment PR first; then ask the modernization task to sync with `main`, verify its preview and build again, and update its PR before merging.

## Task 3 — Create and implement parallel issues

Give the fictional company a brand, clients, team, and supporters. You'll split the work into three GitHub issues and use separate Codex tasks, each with its own worktree and PR. A coordinating Codex task tracks their progress and passes brand decisions to the other tasks.

The content and assets are already prepared. This task fills in the brand,
clients, team, and supporters left as placeholders in Task 2.

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
