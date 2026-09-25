import { copyFile } from 'node:fs/promises';
await copyFile(new URL('../WORKSHOP-GUIDE.md', import.meta.url), new URL('../public/workshop/guide.txt', import.meta.url));
