(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; a.  Write the corresponding selectors left-branch and right-branch, which return the branches of a mobile, and branch-length and branch-structure, which return the components of a branch.
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))
; b.  Using your selectors, define a procedure total-weight that returns the total weight of a mobile.
(define (branch-weight branch)
  (let ((struct (branch-structure branch)))
    (if (pair? struct)
        (total-weight struct)
        struct)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (test-total-weight m expected)
  (let ((result (total-weight m)))
    (display "Expected: ") (display expected)
    (display ", Got: ") (display result)
    (if (= result expected)
        (display " ✓")
        (display " ✗"))
    (newline)))

(define m1
  (make-mobile (make-branch 10 3)   ; 左分支：长 10，重 3
               (make-branch 5 7)))  ; 右分支：长 5，重 7
; 总重量: 3 + 7 = 10
; 
(define sub-mobile
  (make-mobile (make-branch 2 1)
               (make-branch 3 4)))

(define m2
  (make-mobile (make-branch 10 5)        ; 左分支：重 5
               (make-branch 8 sub-mobile))); 右分支：挂子动铃
; 总重量: 5 + (1 + 4) = 10
; 
(define left-sub
  (make-mobile (make-branch 1 2)
               (make-branch 2 3)))

(define right-sub
  (make-mobile (make-branch 1 4)
               (make-branch 2 5)))

(define m3
  (make-mobile (make-branch 10 left-sub)
               (make-branch 10 right-sub)))
; 总重量: (2 + 3) + (4 + 5) = 14
; 
(define deep-sub
  (make-mobile (make-branch 1 1)
               (make-branch 2 2)))

(define middle-sub
  (make-mobile (make-branch 5 deep-sub)
               (make-branch 6 7)))

(define m4
  (make-mobile (make-branch 10 middle-sub)
               (make-branch 10 8)))
; 总重量: (1 + 2 + 7) + 8 = 18
; 
(define m5
  (make-mobile (make-branch 100 0)   ; 重量为 0
               (make-branch 1 9)))
; 总重量: 0 + 9 = 9

(test-total-weight m1 10)
(test-total-weight m2 10)
(test-total-weight m3 14)
(test-total-weight m4 18)
(test-total-weight m5 9)
; c.  A mobile is said to be balanced if the torque applied by its top-left branch is equal to that applied by its top-right branch (that is, if the length of the left rod multiplied by the weight hanging from that rod is equal to the corresponding product for the right side) and if each of the submobiles hanging off its branches is balanced. Design a predicate that tests whether a binary mobile is balanced.
; 这个过程返回的结果包含两部分，
; 第一部分是这个 branch 是不是 balanced (如果这个 branch 的 structure 是数字，那就是balanced;
; 如果这个 branch 的 structure 是 mobile ，那就直接返回(balanced-binary-mobile?with-weight struct)的结果),
; 第二部分是这个branch所挂的重量
(define (balanced-branch? branch)
  (let ((struct (branch-structure branch)))
    (if (pair? struct)
      (balanced-binary-mobile?with-weight struct)
      (cons true struct))))

; 这个过程返回的结果包含两部分，第一部分是这个mobile是不是balanced,第二部分是这个mobile的重量
(define (balanced-binary-mobile?with-weight mobile)
  (let ((left-result (balanced-branch? (left-branch mobile)))
        (right-result (balanced-branch? (right-branch mobile))))
    (cons (and (car left-result) 
               (car right-result)
               (= (* (cdr left-result) (branch-length (left-branch mobile)))
                  (* (cdr right-result) (branch-length (right-branch mobile)))))
          (+ (cdr left-result) (cdr right-result)))))

(define (balanced-binary-mobile? mobile)
  (car (balanced-binary-mobile?with-weight mobile)))

; 测试用例
(define b1
  (make-mobile (make-branch 5 3)
               (make-branch 5 3)))

(define b2
  (make-mobile (make-branch 5 3)
               (make-branch 5 7)))

(define b3
  (make-mobile (make-branch 10 2)
               (make-branch 5 4)))

(define balanced-sub
  (make-mobile (make-branch 2 5)
               (make-branch 5 2)))

(define b4
  (make-mobile (make-branch 3 10)
               (make-branch 10 balanced-sub)))

(define unbalanced-sub
  (make-mobile (make-branch 3 2)
               (make-branch 1 5)))

(define b5
  (make-mobile (make-branch 2 10)
               (make-branch 4 unbalanced-sub)))

(define child
  (make-mobile (make-branch 1 2)
               (make-branch 2 1)))

(define parent
  (make-mobile (make-branch 3 child)
               (make-branch 9 1)))

(define b7
  (make-mobile (make-branch 2 parent)
               (make-branch 4 2)))

(define (test-balanced m expected)
  (let ((result (balanced-binary-mobile? m)))
    (display "Expected: ") (display expected)
    (display ", Got: ") (display result)
    (if (eq? result expected)
        (display " ✓")
        (display " ✗"))
    (newline)))

(test-balanced b1 #t)
(test-balanced b2 #f)
(test-balanced b3 #t)
(test-balanced b4 #f)
(test-balanced b5 #f)
(test-balanced b7 #t)
; d.  Suppose we change the representation of mobiles so that the constructors are
; 
(define (make-mobile left right)
  (cons left right))
(define (make-branch length structure)
  (cons length structure))

; How much do you need to change your programs to convert to the new representation? 
; 
; 只有这些：
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))  