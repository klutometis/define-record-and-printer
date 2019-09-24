(module define-record-and-printer
  (define-record-and-printer)
  (import scheme)
  (cond-expand (chicken-4 (import chicken))
               (chicken-5 (import chicken.base)))
  (import-for-syntax matchable)
  (cond-expand (chicken-4 (use lolevel))
               (chicken-5 (import chicken.memory.representation)))

  (include "define-record-and-printer-core.scm"))
