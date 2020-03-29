#lang scheme 

;Exercise 1.11
;A function f is defined by the rule that f(n)=n if n<3 and f(n)=f(n−1)+2f(n−2)+3f(n−3) if n≥3
;Write a procedure that computes f by means of a recursive process.
;Write a procedure that computes f by means of an iterative process.

; recursive implementation
(define (f n)
    (cond ((< n 3) n)
    (else 
        (+ (f (- n 1)) 
           (* 2 (f (- n 2)))
           (* 3 (f (- n 3)))))))  

; iterative procedure --> in a loop, much like a for loop so like the following
(f 0)
> 0

(f 1)
> 1

(f 2)
> 2

iter 2 1 0

iter a b c counter
(f 3)
newValue = a + 2*b + 3*c
b = a
c = b
return a b c

(f 4)
f(4) + 2*f(3) + 2*f(2)

return res;


(f 5)
res + 2*(res-2) + 3*(res-3)
11 + 2*(11-2) + 3*(11-3)
11 + 2*9 + 3*(8)
11+18+24


if n < 3
return n
iter a b c counter
else 
    if n = 3
        return iter 2 1 0
    else 
        iter 2 1 0 counter

(f 5)
    iter 2 1 0 (5 - 3)

    a = a + 2*b + 3*c
    b = a
    c = b
    iter a b c counter-1

    if counter === 0
        return a


if n < 3
    return n
else 
    iter 2 1 0 n-3

iter a b c counter
    if(counter === 0)
        return a
    else 
        a = a + 2b + 3c
        b = a
        c = b
        iter a b c counter-1

now let's translate this procedure in scheme
(define (f n)
    (cond
        ((< n 3) n)
        (else (iter 2 1 0 (- n 3)))
    ))

(define (iter a b c counter)
  (cond ((< counter 0) a)
  (else (iter (+ a (* 2 b) (* 3 c))
               a
               b
               (- counter 1)
        ))))

(f 5)
