(define (pascal row col)
  (if (= col 0)
    1
    (if (or (= col -1) (> col row))
      0
      (+ (pascal (- row 1) (- col 1))
         (pascal (- row 1) col)))))