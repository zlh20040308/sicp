(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;1. 用 map 把树 t 的每个子节点映射成"该子树的叶子数"
;2. 用 accumulate 把这些叶子数加起来
(define (count-leaves t)
  (accumulate + 0 (map (lambda (subtree)
                         (if (pair? subtree)
                             (count-leaves subtree)
                             1))
                       t)))

(count-leaves '())                    ; 0
(count-leaves '(1 2 3))               ; 3
(count-leaves '(1 (2 3) 4))           ; 4
(count-leaves '((1 2) (3 4)))         ; 4