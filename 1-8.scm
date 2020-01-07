;Newton’s method for cube roots is based on the fact that 
;if y is an approximation to the cube root of x, then a better approximation is given by the value
; ( (x/y*y) + 2y ) /3.   

;Use this formula to implement a cube-root procedure analogous to the square-root procedure

;Below the improved version of sqrt adapted to the proposed cube approximation
(define (cube-root x) (cube-root-iter 1.0 x) )

(define (cube-root-iter guess x)
    (if (good-enough? guess (improve guess x))
        guess
        (cube-root-iter (improve guess x) x)))

(define (good-enough? guess improved-guess)
  (< (abs (/ (- guess improved-guess) improved-guess)) 0.00000001))

(define (improve guess x)
  (/ (+ (/ (x (* guess guess))) (* 2 guess)) 3))


(cube-root 27)