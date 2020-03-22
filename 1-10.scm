#lang scheme

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; Write the value returned by the following procedures
(A 1 10) 
> 1024

(A 2 4)
> 65536

(A 2 4)
> 65536
