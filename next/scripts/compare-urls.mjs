// Usage: node scripts/compare-urls.mjs <old-output-dir> [new-out-dir]
// Checks that every URL of the old nanoc build exists in the Next.js export
// and that the page content (inside <div class="content">) is equivalent.
import { readdirSync, readFileSync, existsSync, statSync } from "node:fs";
import { join } from "node:path";

const [oldDir, newDir = "out"] = process.argv.slice(2);
if (!oldDir) {
  console.error("usage: compare-urls.mjs <old-output-dir> [new-out-dir]");
  process.exit(2);
}

const walk = (d) => readdirSync(d).flatMap((n) => (statSync(join(d, n)).isDirectory() ? walk(join(d, n)) : [join(d, n)]));

// Old build cache-busted assets (foo-<16 hex>.ext); the new site uses plain names.
const unbust = (f) => f.replace(/^(assets\/(?!.*(bootstrap|font-awesome|favicons)).*)-[0-9a-f]{16}(\.[^./]+)$/, "$1$3");

const content = (html) => {
  const m = html.match(/<div class="content">([\s\S]*?)<hr\s*\/?>\s*<footer/);
  const raw = m ? m[1] : "";
  return raw
    .replace(/<meta[^>]*>/g, "")
    .replace(/^\s*<div>/, "") // wrapper element added by the Next.js page
    .replace(/(\s*<\/div>)+\s*$/, "") // closing tags of the content wrapper(s)
    .replace(/<\/?span[^>]*>/g, " ")
    .replace(/<p><\/p>/g, "") // empty paragraphs from Redcarpet
    .replace(/ ?\/>/g, ">")
    .replace(/ id="[^"]*"/g, "")
    .replace(/&#x3C;/g, "&lt;")
    .replace(/&#x26;/g, "&amp;")
    .replace(/<\/?tbody>/g, "") // added by the HTML5 parser
    // Intraword underscores: Redcarpet emitted <em>, CommonMark keeps them literal.
    .replace(/<\/?em>/g, "_")
    // Vendor-prefixed/redundant embed attributes dropped on purpose.
    .replace(/allowfullscreen="true"/gi, "allowfullscreen")
    .replace(/ (mozallowfullscreen|webkitallowfullscreen)(="true")?/g, "")
    .replace(/ allowfullscreen><\/script>/g, "></script>")
    .replace(/(\/assets\/[^"']*?)-[0-9a-f]{16}(\.\w+)/g, "$1$2") // cache-busted asset links
    .replace(/%[0-9A-F]{2}(?:%[0-9A-F]{2})*/g, (m) => decodeURIComponent(m))
    .replace(/\s*\n\s*/g, " ")
    .replace(/>\s+</g, "><")
    .replace(/\s+/g, " ")
    .replace(/ <\//g, "</")
    .trim();
};

let missing = 0, diff = 0, ok = 0;
for (const abs of walk(oldDir)) {
  const rel = abs.slice(oldDir.length + 1);
  if (rel === "_redirects") continue;
  const target = unbust(rel);
  const n = join(newDir, target);
  if (!existsSync(n)) {
    console.log("MISSING", rel, target !== rel ? `(as ${target})` : "");
    missing++;
    continue;
  }
  if (rel.endsWith(".html")) {
    const a = content(readFileSync(abs, "utf8"));
    const b = content(readFileSync(n, "utf8"));
    if (a !== b) {
      console.log("DIFF   ", rel);
      diff++;
      continue;
    }
  }
  ok++;
}
console.log(`ok=${ok} missing=${missing} content-diff=${diff}`);
process.exit(missing || diff ? 1 : 0);
