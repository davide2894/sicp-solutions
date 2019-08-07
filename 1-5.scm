#|
  [x] evaluate expression by using applicative order manually (eager)
  [x] then evaluate the same procedure by using normal order instead (lazy)
|#

(define (p) (p))

(define (test x y) 
  (if (= x 0) 
      0 
      y))

(test 0 (p))


; ---- Answers -----

; Applicative order 
(test 0 (p))
#|
  Applicative order evaluation means that the interpreter
  - evaluates suibexpression before expanding the function calls
  - when a primitive is met in arguments evaluation, it proceeds to expand the function call
  - once functon calls are espanded code is evaluated 
  So in this case it first tries to evaluate the subexpression (p), which has body (p). 
  This means that this subexpression is a recursive calling expression, which means it goes in a loop and never resolves. 
  The procedure test never resolves.
|#


; normal order 
(test 0 (p))
(if (= 0 0) 
    0 
    (p))
> 0
#|
  Normal order means that the interpreter:
  - expands all the functions calls before evaluating the arguments
  - the arguments evaluation happens only when needed
  So in this case the intepreter:
  - expands the function call "test"
  - since there is the "if" primitive operator it evaluates the first condition (= 0 0 ) which is true,
    so it returns 0 and (p) is never touched.
  Because of this we avoid the side effect of evaluating (p), which would cause an infinite loop
|#

