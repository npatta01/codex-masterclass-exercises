import assert from 'node:assert/strict';
import { access, readFile } from 'node:fs/promises';
import test from 'node:test';

test('fixtures model one platform and a complete evidence trail', async () => {
  const { comparison, findings, journey, personas, platform, tasks } = await import(new URL('../src/data.js', import.meta.url));
  assert.equal(platform.name, 'Acme Market');
  assert.equal(platform.pages.length, 6);
  assert.ok(platform.pages.every((page) => page.path.startsWith('/')));
  assert.equal(personas.length, 3);
  assert.equal(tasks.length, 3);
  assert.ok(journey.length >= 5);
  assert.ok(findings.some((finding) => finding.status === 'unsupported'));
  assert.equal(comparison.length, 3);
});

test('starter exposes the connected low-fidelity product experience', async () => {
  const source = (await Promise.all([
    readFile(new URL('../src/App.jsx', import.meta.url), 'utf8'),
    readFile(new URL('../src/components/Screens.jsx', import.meta.url), 'utf8'),
    readFile(new URL('../src/components/Chrome.jsx', import.meta.url), 'utf8'),
  ])).join('\n');
  for (const label of ['Project overview', 'Persona library', 'Persona editor', 'Flow task builder', 'New simulation', 'Simulation in progress', 'Journey evidence', 'Friction findings', 'Neutral baseline', 'Project settings']) assert.match(source, new RegExp(label, 'i'));
  assert.match(source, /Invoke persona/i);
  assert.match(source, /simulated-persona hypotheses/i);
  assert.match(source, /not validated human research/i);
  assert.match(source, /one platform/i);
  assert.match(source, /setTimeout/);
});

test('starter deliberately has no GitHub Pages workflow', async () => {
  const packageJson = await readFile(new URL('../package.json', import.meta.url), 'utf8');
  assert.match(packageJson, /"build"/);
  await assert.rejects(access(new URL('../.github/workflows/pages.yml', import.meta.url)));
});

test('landing page sketches the complete product and company story', async () => {
  const screens = await readFile(new URL('../src/components/Screens.jsx', import.meta.url), 'utf8');
  for (const label of ['Why Persona Lab', 'Rough product map', 'Example evidence', 'Teams sketching with us', 'Meet the team', 'Illustrative supporters']) {
    assert.match(screens, new RegExp(label, 'i'));
  }
  assert.match(screens, /fictional placeholders/i);
});
