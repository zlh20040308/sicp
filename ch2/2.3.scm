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

(define (length-segment segment)
  (let ((x-start (x-point (start-segment segment)))
       (y-start (y-point (start-segment segment)))
       (x-end (x-point (end-segment segment)))
       (y-end (y-point (end-segment segment))))
    (sqrt (+ (square (- x-start x-end))
             (square (- y-start y-end))))))

(define (perimeter-rectangle rectangle)
  (let ((length (length-rectangle rectangle))
        (width (width-rectangle rectangle)))
    (+ (* length 2)
       (* width 2))))

(define (area-rectangle rectangle)
  (let ((length (length-rectangle rectangle))
        (width (width-rectangle rectangle)))
    (* length width)))

; 第一种抽象
(define (make-rectangle top-left top-right bottom-left)
  (cons (make-segment top-left top-right)
        (make-segment top-left bottom-left)))

(define (length-rectangle rectangle)
  (length-segment (car rectangle)))

(define (width-rectangle rectangle)
  (length-segment (cdr rectangle)))

(perimeter-rectangle (make-rectangle (make-point 1 2)
                                     (make-point 3 2)
                                     (make-point 1 1)))

(area-rectangle (make-rectangle (make-point 1 2)
                                (make-point 3 2)
                                (make-point 1 1)))


; 第二种抽象
(define (make-rectangle length width)
  (cons length width))

(define (length-rectangle rectangle)
  (car rectangle))

(define (width-rectangle rectangle)
  (cdr rectangle))

(perimeter-rectangle (make-rectangle 2 1))

(area-rectangle (make-rectangle 2 1))