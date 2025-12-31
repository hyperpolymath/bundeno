;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; AGENTIC.scm — bundeno AI agent collaboration context

(define-module (bundeno agentic)
  #:export (agent-context agent-capabilities agent-constraints))

(define agent-context
  '((project-purpose
     "bundeno provides runtime compatibility between Deno and Bun, enabling
      developers to write code once that runs on both JavaScript runtimes.")

    (key-abstractions
      ((runtime . "Detects current runtime (deno/bun/node/browser)")
       (fs . "Unified file system operations")
       (process . "Environment, subprocess, cwd abstractions")
       (future:sqlite . "SQLite database abstraction")
       (future:ffi . "Foreign function interface bridge")))

    (architecture-summary
      "Pure TypeScript layer that detects runtime and delegates to native APIs.
       Future Zig layer for performance-critical FFI bridging.")))

(define agent-capabilities
  '((can-assist-with
      ("Adding new compat modules for runtime-specific APIs"
       "Writing tests that run on both Deno and Bun"
       "Implementing Zig native extensions"
       "Debugging runtime-specific behavior differences"
       "Performance optimization"))

    (file-patterns
      ((source . "src/**/*.ts")
       (tests . "tests/**/*_test.ts")
       (native . "native/src/**/*.zig")
       (config . "deno.json")))

    (build-commands
      ((test-deno . "deno test --allow-all")
       (test-bun . "bun test")
       (format . "deno fmt")
       (lint . "deno lint")
       (build-zig . "cd native && zig build")))))

(define agent-constraints
  '((language-policy
      "TypeScript for JS layer, Zig for native layer. No Node.js-specific code.")

    (testing-requirement
      "All compat modules MUST have tests that pass on BOTH Deno and Bun.")

    (api-design
      "Prefer Web Platform APIs where both runtimes support them.
       Only abstract truly divergent APIs.")

    (no-polyfills
      "Do not fake missing APIs. Throw clear errors if API unavailable on runtime.")

    (security
      "Respect Deno permission model. Document required permissions.")))
