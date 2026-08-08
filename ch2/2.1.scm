(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< (* n d) 0)
      (cons (- 0 (abs (/ n g))) (abs (/ d g)))
      (cons (abs (/ n g)) (abs (/ d g))))))

(define a (make-rat -1 -2))

(define n (car a))