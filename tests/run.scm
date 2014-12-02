(use define-record-and-printer test)

(define-record-and-printer foo bar)
(test
 "Trivial record"
 "#(foo baz)"
 (with-output-to-string (lambda () (write (make-foo 'baz)))))
