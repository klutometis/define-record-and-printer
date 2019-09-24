(cond-expand
 (chicken-4 (use define-record-and-printer test))
 (chicken-5 (import define-record-and-printer test chicken.port)))

(define-record-and-printer foo bar)
(test
 "Trivial record"
 "#(foo baz)"
 (with-output-to-string (lambda () (write (make-foo 'baz)))))
