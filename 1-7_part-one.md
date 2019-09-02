# Questions
0. What is a mathematical square root function?

1. How can we compute a square root?

2. What does the good-enough? procedure do exactly?

3. Why the test says that this procedure will not be effective 
for finding/evaluaing very small numbers? 

4. What does it mean that in real computers, arithmetic operations 
are performed with limited precision? 

5. Why this good-enough? procedure is inadequate for very large numbers?

6. Implement an altenative good-enough? procedure that:
  - watches how guess changes from one iteration to another
  - stops to watch when this change is a very small fraction fo the guess


# Answers
0. A mathematical square root is a function of x such that y >= 0 and square of y = x

1. To compute the square root of a number we can use Newton's successive approximation. This technique tries to find the square root of a number by starting with a guess. Then it tries to continuosly improve that guess by averaging what follows:
  - the sum of the radicand and the guess
  - with the guess itself
( ( radicand / guess ) + guess ) / 2 
sqr-iter does this.

2. The good-enough? procedure procedure tests wheter the square of a guess is close enough to a radicand. To check this closeness it uses an arbitrary mark (0.001). In other words if square-of-guess - radicand < 0.001 then our guess is good enough to be considered the square root of said radicand.

3. Why the test says that the good-enough? procedure will not be effective for finding/evaluaing very small numbers?
I tried to compute the square root procedure with the following examples:
  - large numbers: sometimes the compiler succeeds to calculate the result, sometimes it doesn't finish computation
    * Example 1:
      * (sqrt 20000) -> 44.721359560127915 
      * (square 44.721359560127915) -> 2000.0000009062444
    * Example 2:
      * (sqrt 123456789876545678765) -> computation doesn't finish
  - very small numbers: computation is inaccurate
    * Example 1:
      * (sqrt 0.00000000000000001) -> 0.03125000000000011
      * (square 0.03125000000000011) -> 0.000976562500000007
    * Example 2:
      * (sqrt 0.001234567890987654323456) -> 0.04341893297724523
      * (square 0.04341893297724523) -> 0.0018852037408825133 

4. The root problem here is floating point approximation error. The facts are the following:
  - computers have limited memory to store numbers. A 32-bits system can use up to 23 digits to store a number. 
  - this means that infinite real numbers must be stored by using an approximation of said number in base 2, which means that computer can't store a number with a perfect precision. For example: the number 0.1 converts to a inifinite binary number such as 0.00011, where 0011 is the recurring part.
  - There will always be an approximation to compensate for the finite memory it can use

5. Compute manually a large number using this good-enough? procedure to report why the test fails for very large numbers