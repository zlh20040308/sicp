(define (equal? lst1 lst2)
  (cond ((and (null? lst1) (null? lst2)) #t)
        ((and (symbol? lst1) (symbol? lst2)) 
         (eq? lst1 lst2))
        ((and (pair? lst1) (pair? lst2)) 
         (and (equal? (car lst1) (car lst2)) 
              (equal? (cdr lst1) (cdr lst2))))
        (else #f)))

(equal? '(this is a list) '(this is a list))

(equal? '(this is a list) '(this (is a) list))