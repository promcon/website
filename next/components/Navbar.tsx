"use client";

import { useState } from "react";

export type NavItem = { href: string; text: string };

export default function Navbar({ items, current }: { items: NavItem[]; current: string }) {
  const [open, setOpen] = useState(false);
  return (
    <nav className="navbar navbar-inverse navbar-static-top" role="navigation">
      <div className="container-fluid">
        <div className="navbar-header">
          <button
            type="button"
            className={`navbar-toggle${open ? "" : " collapsed"}`}
            aria-expanded={open}
            aria-controls="navbar"
            onClick={() => setOpen(!open)}
          >
            <span className="sr-only">Toggle navigation</span>
            <span className="icon-bar"></span>
            <span className="icon-bar"></span>
            <span className="icon-bar"></span>
          </button>
        </div>
        <div className={`navbar-collapse collapse${open ? " in" : ""}`} id="navbar">
          <ul className="nav navbar-nav main-nav">
            {items.map((i) => (
              <li key={i.href} className={i.href === current ? "selected" : ""}>
                <a href={i.href}>{i.text}</a>
              </li>
            ))}
          </ul>
        </div>
      </div>
    </nav>
  );
}
