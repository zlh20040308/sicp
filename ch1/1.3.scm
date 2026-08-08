(define (max x y)
  (if (> x y)
    x
    y))

(define (sum-big x y z)
  (cond ((= x (max x y)) (+ x (max y z)))
        ((= y (max y z)) (+ y (max z x)))
        ((= z (max z x)) (+ z (max x y)))))