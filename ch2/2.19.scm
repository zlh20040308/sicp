(define (first-denomination items)
  (car items))

(define (except-first-denomination items)
  (cdr items))

(define (no-more? items)
  (null? items))

;  Does the order of the list coin-values affect the answer produced by cc? Why or why not? 
; 不会