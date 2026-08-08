(define (product f a b) ; f(a) * f(a + 1) * ... * f(b)
  (if (= a b)
    (f a)
    (* (f a)
       (product f (+ a 1) b))))

(define (product f a b)
  (define (iter acc from to)
    (if (> from to)
      acc
      (iter (* acc (f from)) (+ from 1) to)))
  (iter 1 a b))

(define (factorial n)
  (define (id i)
    i)
  (product id 1 n))

(factorial 4)

(define (cal-pi n)
  (define (F n)
    (/ (if (even? n)
         (+ n 2)
         (+ n 1))
       (if (even? n)
         (+ n 1)
         (+ n 2))))
  (product F 1 n))













