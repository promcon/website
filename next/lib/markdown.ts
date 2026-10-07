import fs from "node:fs";
import path from "node:path";
import { unified } from "unified";
import remarkParse from "remark-parse";
import remarkGfm from "remark-gfm";
import remarkRehype from "remark-rehype";
import rehypeRaw from "rehype-raw";
import rehypeSlug from "rehype-slug";
import rehypeStringify from "rehype-stringify";
import { visit } from "unist-util-visit";
import type { Root, Element } from "hast";

const MARK = "\uE000";

const container = (inner: string) => `\n\n<div class="iframe-container">${inner}</div>\n\n`;

// Replacements for the Ruby/ERB embed helpers that content files used to call
// (lib/helpers/embed_players.rb in the old site).
const players: Record<string, (id: string, extra?: string) => string> = {
  youtube_player: (id, list) =>
    container(
      `<iframe id="ytplayer" type="text/html" src="https://www.youtube.com/embed/${id}?${list ? `list=${list}&` : ""}origin=https://promcon.io" allowfullscreen frameborder="0"></iframe>`,
    ),
  slideshare_player: (id) =>
    container(
      `<iframe src="//www.slideshare.net/slideshow/embed_code/key/${id}" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen></iframe>`,
    ),
  google_slides_player: (id) =>
    container(
      `<iframe src="https://docs.google.com/presentation/d/${id}/embed?start=false&amp;loop=false&amp;delayms=3000" frameborder="0" allowfullscreen></iframe>`,
    ),
  google_drive_player: (id) => container(`<iframe src="https://drive.google.com/file/d/${id}/preview" allowfullscreen></iframe>`),
  speakerdeck_player: (id) =>
    container(
      `<script async class="speakerdeck-embed" data-id="${id}" data-ratio="1.77777777777778" src="//speakerdeck.com/assets/embed.js"></script>`,
    ),
};

const ERB = /<%=\s*(\w+)\s*\(?\s*"([^"]*)"\s*(?:,\s*"([^"]*)"\s*)?\)?\s*%>/g;

// Some content files link to cache-busted asset names (foo-<hash>.svg) that
// only existed as build output of the old site. Point them at the plain file.
function unbustAssets(src: string): string {
  return src.replace(/(\/assets\/[^"'\s)]*?)-[0-9a-f]{16}(\.\w+)/g, (m, base: string, ext: string) => {
    const root = path.join(process.cwd(), "..", "content");
    return !fs.existsSync(path.join(root, m)) && fs.existsSync(path.join(root, base + ext)) ? base + ext : m;
  });
}

function expandEmbeds(source: string): string {
  const src = source.replace(/\r\n/g, "\n");
  const out = src.replace(ERB, (match, fn: string, a: string, b?: string) => {
    const player = players[fn];
    if (!player) throw new Error(`Unknown embed helper: ${match}`);
    return player(a, b);
  });
  if (out.includes("<%")) throw new Error("Unhandled ERB in content");
  // Deeply indented table tags after a blank line would become code blocks.
  const dedented = out.replace(/^[ \t]{4,}(<\/?(?:table|thead|tbody|tr|th|td)\b)/gm, "$1");
  // Redcarpet ends an HTML block at its closing tag; CommonMark only at a blank line.
  const closed = dedented.replace(/^(<\/(?:div|table|ul|ol|section|blockquote)>)[ \t]*\n(?=\S)/gm, "$1\n\n");
  // Redcarpet accepts spaces in link destinations; CommonMark needs <...>.
  const linked = closed.replace(/\]\(([^()<>\n"]*\s[^()<>\n"]*)\)/g, (_m, u: string) => `](<${u.trim()}>)`);
  // Redcarpet treats a block starting with an inline tag (<img>, <br>, <a>, ...) as a
  // paragraph; CommonMark would make it a raw HTML block. The marker character forces
  // a paragraph and is removed again in stripParagraphMarker.
  const wrapped = linked.replace(/(^|\n[ \t]*\n|\n#{1,6} [^\n]*\n|\n<h[1-6]>[^\n]*<\/h[1-6]>\n[ \t]*)(<(?:img|br|a|span|strong|em|b|i|code)\b)/g, `$1${MARK}$2`);
  return wrapped;
}

// Equivalent of the old "bootstrappify" filter.
function bootstrappify() {
  return (tree: Root) => {
    visit(tree, "element", (node: Element) => {
      if (node.tagName === "h1") {
        node.properties.className = ["page-header"];
      } else if (node.tagName === "table") {
        const cls = [node.properties.className ?? []].flat().map(String);
        if (!cls.some((c) => c.includes("table"))) {
          node.properties.className = [...cls, "table", "table-bordered"];
        }
      }
    });
  };
}

function stripParagraphMarker() {
  return (tree: Root) => {
    visit(tree, "text", (node) => {
      node.value = node.value.replaceAll(MARK, "");
    });
  };
}

const processor = unified()
  .use(remarkParse)
  .use(remarkGfm, { singleTilde: false })
  .use(remarkRehype, { allowDangerousHtml: true })
  .use(rehypeRaw)
  .use(stripParagraphMarker)
  .use(rehypeSlug)
  .use(bootstrappify)
  .use(rehypeStringify);

export async function renderMarkdown(src: string): Promise<string> {
  return String(await processor.process(unbustAssets(expandEmbeds(src))));
}
