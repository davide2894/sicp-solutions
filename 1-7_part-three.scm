; Design a sqrt procedure that implements an altenative good-enough? procedure that:
;  - watches how guess changes from one iteration to another
;  - stops to watch when this change is a very small fraction of the guess

(define (sqrt x) (sqrt-iter 1.0 x) )

(define (sqrt-iter guess x)
    (if (good-enough? guess (improve guess x))
        guess
        (sqrt-iter (improve guess x) x)))

(define (good-enough? guess improved-guess)
  (< (abs (/ (- guess improved-guess) improved-guess)) 0.00000001))

(define (square x) (* x x) ) 

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2) )

