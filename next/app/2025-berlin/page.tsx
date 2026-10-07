import PageShell from "@/components/PageShell";

// Common typo; shared in a link we can't change (was content/_redirects).
export default function Page() {
  return (
    <PageShell url="/2025-munich/" html={'<p>Redirecting to <a href="/2025-munich/">PromCon EU 2025</a>…</p>'}>
      <meta httpEquiv="refresh" content="0;URL='/2025-munich/'" />
    </PageShell>
  );
}
