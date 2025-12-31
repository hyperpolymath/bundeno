;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; META.scm — bundeno

(define-module (bundeno meta)
  #:export (architecture-decisions development-practices design-rationale))

(define architecture-decisions
  '((adr-001
     (title . "Runtime Abstraction Layer")
     (status . "accepted")
     (date . "2025-12-31")
     (context . "Deno and Bun have incompatible APIs for file I/O, subprocess, FFI")
     (decision . "Create unified API layer that detects runtime and delegates appropriately")
     (consequences . ("Code portability" "Single codebase for both runtimes" "Slight overhead")))

    (adr-002
     (title . "Pure JS First, Zig Later")
     (status . "accepted")
     (date . "2025-12-31")
     (context . "Native FFI bridging requires Zig for optimal Bun integration")
     (decision . "Start with pure JS/TS compatibility layer, add Zig native extensions later")
     (consequences . ("Faster initial release" "Covers 90% of use cases" "Native perf deferred")))

    (adr-003
     (title . "Web Platform APIs as Common Ground")
     (status . "accepted")
     (date . "2025-12-31")
     (context . "Both runtimes support Web Platform APIs (fetch, Request, Response, etc.)")
     (decision . "Prefer Web Platform APIs where available, abstract only divergent APIs")
     (consequences . ("Less code to maintain" "Future-proof via WinterTC" "Better compatibility")))))

(define development-practices
  '((code-style
     (languages . ("TypeScript" "Zig"))
     (formatter . "deno fmt")
     (linter . "deno lint"))
    (security
     (sast . "CodeQL")
     (credentials . "env vars only")
     (permissions . "explicit Deno permissions"))
    (testing
     (framework . "Deno.test + Bun test")
     (coverage-minimum . 80)
     (matrix . ("deno" "bun")))
    (versioning
     (scheme . "SemVer 2.0.0"))))

(define design-rationale
  '((why-bundeno
     "JavaScript runtimes are fragmenting. Developers shouldn't rewrite code for each runtime.")
    (why-not-polyfill
     "Polyfills fake missing APIs. bundeno provides native implementations via delegation.")
    (why-zig-later
     "Zig compiles to C ABI (Deno.dlopen compatible) and integrates natively with Bun.")))
