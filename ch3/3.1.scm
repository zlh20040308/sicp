(define (make-accumulator x)
  (lambda (a) 
    (begin (set! x (+ x a))
           x)))

(define A (make-accumulator 5))

(A 10)
(A 10)