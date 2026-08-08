(define (p)
  (p))

(define (test x y)
  (if (> x 0)
    0
    y))

(test 0 (p))

; 如果是正则序求值，那就直接返回 0
; 如果是应用序求值，那就无限递归