(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; 由于 lisp 是应用序求值，那么就会有个问题，
; then-clause、else-clause，这两个参数在进入这个过程之前就会被求值
; 但是 if 只会根据 predicate 的结果求其中一个