"use client";

// Root entry for the static export.
//
// Why this file exists: the frontend is built with `output: "export"`, which
// disables middleware (src/proxy.ts holds the auth guard). Without it there is
// no page for "/" at all, so Next emitted a 404 shell as index.html and the Go
// host (server/webui_embed.go) served that as the SPA fallback — hydration then
// blew up with "Failed to execute 'removeChild' on 'Node'".
//
// A client-side redirect is the right tool here: middleware is unavailable, but
// the browser is not. /login applies the same rule the proxy used to: an
// authenticated visitor hitting an auth page is forwarded to the main console,
// an anonymous one gets the login form. So this single hop reproduces the
// original guard without needing the server round-trip.

import { useEffect } from "react";
import { useRouter } from "next/navigation";

export default function Home() {
  const router = useRouter();

  useEffect(() => {
    router.replace("/login");
  }, [router]);

  return null;
}