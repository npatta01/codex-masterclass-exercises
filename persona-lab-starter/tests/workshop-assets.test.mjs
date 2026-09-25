import test from 'node:test';
import assert from 'node:assert/strict';
import { access, readFile } from 'node:fs/promises';
const root = new URL('../public/workshop/', import.meta.url);
test('prepared copy points to bundled assets and preserves disclosures', async () => {
  const data = JSON.parse(await readFile(new URL('content.json', root), 'utf8'));
  assert.equal(data.team[0].character, 'Female fox');
  assert.equal(data.customers.length, 4);
  assert.match(data.testimonialDisclosure, /Fictional/);
  assert.match(data.disclosure, /not validated human research/);
  const paths = [data.brand.logo, ...data.team.map(x=>x.image), ...data.customers.flatMap(x=>[x.logo,x.image]), ...data.supporters.map(x=>x.logo), ...data.extraCharacters.map(x=>`characters/${x}.png`)];
  await Promise.all(paths.map(p=>access(new URL(p, root))));
  for(const page of ['landing','workspace','results']) await access(new URL(`mock/${page}.png`,root));
});
test('guide uses prepared assets instead of asking for new portrait generation', async () => {
  const guide = await readFile(new URL('../WORKSHOP-GUIDE.md', import.meta.url),'utf8');
  assert.match(guide, /public\/workshop\/content.json/);
  assert.doesNotMatch(guide, /DiceBear/);
  assert.match(guide, /Workspace and Results tasks yourself/);
  const project = guide.indexOf('## Step 0 — Create your project');
  const preview = guide.indexOf('### 1. Preview your new project');
  const issue = guide.indexOf('### 2. Create the issue');
  assert.ok(project >= 0 && project < preview && preview < issue);
  const taskOne = guide.split('## Task 1 — Improve the frontend')[1].split('## Task 2 — Deploy with GitHub Pages')[0];
  assert.match(taskOne, /preserve its placeholders/i);
  assert.match(taskOne, /Do not add the prepared Persona Lab logo/);
  assert.match(taskOne, /Those are for Task 3/);
});
test('the root opens the connected paper mock', async () => {
  const entry = await readFile(new URL('../index.html', import.meta.url), 'utf8');
  const paper = await readFile(new URL('mock/index.html', root), 'utf8');
  assert.match(entry, /location\.replace\('workshop\/mock\/index\.html'/);
  for (const page of ['landing', 'workspace', 'results']) {
    assert.match(paper, new RegExp(`href="#${page}"`));
    assert.match(paper, new RegExp(`${page}\\.png`));
  }
});
