(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))

(define (div-interval x y)
  (let ((y-upper-bound (upper-bound y))
        (y-lower-bound (lower-bound y)))
    ((if (or (= y-upper-bound 0)
             (= y-lower-bound 0)
             (< (* y-upper-bound y-lower-bound) 0))
      (error "Interval y contains 0")
      (mul-interval x 
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))))

(div-interval (make-interval 1 3) (make-interval -1 2))