(define (consume x items)
  (if (null? items)
    items
    (if (or (and (= (remainder x 2) 0) 
                 (= (remainder (car items) 2)))
            (and (= (remainder x 2) 1) 
                 (= (remainder (car items) 2) 1)))
      (cons (car items) (consume x (cdr items)))
      (consume x (cdr items)))))

(consume 1 (list 1 2 3 4))


(define (same-parity x . y)
  (consume x (cons x y)))


(same-parity 1 2 3 4 5 6 7)
