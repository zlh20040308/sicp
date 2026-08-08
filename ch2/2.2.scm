(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-point x y)
  (cons x y))
 
(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (midpoint-segment segment)
  (let ((x-start (x-point (start-segment segment)))
       (y-start (y-point (start-segment segment)))
       (x-end (x-point (end-segment segment)))
       (y-end (y-point (end-segment segment))))
    (make-point (/ (+ x-start x-end) 2)
                (/ (+ y-start y-end) 2))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(print-point (midpoint-segment (make-segment (make-point 1 1) 
                                             (make-point 2 4))))
