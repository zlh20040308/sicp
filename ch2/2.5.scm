(define (cons x y)
  (* (expt 2 x)
     (expt 3 y)))

(define (f z x)
  (if (= (remainder z x) 0)
      (+ 1 (f (/ z x) x))
      0))

(define (car z)
  (f z 2))

(define (cdr z)
  (f z 3))

(car (cons 2 3))
(cdr (cons 2 3))