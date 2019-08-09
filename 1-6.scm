(define (sqrt (x) 
    (sqrt-iter 1.0 x)
))

;begins: sqr-iter with if and new if
(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)
    )
)
;ends: sqr-iter with if and new if

(define (new-if predicate then-clause else-clause)
        (cond 
            (predicate then-clause)
            (else else-clause)
        )
)

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

#|
    QUESTION
    What happens when Alyssa attempts to use this to compute square roots? Explain.
    
    TODO
    [x] write down computation procedure for sqrt by using primitive if
    [x] write down computation procedure for sqrt by using new-if procedure
|#

; write down computation procedure for sqrt by using primitive if 
(sqrt 2)
(sqrt-iter 1.0 2)
(if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x))
(if (((< (abs (- (square guess) x)) 0.001)) guess x)
    guess
    (sqrt-iter (improve guess x) x))
> guess ;hypothetically


; write down computation procedure for sqrt by using new-if procedure
(sqrt 2)

(sqrt-iter 1.0 2)

(new-if (good-enough? 1.0 2)
        1.0
        (sqrt-iter (1.0 2) 2))

(new-if ((< (abs (- (square 1.0) 2)) 0.001))
        1.0
        (new-if (good-enough? 1.0 3)
                1.0
                (new-if (good-enough? 1.0 2)
                        1.0
                        (sqrt-iter (1.0 2) 2)))) ; and so on...

#|
    ANSWER
    The scheme interpreter follows the applicative order which means that
    - first it evaluates subprocedures and arguments 
    - then when subprocedures are reduced to primitive it evaluates function calls to
    Since new-if is a procedure itself, the interpreter proceeds to evaluate its subexpression.
    One of new-if subprocedures is sqr-iter, which means it proceeds to evaluates it, 
    which in turn calls new-if again and the process repeats.
    And so on and so forth in a recursive loop
|#