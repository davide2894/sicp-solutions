#|
    Notes:
    0. what is a mathematical square root function?
        -> A function of x such that y >= 0 and square of y = x

    0.5 how can we compute a square root?
        -> to compute the square root of a number we can use Newton's successive approximation
        that tries to find a sqrroot of a number by starting with a guess, 
        and that continuosly improves that guess by averaging
        - the sum of the radicand and the guess
        - with the guess itself
        ( ( radicand / guess ) + guess ) / 2 
        sqr-iter does this.

    1. what does the good-enough? procedure do exactly? This procedure tests wheter the square
    of a guess is close enough to a radicand. To check this closeness it uses an arbitrary
    mark (0.001)
    In other words if square-of-guess - radicand < 0.001 then our guess is good enough 
    to be considered the square root of said radicand

    2. why the test says that this procedure will not be effective 
    for finding/evaluaing very small numbers? Don't know, need to check by compiling this
    procedure 

    3. what does it mean that in real computers, arithmetic operations 
    are performed with limited precision. Thus good-enough? procedure 
    is inadequate for very large numbers?
    4. how should I explain that good-enough? procedure fails with small and large numbers?
    5. implement an altenative good-enough? procedure that:
    - watches how guess changes from one iteration to another
    - stops to watch when this change is a very small fraction fo the guess
|#