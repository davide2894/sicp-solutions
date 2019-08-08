; procedures 
(define (new-if predicate then-clause else-clause)
        (cond 
            (predicate then-clause)
            (else else-clause)
        )
)

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(sqrt-iter 1.0 x)

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    )
)

;What happens when Alyssa attempts to use this to compute square roots? Explain.
#|
    [] order procedures above in order of execution
    [] write down computation procedure for sqrt by using primitive if
    [] write down computation procedure for sqrt by using new-if procedure
|#
(sqrt 2)
; write down computation???

