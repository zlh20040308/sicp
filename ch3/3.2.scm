(define (make-monitored f)
  (define t 0)
  (define (mf m)
    (cond ((eq? m 'how-many-calls?) t)
          ((eq? m 'reset-count) (set! t 0))
          (else (set! t (+ t 1))
                (f m))))
  mf)

(define s (make-monitored sqrt))

(s 100)
(s 'how-many-calls?)