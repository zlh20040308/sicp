(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w))) ; -> map 的多列表行为: map 的完整签名是 -- (map procedure list1 list2 ... listn)

(define v1 (list 1 2 3 4))
(dot-product v1 v1)

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define m1 (list (list 1 2 3 4) 
                 (list 4 5 6 6) 
                 (list 6 7 8 9)))
(matrix-*-vector m1 v1)


(define (transpose mat)
  (accumulate-n cons nil mat))

(transpose m1)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

(matrix-*-matrix m1 (transpose m1))