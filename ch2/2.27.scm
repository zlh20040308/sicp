(define nil '())

(define (deep-reverse x)
  (cond ((null? x) '())
        ((not (pair? x)) x)              ; 叶子节点直接返回
        (else (append (deep-reverse (cdr x))
                      (list (deep-reverse (car x)))))))

(define x (list (list 1 2) (list 3 4)))
(deep-reverse x)