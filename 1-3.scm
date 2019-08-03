#lang sicp

(define (square x) (* x x))

(define (sqr-sum-largest-two a b c)
    (cond
         ((and (< a b) (< a c)) (square-sum b c))
         ((and (< b a) (< b c)) (square-sum a c))
         ((and (< c a) (< c b)) (square-sum a b))))

(define (square-sum x y)
  (+ (square x) (square y))
  )

(sqr-sum-largest-two 1 2 3)