;; SPDX-License-Identifier: AGPL-3.0-or-later
;; SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
;;; PLAYBOOK.scm — bundeno operational runbook

(define-module (bundeno playbook)
  #:export (development-workflow testing-workflow release-workflow))

(define development-workflow
  '((setup
      (steps
        ("Clone repository" . "git clone https://github.com/hyperpolymath/bundeno")
        ("Install Deno" . "curl -fsSL https://deno.land/install.sh | sh")
        ("Install Bun" . "curl -fsSL https://bun.sh/install | bash")
        ("Run tests on both" . "just test")))

    (adding-new-compat-module
      (steps
        ("Create src/compat/<module>.ts")
        ("Add runtime switch (RUNTIME === 'deno' vs 'bun')")
        ("Export from src/mod.ts")
        ("Add tests in tests/<module>_test.ts")
        ("Run on both runtimes")))

    (adding-zig-native
      (steps
        ("Create native/src/<module>.zig")
        ("Export C ABI functions")
        ("Build with 'zig build'")
        ("Load in Deno via Deno.dlopen")
        ("Load in Bun via native Zig import")))))

(define testing-workflow
  '((run-all-tests
      (deno . "deno test --allow-all")
      (bun . "bun test"))

    (run-specific-test
      (deno . "deno test --allow-all tests/<name>_test.ts")
      (bun . "bun test tests/<name>_test.ts"))

    (coverage
      (deno . "deno test --allow-all --coverage=cov_profile")
      (bun . "bun test --coverage"))))

(define release-workflow
  '((pre-release-checklist
      (items
        ("All tests pass on Deno AND Bun")
        ("STATE.scm updated")
        ("CHANGELOG.md updated")
        ("Version bumped in deno.json")))

    (release-steps
      (steps
        ("Tag release" . "git tag v0.x.0")
        ("Push tag" . "git push origin v0.x.0")
        ("Publish to JSR" . "deno publish")
        ("Update ROADMAP.adoc")))))
