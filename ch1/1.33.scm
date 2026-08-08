(define (filtered-accumulate filter combiner null-value term a next b)
  (if (filter a)
    (if (> a b)
      null-value
      (combiner (term a)
                (filtered-accumulate filter combiner null-value term (next a) next b)))
    (filtered-accumulate filter combiner null-value term (next a) next b)))

(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor n test-divisor)
      (cond ((> (* test-divisor test-divisor) n) n)
            ((= (remainder n test-divisor) 0) test-divisor)
            (else (find-divisor n (+ test-divisor 1)))))
    (find-divisor n 2))
  (= n (smallest-divisor n)))

(define (add1 x) (+ x 1))
    
(define (sum-prime-squares a b)
  (filtered-accumulate prime? + 0 square a add1 b))

(define (product-coprimes n)
  (define (identity x)
    x)
  (define (filter x)
    (= (gcd x n) 1))
  (filtered-accumulate filter * 1 identity 1 add1 (- n 1)))