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


(define (f n) (A 0 n))
; (f n) computes to 2n because we compute the second condition in A procedure
(A 0 n)
((= x 0) (* 2 n))
(* 2 n)
> 2n


(define (g n) (A 1 n))
; (g n) computes to the following:
; 0 if n = 0
; 2 if n = 2^n
; -----------------
; examples
; (g, 2) -> 4
; (g, 3) -> 8
; (g, 4) --> 16
; (g, 5) -> 32
; (g, 6) -> 64
; (g, 7) -> 128
; (g, 8) -> 256
; (g, 9) -> 512
; (g, 10) -> 1024


(define (h n) (A 2 n))
; (h n) computes to 2^2^2^...(n-1 times)     for n > 1
; if = 0 -> 0
; if = 1 -> 2
; if = 2 -> 4
; if = 3 -> 16 
; if = 4 -> 65356 
; example of computation
(h 4)
    (A 2 4)
    (A (- 2 1) (A 2 (- 4 1)))
    (A 1 (A 2 3))
    (A 1 (A 1 (A 2 2)))
    (A 1 (A 1 (A 1 (A 2 1))))
    (A 1 (A 1 (A 1 2)))
    (A 1 (A 1 (A 0 (A 1 1))))
    (A 1 (A 1 (A 0 2)))
    (A 1 (A 1 4))
    (A 1 (A 0 (A 1 3)))
    (A 1 (A 0 (A 0 (A 1 2))))
    (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
    (A 1 (A 0 (A 0 (A 0 2))))
    (A 1 (A 0 (A 0 4)))
    (A 1 (A 0 8))
    (A 1 16)
    (A 0 (A 1 15))
    (A 0 (A 0 (A 1 14)))
    (A 0 (A 0 (A 1 (A 0 (A 1 13)))))
    (A 0 (A 0 (A 0 (A 0 (A 1 12)))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 11))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 10)))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 9))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 8)))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 7))))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 6)))))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 32)))))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 64))))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 128)))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 256))))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 512)))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 1024))))))
    (A 0 (A 0 (A 0 (A 0 (A 0 2048)))))
    (A 0 (A 0 (A 0 (A 0 4096))))
    (A 0 (A 0 (A 0 8192)))
    (A 0 (A 0 16384))
    (A 0 32768)
    65536