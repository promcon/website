export type Banner = { className: string; author: string; url: string };

export type Conference = {
  title: string;
  subtitle: string;
  path: string;
  navigation: { href: string; text: string }[];
  banner: Banner;
};

const COC = { href: "/coc/", text: "Code of Conduct" };

const berlin: Banner = { className: "berlin-banner", author: "Céline Lang", url: "https://www.flickr.com/photos/line68/10555465713" };
const munich: Banner = { className: "munich-banner", author: "Qwrt!", url: "https://www.flickr.com/photos/qwertworks/9983260225/" };
const online: Banner = { className: "online-banner", author: "Luke Chesser", url: "https://unsplash.com/photos/tgrBcf7S_dY" };
const losangeles: Banner = { className: "losangeles-banner", author: "Cameron Venti", url: "https://unsplash.com/photos/0YWaDPylkYA" };

// Builds the navigation: "Overview" plus the given [slug, label] pages.
function nav(path: string, pages: [string, string][], coc = true) {
  const items = [{ href: path, text: "Overview" }, ...pages.map(([slug, text]) => ({ href: `${path}${slug}/`, text }))];
  return coc ? [...items, COC] : items;
}

export const conferences: Conference[] = [
  {
    title: "PromCon 2016",
    subtitle: "The Prometheus conference — August 25 - 26 in Berlin",
    path: "/2016-berlin/",
    navigation: nav("/2016-berlin/", [["schedule", "Schedule"]]),
    banner: berlin,
  },
  {
    title: "PromCon 2017",
    subtitle: "The Prometheus conference — August 17 - 18 in Munich",
    path: "/2017-munich/",
    navigation: nav("/2017-munich/", [["schedule", "Schedule"]]),
    banner: munich,
  },
  {
    title: "PromCon 2018",
    subtitle: "The Prometheus conference — August 09 - 10 in Munich",
    path: "/2018-munich/",
    navigation: nav("/2018-munich/", [["schedule", "Schedule"], ["stream", "Live Stream"]]),
    banner: munich,
  },
  {
    title: "PromCon EU 2019",
    subtitle: "The Prometheus conference — November 07 - 08 in Munich",
    path: "/2019-munich/",
    navigation: nav("/2019-munich/", [["schedule", "Schedule"], ["stream", "Live Stream"]]),
    banner: munich,
  },
  {
    title: "PromCon Online 2020",
    subtitle: "The Prometheus conference — July 14 - 16 online",
    path: "/2020-online/",
    navigation: nav("/2020-online/", [["register", "Register"], ["schedule", "Schedule"], ["stream", "Live Stream"]]),
    banner: online,
  },
  {
    title: "PromCon Online 2021",
    subtitle: "The Prometheus conference — May 3 online",
    path: "/2021-online/",
    navigation: nav("/2021-online/", [["schedule", "Schedule"]]),
    banner: online,
  },
  {
    title: "PromCon NA 2021",
    subtitle: "The Prometheus conference — October 11 in Los Angeles",
    path: "/2021-losangeles/",
    navigation: nav("/2021-losangeles/", [["diversity", "Diversity"], ["schedule", "Schedule"]], false),
    banner: losangeles,
  },
  {
    title: "PromCon EU 2022",
    subtitle: "The Prometheus conference — November 08 - 09 in Munich",
    path: "/2022-munich/",
    navigation: nav("/2022-munich/", [["diversity", "Diversity"], ["schedule", "Schedule"], ["health-and-safety", "Health & Safety"]]),
    banner: munich,
  },
  {
    title: "PromCon EU 2023",
    subtitle: "The Prometheus conference — September 28 - 29 in Berlin",
    path: "/2023-berlin/",
    navigation: nav("/2023-berlin/", [["diversity", "Diversity"], ["schedule", "Schedule"], ["health-and-safety", "Health & Safety"]]),
    banner: berlin,
  },
  {
    title: "PromCon EU 2024",
    subtitle: "The Prometheus conference — September 11 - 12 in Berlin",
    path: "/2024-berlin/",
    navigation: nav("/2024-berlin/", [["register", "Register"], ["schedule", "Schedule"]]),
    banner: berlin,
  },
  {
    title: "PromCon EU 2025",
    subtitle: "The Prometheus conference — October 21 - 22 in Munich",
    path: "/2025-munich/",
    navigation: nav("/2025-munich/", [["register", "Register"], ["diversity", "Diversity"], ["schedule", "Schedule"], ["sponsor", "Sponsor"], ["health-and-safety", "Health & Safety"]]),
    banner: munich,
  },
  {
    title: "PromCon EU 2026",
    subtitle: "The Prometheus conference — October 7 - 8 in Munich",
    path: "/2026-munich/",
    navigation: nav("/2026-munich/", [["register", "Register"], ["diversity", "Diversity"], ["schedule", "Schedule"], ["health-and-safety", "Health & Safety"]]),
    banner: munich,
  },
];

// Pages outside any conference (e.g. "/" and "/coc/") use the latest conference.
export function conferenceForUrl(url: string): Conference {
  return conferences.find((c) => url.startsWith(c.path)) ?? conferences[conferences.length - 1];
}

export const homeNavigation = conferences.map((c) => ({ href: c.path, text: c.title }));
