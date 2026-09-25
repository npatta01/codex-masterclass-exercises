# Persona Lab workshop guide

Work through **A → E**. Copy one prompt at a time. Each letter is a workshop activity; a **Codex task** is a conversation in the app.

> Start with **A**. Return to the next activity when you are ready.

- **A 🧰 Set up:** Make your GitHub repo, clone it on the workshop VM, add the Codex project, and see the paper mock.
- **B 🚀 Publish:** Set up GitHub Pages and CI/CD.
- **C 🎨 Modernize:** Improve the landing page and annotate one change. **B and C can run at the same time.**
- **D 🐾 Personalize:** Fill in the fictional company details.
- **E 🔎 Review:** Check mobile layout and accessibility.

Your **GitHub repo** holds the code and issues. Your **Codex project** points to its checkout on the workshop VM and groups your Codex tasks.

## A — Set up and see the paper mock 🧰

### Make your GitHub repo

Copy this into Codex:

```text
Take a look at this starter folder:

https://github.com/npatta01/codex-masterclass-exercises/tree/main/persona-lab-starter

Create a public GitHub repository named persona-lab using this folder as the
starting point.

If I already have a repository named persona-lab, ask me what name to use.
Do not replace an existing repository.

Do not change the application yet. Return the new repository URL.
```

### Clone your new repo on the workshop VM

After Codex returns the new GitHub URL, send this in the **same Codex task**:

```text
Clone the GitHub repository you just created into my account on the workshop
VM. Use my new repository, not the codex-masterclass-exercises source repo.
Check that the clone's origin points to my new GitHub repository. Do not
change the files. Give me the full checkout path.
```

### Add your Codex project

In Codex, choose **Add new project**. Select the new repository checkout on your workshop VM using the path from the clone step. Start your next Codex task from that project. [How projects work](https://learn.chatgpt.com/docs/projects).

### See the paper mock

In your new Codex project, copy this into a task:

```text
Start a preview of this persona-lab repository on the workshop VM, following
its preview instructions. Check that the paper mock loads at / and give me
its browser-accessible URL. Keep the preview running while I review.
```

Open the URL and click through **Landing → Workspace → Results**. This is the starting sketch. Save the logo, portraits, client stories, and supporters for D.

## B — Publish with GitHub Pages 🚀

Start a new Codex task in your `persona-lab` project, in its own worktree. This task handles publishing. You can start C in another worktree while B is running.

### Create the issue

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

### Build the publishing workflow

```text
Work on the issue you just created above in this Codex task, without subagents.
Set up GitHub Pages and CI/CD, verify the production build and repository
asset paths, and open a PR linked to the issue. Leave it open for review.
Do not change the visual design or workshop content.
```

After reviewing and merging the PR, send this in the same Codex task:

```text
The PR is merged. Check the deployment and open the live site.
Verify that the page and its assets load, then send me the URL.
```

## C — Modernize the landing page 🎨

Start another Codex task in the same project, with a separate worktree. You can do this while B is running. Keep the landing page's placeholder text so D can fill it in later.

### Create the issue

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
  team members, supporter logos, or final company copy. Those are for D.
- Do not add new sections, screens, product features, or simulation behavior.
  Keep the Landing → Workspace → Results links working and leave Workspace
  and Results for later exercises.
- Keep any simulated-persona/not-human-research disclosure visible.
- Leave CI/CD and GitHub Pages changes to the parallel deployment task.
- Use the frontend skill to implement and check this visual change.

Just create the issue for now and send me the link.
```

### Modernize and preview

```text
Work on the issue you just created above in this Codex task. Modernize only
the existing landing page's visual design; preserve its placeholders and the
connected paper mock journey. Use the frontend skill. Show me a browser-
accessible preview of your changes and check desktop and mobile layouts.
Open a PR linked to the issue and leave it open for review.
```

### Annotate one change

Open the changed preview. Annotate one element in Codex's browser with a specific visual change you want. Send that annotation to the **same Codex task** and ask Codex to make the small change, refresh the preview, and update the same PR. Check the result yourself.

```text
Make the specific visual change I annotated in the preview. Keep the other
pages and placeholders as they are. Show me the updated preview, check the
change on mobile, and update the same PR.
```

Review both PRs. Merge B first. Then ask the C task to sync with `main`, check its preview and build again, and update its PR before merging.

## D — Personalize the company 🐾

Give the fictional company a brand, clients, team, and supporters. Create one parent issue and three smaller issues. A coordinating Codex task will send each smaller issue to its own Codex task and worktree.

The content and assets are already prepared. This task fills in the brand,
clients, team, and supporters left as placeholders in C.

### Create the issues

```text
I'd like to replace the landing page placeholders with a playful
fictional company. Create a parent GitHub issue called
"Personalize the Persona Lab company story" and three linked sub-issues.
Keep the connected paper prototype and research disclosure intact.

Here's what I'd like in each sub-issue:

Brand identity
   - Use the Persona Lab name, logo, and tagline supplied in
     public/workshop/content.json and public/workshop/logos/persona-lab.svg.
   - Choose a simple color palette.
   - Keep the design intentionally appropriate for a workshop prototype.

Clients and teammates

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

Supporters and company footer

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

### Work on the issues

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

## E — Review the UI 🔎

After improving the frontend, give it a mobile and accessibility review. You'll use one Codex task with two subagents to investigate different parts of the UI. The main agent brings their findings together, makes the fixes, and opens one PR.

### Create the issue

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

### Review and fix

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
