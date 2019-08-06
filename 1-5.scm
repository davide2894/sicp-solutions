(define (p) (p))

(define (test x y) 
  (if (= x 0) 
      0 
      y))

(test 0 (p))

;[] then evaluate the same procedure by using normal order instead (eager)
;[] evaluate expression by using applicative order manually (lazy)

; normal order 
(test 0 (p))
(if (= 0 0) 
    0 
    (p))
0

; applicative order 
(test 0 (p))
evaluate (p), but the procedure p has in its body the procedure itself.
So (p) calls (p), which calls (p), and so on. This is a loop So it doesn't evaluate? 