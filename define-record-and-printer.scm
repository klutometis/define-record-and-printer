(module define-record-and-printer
  (define-record-and-printer)
  (import chicken scheme)
  (import-for-syntax matchable)
  (use lolevel)

  (define-syntax define-record-and-printer
    (lambda (expression rename compare)
      (match expression
        ((_ record . fields)
         (let ((%define-record (rename 'define-record))
               (%define-record-printer (rename 'define-record-printer))
               (%begin (rename 'begin))
               (%lambda (rename 'lambda))
               (%write (rename 'write))
               (%record->vector (rename 'record->vector)))
           `(,%begin
             (,%define-record ,record ,@fields)
             (,%define-record-printer
              ,record
              (,%lambda (record out)
                   (,%write (,%record->vector record) out))))))))))
