import type { ReactNode } from "react";
import Navbar from "./Navbar";
import { conferenceForUrl, conferences, homeNavigation } from "@/lib/conferences";

export default function PageShell({ url, isIndex = false, html, children }: { url: string; isIndex?: boolean; html?: string; children?: ReactNode }) {
  const conf = conferenceForUrl(url);
  return (
    <>
      <div className={`header-banner ${conf.banner.className} ${isIndex ? "fadein-banner" : ""}`}>
        <div className="container">
          <h1>
            <img src="/assets/prometheus_logo.svg" alt="Prometheus logo" /> {conf.title}
          </h1>
          <p className="subtitle">{conf.subtitle}</p>
        </div>
      </div>

      <Navbar items={url === "/" ? homeNavigation : conf.navigation} current={url} />

      <div className="container">
        <div className="row">
          <div className="col-md-2"></div>
          <div className="col-md-8">
            {children}
            {html !== undefined ? <div className="content" dangerouslySetInnerHTML={{ __html: html }} /> : <div className="content" />}
            <hr />
            <footer>
              <p className="pull-left">
                {conferences.map((c) => (
                  <span key={c.path}>
                    <a href={c.path}>{c.title}</a> |{" "}
                  </span>
                ))}
                &copy; Prometheus Authors 2016-{new Date().getFullYear()}
              </p>
              <p className="pull-right">
                Header photo: &copy; <a href={conf.banner.url}>{conf.banner.author}</a>
              </p>
            </footer>
          </div>
          <div className="col-md-2"></div>
        </div>
      </div>
    </>
  );
}
