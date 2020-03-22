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



;Consider the following procedures, where A is the procedure defined above:
(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))
; Give concise mathematical definitions for the functions computed by the procedures f, g, and h 
; for positive integer values of n. For example, (k n) computes 5n2.

; (f n) computes to 2n because we compute the second condition in 
(A 0 n)
((= x 0) (* 2 y))
(* 2 y)
> 2y

; (g n) computes to 



(define (A x y)
  (cond ((= y 0) 0)
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (g n) (A 1 n))
(g 5)
n = y
if(n = 0)
    (g n) computes to 0
else if(n = 1)
    (g n) computes to 2
else 
    (g n) computes to (* 2 ((n - 1) (n -1)))
    (g, 2) -> 4
    (g, 3) -> 8 -> (* 2 (* (- 3 1) (- 3 1))) -> (* 2 (* 2 2)) -> (* 2 4) -> 8
    (g, 4) --> 16
    (g, 5) -> 32
    (g, 6) -> 64
    (g, 7) -> 128
    (g, 8) -> 256
    (g, 9) -> 512
    (g, 10) -> 1024


