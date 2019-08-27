#|
    Notes:
    0. what is a mathematical square root function?
        -> A function of x such that y >= 0 and square of y = x
    0.5 how can we compute a square root?
        -> to compute the square root of a number we can use Newton's successive approximation
    1. what does the good-enough? procedure do exactly?
    2. why the test says that this procedure will not be effective 
    for finding/evaluaing very small numbers?
    3. what does it mean that in real computers, arithmetic operations 
    are performed with limited precision. Thus good-enough? procedure 
    is inadequate for very large numbers?
    4. how should I explain that good-enough? procedure fails with small and large numbers?
    5. implement an altenative good-enough? procedure that:
    - watches how guess changes from one iteration to another
    - stops to watch when this change is a very small fraction fo the guess
|#