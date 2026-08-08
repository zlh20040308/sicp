(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; add-1 接受一个 n ,这个 n 本身是一个过程，它接受两个参数 f 和 x ,返回将 f 应用于 x n 次的结果，
; 所以 ((n f) x) 就得到将 f 应用于 x n 次的结果，再套一层 f ，变成 (f ((n f) x)) ，
; 得到将 f 应用于 x (n+1) 次的结果

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define (add a b)
  (lambda (f)
    (lambda (x)
      ((b f) ((a f) x)))))