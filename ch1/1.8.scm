(define (good-enough? guess x)
  (< (abs 
         (- (cube guess) 
            x)) 
     0.001))

(define (improve guess x)
  (/ (+ (/ x 
           (square guess))
        (* 2 guess))
     3)) 

(define (expt-iter guess x)
  (if (good-enough? guess x)
      guess
      (expt-iter (improve guess x)
                x)))

(define (expt x)
  (expt-iter 1.0 x))