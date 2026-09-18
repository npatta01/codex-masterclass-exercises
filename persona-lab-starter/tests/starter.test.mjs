import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import test from 'node:test';

test('starter exposes the participant exercise flow', async () => {
  const app = await readFile(new URL('../src/App.jsx', import.meta.url), 'utf8');

  assert.match(app, /Persona Lab/);
  assert.match(app, /Invoke persona/);
  assert.match(app, /synthetic rationale/i);
  assert.match(app, /setTimeout/);
});

test('starter deliberately has no GitHub Pages workflow', async () => {
  const packageJson = await readFile(new URL('../package.json', import.meta.url), 'utf8');

  assert.match(packageJson, /"build"/);
});
