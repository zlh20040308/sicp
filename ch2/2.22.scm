(define nil '())
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items nil))

; Unfortunately, defining square-list this way produces the answer list in the reverse order of the one desired. Why?
; 因为他是从后往前拼接的
; 
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))


; This doesn't work either. Explain. 
; 只有 （cons 元素 list）才是（list 元素 元素 。。。）,上面是在（cons list list）