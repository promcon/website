// Copies every non-Markdown file from ../content (assets, slides, schedule.xml,
// giggity.json, ...) into public/ so it is served at the same URL as before.
import { cpSync, rmSync, mkdirSync, readdirSync, statSync } from "node:fs";
import { join, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");
const src = join(root, "..", "content");
const dst = join(root, "public");

rmSync(dst, { recursive: true, force: true });
mkdirSync(dst, { recursive: true });

function walk(dir) {
  for (const name of readdirSync(dir)) {
    const p = join(dir, name);
    if (statSync(p).isDirectory()) {
      walk(p);
    } else if (name === "_redirects" || (name.endsWith(".md") && name !== "README.md")) {
      continue;
    } else {
      const target = join(dst, p.slice(src.length));
      mkdirSync(dirname(target), { recursive: true });
      cpSync(p, target);
    }
  }
}
walk(src);
