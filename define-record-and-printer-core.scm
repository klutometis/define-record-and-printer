@(title "define-record-and-printer")
@(description "Legible records")
@(author "Peter Danenberg")
@(username "klutometis")
@(email "pcd@roxygen.org")

(define-syntax define-record-and-printer
  @("Define a record and a printer that shows the contents of the
record as a vector; see {{define-record}}."
    (name "The name of the record")
    (slotname "The name of the slot")
    (@to "record"))
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
                 (,%write (,%record->vector record) out)))))))))
