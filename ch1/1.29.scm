(define (cube x)
  (* x x x))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  
  (define (iter acc count)
    (cond ((> count n) acc)
          ((or (= count 0) (= count n))
           (iter (+ acc (y count)) (+ count 1)))
          ((even? count)
           (iter (+ acc (* 2 (y count))) (+ count 1)))
          (else
           (iter (+ acc (* 4 (y count))) (+ count 1)))))
  
  (* (/ h 3) (iter 0 0)))

(integral cube 0 1 100)