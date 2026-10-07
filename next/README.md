# PromCon website (Next.js)

Migration of the nanoc-based site to Next.js (App Router, static export).

- Content is still read from `../content` (Markdown + front matter), so there is a single source of truth during the migration.
- `app/[[...slug]]/page.tsx` renders every Markdown file at the same URL as the old site (`foo/index.md` → `/foo/`, `foo.md` → `/foo/`).
- `lib/markdown.ts` replaces the nanoc filters: ERB embed helpers (`youtube_player`, ...) are expanded, Markdown is rendered with unified/remark (GFM, raw HTML allowed), and the "bootstrappify" rules are applied.
- `lib/conferences.ts` replaces `lib/helpers/conferences.rb` (titles, banners, navigation).
- `scripts/sync-assets.mjs` copies all non-Markdown files (assets, slides, `schedule.xml`, `giggity.json`, ...) from `../content` to `public/`.
- The old `_redirects` entry (`/2025-berlin`) is a static meta-refresh page.

## Usage

```bash
npm install
npm run dev        # development server
npm run build      # static site in out/
npm run serve      # serve out/ on :3001
```

## Verifying against the old site

Build the old site (see the top-level README), then:

```bash
node scripts/compare-urls.mjs /path/to/old/output out
```

This checks that every old URL exists and that page content matches (normalizing
cache-busted asset names and known renderer differences). The remaining diffs are
cases where the old Redcarpet renderer produced broken output (e.g. lists
without a preceding blank line).
