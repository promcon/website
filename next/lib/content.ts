import fs from "node:fs";
import path from "node:path";
import matter from "gray-matter";
import { renderMarkdown } from "./markdown";

const CONTENT_DIR = path.join(process.cwd(), "..", "content");

export type Page = {
  slug: string[];
  url: string;
  title?: string;
  redirect?: string;
  isIndex: boolean;
  kind: "speaker" | "talk" | "page";
  html: string;
};

function walk(dir: string): string[] {
  return fs.readdirSync(dir, { withFileTypes: true }).flatMap((e) => {
    const p = path.join(dir, e.name);
    return e.isDirectory() ? walk(p) : [p];
  });
}

// Mirrors the nanoc routing rule: index.md -> dir/, foo.md -> foo/.
function slugFor(file: string): string[] {
  const rel = path.relative(CONTENT_DIR, file).replace(/\.md$/, "").split(path.sep);
  if (rel[rel.length - 1] === "index") rel.pop();
  return rel;
}

export function urlFor(slug: string[]): string {
  return slug.length ? `/${slug.join("/")}/` : "/";
}

let index: Map<string, string> | undefined;

function fileIndex(): Map<string, string> {
  if (!index) {
    index = new Map();
    for (const f of walk(CONTENT_DIR)) {
      // content/README.md is a plain passthrough file, not a page.
      if (!f.endsWith(".md") || path.relative(CONTENT_DIR, f) === "README.md") continue;
      index.set(slugFor(f).join("/"), f);
    }
  }
  return index;
}

export function allSlugs(): string[][] {
  return [...fileIndex().keys()].map((k) => (k ? k.split("/") : []));
}

export async function getPage(slug: string[]): Promise<Page | undefined> {
  const file = fileIndex().get(slug.join("/"));
  if (!file) return undefined;
  const { data, content } = matter(fs.readFileSync(file, "utf8"));
  const kind = slug[1] === "speakers" ? "speaker" : slug[1] === "talks" ? "talk" : "page";
  return {
    slug,
    url: urlFor(slug),
    title: data.title,
    redirect: data.redirect,
    isIndex: path.basename(file) === "index.md",
    kind,
    html: await renderMarkdown(content),
  };
}
