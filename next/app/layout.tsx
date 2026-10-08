import type { ReactNode } from "react";
import type { Metadata, Viewport } from "next";

export const metadata: Metadata = {
  title: "PromCon",
  description: "PromCon, the conference about the Prometheus monitoring system and time series database",
  keywords: "promcon, conference, prometheus, monitoring, monitoring system, time series, time series database, alerting, metrics, telemetry",
  authors: [{ name: "Prometheus" }],
  icons: {
    icon: [
      { url: "/assets/favicons/favicon-16x16.png", sizes: "16x16", type: "image/png" },
      { url: "/assets/favicons/favicon-32x32.png", sizes: "32x32", type: "image/png" },
      { url: "/assets/favicons/favicon-96x96.png", sizes: "96x96", type: "image/png" },
      { url: "/assets/favicons/android-chrome-192x192.png", sizes: "192x192", type: "image/png" },
    ],
    shortcut: "/assets/favicons/favicon.ico",
    apple: [57, 60, 72, 76, 114, 120, 144, 152, 180].map((s) => ({
      url: `/assets/favicons/apple-touch-icon-${s}x${s}.png`,
      sizes: `${s}x${s}`,
    })),
  },
  manifest: "/assets/favicons/android-chrome-manifest.json",
};

export const viewport: Viewport = { themeColor: "#ffffff" };

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en">
      <head>
        <link href="/assets/bootstrap-3.3.1/css/bootstrap.min.css" rel="stylesheet" />
        <link href="/assets/site.css" rel="stylesheet" />
        <link href="/assets/font-awesome-4.6.1/css/font-awesome.min.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Lato:300" rel="stylesheet" />
      </head>
      <body>
        {children}
        <script async defer src="//js.hs-scripts.com/8112310.js" id="hs-script-loader" />
      </body>
    </html>
  );
}
