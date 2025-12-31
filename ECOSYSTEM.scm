;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;; ECOSYSTEM.scm — bundeno

(ecosystem
  (version "0.1.0")
  (name "bundeno")
  (type "library")
  (purpose "Runtime compatibility layer enabling code to run on both Deno and Bun")

  (position-in-ecosystem
    "Bridges the Deno/Bun divide. Part of hyperpolymath's polyglot infrastructure.")

  (related-projects
    (project (name "deno")
             (url "https://deno.land")
             (relationship "target-runtime"))
    (project (name "bun")
             (url "https://bun.sh")
             (relationship "target-runtime"))
    (project (name "wintercg")
             (url "https://wintercg.org")
             (relationship "standards-body"))
    (project (name "bunsenite")
             (url "https://github.com/hyperpolymath/bunsenite")
             (relationship "sibling-project"))
    (project (name "rhodium-standard-repositories")
             (url "https://github.com/hyperpolymath/rhodium-standard-repositories")
             (relationship "standard")))

  (what-this-is
    "- Unified API for Deno and Bun runtime differences"
    "- Runtime detection utilities"
    "- File system, subprocess, environment abstractions"
    "- Future: Zig-based native FFI bridge")

  (what-this-is-not
    "- NOT a polyfill (uses native implementations)"
    "- NOT a build tool or bundler"
    "- NOT Node.js compatible (use Deno/Bun's built-in Node compat)"))
