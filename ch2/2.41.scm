(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
      
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

; 找出所有满足 1 <= i < j < k <= n 的有序三元组
(define (ordered-triple n)
  (flatmap (lambda (k)
             (flatmap (lambda (j)
                        (map (lambda (i) (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- k 1))))
           (enumerate-interval 1 n)))

; 求出 有序三元组 的和
(define (sum-triple triple)
  (accumulate + 0 triple))

; 从 三元组 中找出和为 s 的 三元组
(define (triples-sum-s triples s)
  (map (lambda (x) 
         (cdr x))
       (filter (lambda (x) 
                 (= (car x) s)) 
               (map (lambda (triple) 
                      (list (sum-triple triple) triple))
                    triples))))

(define (solve n s)
  (triples-sum-s (ordered-triple n) s))

(solve 6 10)  ; 应该返回 ((1 3 6) (1 4 5) (2 3 5))