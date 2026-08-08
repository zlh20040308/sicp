(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; 其实理解来就很简单，函数是一等民，是可以被当作值返回的