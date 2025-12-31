;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; NEUROSYM.scm — bundeno neurosymbolic reasoning context

(define-module (bundeno neurosym)
  #:export (conceptual-model reasoning-patterns symbolic-anchors))

(define conceptual-model
  '((core-abstraction
     "bundeno is a BRIDGE between two parallel universes (Deno and Bun)
      that share common ancestry (JavaScript/V8/JSC) but evolved differently.")

    (mental-model
      ((deno . "Security-first, permissions-explicit, URL imports, Rust core")
       (bun . "Speed-first, Node-compatible, native Zig, JSC engine")))

    (unification-principle
     "Find the common semantic meaning, implement via delegation to native APIs.
      Don't emulate—translate.")))

(define reasoning-patterns
  '((pattern:detect-delegate
     "1. Detect runtime at module load (cached)
      2. Branch on runtime in each function
      3. Call native API with appropriate signature
      4. Normalize return values to common interface")

    (pattern:capability-check
     "Before calling optional APIs, check if capability exists.
      Throw descriptive error if not available on current runtime.")

    (pattern:progressive-enhancement
     "Start with Web Platform APIs (universal).
      Add runtime-specific optimizations where beneficial.")

    (pattern:test-matrix
     "Every feature must be verified on both runtimes.
      CI runs: deno test && bun test")))

(define symbolic-anchors
  '((anchor:runtime-detection
     "globalThis.Deno, globalThis.Bun, process.versions.node")

    (anchor:file-operations
     "Deno: Deno.readFile, Deno.writeFile
      Bun: Bun.file().text(), Bun.write()")

    (anchor:subprocess
     "Deno: Deno.Command
      Bun: Bun.spawn")

    (anchor:ffi
     "Deno: Deno.dlopen (C ABI)
      Bun: native Zig imports, also supports dlopen")

    (anchor:sqlite
     "Deno: @std/sqlite or npm:better-sqlite3
      Bun: bun:sqlite (native)")))
