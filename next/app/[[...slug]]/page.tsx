import { notFound } from "next/navigation";
import type { Metadata } from "next";
import PageShell from "@/components/PageShell";
import { allSlugs, getPage } from "@/lib/content";
import { conferenceForUrl } from "@/lib/conferences";

type Props = { params: Promise<{ slug?: string[] }> };

// Next.js hands static params back percent-encoded; content slugs are raw Unicode.
const slugOf = async (params: Props["params"]) => ((await params).slug ?? []).map(decodeURIComponent);

export const dynamicParams = false;

export function generateStaticParams() {
  return allSlugs().map((slug) => ({ slug }));
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const page = await getPage(await slugOf(params));
  if (!page?.title) return { title: "PromCon" };
  return { title: `${page.title} | ${conferenceForUrl(page.url).title}` };
}

export default async function Page({ params }: Props) {
  const page = await getPage(await slugOf(params));
  if (!page) notFound();

  const heading = { speaker: "<h3>Speaker biography</h3>\n", talk: "<h3>Talk abstract</h3>\n", page: "" }[page.kind];
  const back = page.kind === "page" ? "" : '\n<a class="btn btn-default" href="../../schedule/">Back to schedule</a>\n';

  return (
    <PageShell url={page.url} isIndex={page.isIndex} html={heading + page.html + back}>
      {page.redirect && <meta httpEquiv="refresh" content={`0;URL='${page.redirect}'`} />}
    </PageShell>
  );
}
