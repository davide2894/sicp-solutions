#lang racket
(define (sqrt x) (sqrt-iter 1.0 x) )

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (calc-good-enough? guess x)
  (abs (- (square guess) x)))

(define (square x) (* x x) ) 

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2) )

(sqrt 1234567890)
;(calc-good-enough? 35136.41828644462 1234567890);
;(improve 35136.41828644462 1234567890)
(good-enough? 35136.41828645232 1234567890)