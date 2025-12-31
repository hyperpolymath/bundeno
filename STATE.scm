;;; STATE.scm — bundeno
;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell

(define metadata
  '((version . "0.1.0")
    (schema-version . "1.0")
    (created . "2025-12-31")
    (updated . "2025-12-31")
    (project . "bundeno")
    (repo . "https://github.com/hyperpolymath/bundeno")))

(define project-context
  '((name . "bundeno")
    (tagline . "Write once, run on Deno and Bun")
    (tech-stack . ("TypeScript" "Zig"))))

(define current-position
  '((phase . "v0.1 - Foundation")
    (overall-completion . 15)
    (components
      ((runtime-detection ((status . "complete") (completion . 100)))
       (fs-compat ((status . "complete") (completion . 100)))
       (process-compat ((status . "complete") (completion . 100)))
       (sqlite-compat ((status . "planned") (completion . 0)))
       (ffi-compat ((status . "planned") (completion . 0)))
       (zig-native ((status . "planned") (completion . 0)))
       (test-suite ((status . "planned") (completion . 0)))
       (documentation ((status . "in-progress") (completion . 20)))))
    (working-features
      ("Runtime detection (isDeno, isBun)"
       "File read/write (text and binary)"
       "Directory operations"
       "Environment variables"
       "Subprocess execution"))))

(define route-to-mvp
  '((milestones
      ((v0.1.0
         (name . "Foundation")
         (status . "in-progress")
         (items
           ("Runtime detection" . done)
           ("File system compat" . done)
           ("Process/env compat" . done)
           ("deno.json setup" . pending)
           ("Basic tests" . pending)))
       (v0.2.0
         (name . "Extended APIs")
         (status . "planned")
         (items
           ("SQLite compat" . pending)
           ("WebSocket compat" . pending)
           ("Crypto compat" . pending)))
       (v0.3.0
         (name . "Zig Native")
         (status . "planned")
         (items
           ("Zig build setup" . pending)
           ("Shared FFI bridge" . pending)
           ("Performance benchmarks" . pending)))))))

(define blockers-and-issues
  '((critical ())
    (high-priority
      (("Dual-runtime CI matrix" . "Need GitHub Actions for both Deno and Bun")))
    (medium-priority
      (("SQLite API differences" . "bun:sqlite vs @std/sqlite have different APIs")))
    (low-priority ())))

(define critical-next-actions
  '((immediate
      (("Add deno.json" . high)
       ("Create test suite" . high)
       ("Add CI workflow" . high)))
    (this-week
      (("Implement SQLite compat" . medium)
       ("Write README.adoc" . medium)))
    (this-month
      (("Zig native scaffold" . low)
       ("Publish to JSR" . low)))))

(define session-history
  '((snapshots
      ((date . "2025-12-31")
       (session . "initial-setup")
       (accomplishments
         ("Created repository"
          "Implemented runtime detection"
          "Implemented fs compat module"
          "Implemented process compat module"))
       (notes . "Pure JS foundation complete")))))

(define state-summary
  '((project . "bundeno")
    (completion . 15)
    (blockers . 0)
    (phase . "Foundation")
    (updated . "2025-12-31")))
