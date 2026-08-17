(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (* range (random 1.0)))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

; (x1, y1) 为左下角的点，(x2, y2) 为右上角的点
(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (experiment)
    (let ((x (random-in-range x1 x2))
          (y (random-in-range y1 y2)))
      (P x y)))
  (let ((rectangle-area (* (- x2 x1) (- y2 y1))))
    (* rectangle-area (monte-carlo trials experiment))))

(define (estimate-pi trials)
  (define (P x y)
    (< (+ (* x x) 
          (* y y))
       1))
  (estimate-integral P -1 1 -1 1 trials))

(estimate-pi 1000)