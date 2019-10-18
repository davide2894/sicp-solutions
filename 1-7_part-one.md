# Questions
0. What is a mathematical square root function?

1. How can we compute a square root?

2. What does the good-enough? procedure do exactly?

3. Why the test says that this procedure will not be effective 
for finding/evaluaing very small numbers? 

4. What does it mean that in real computers, arithmetic operations 
are performed with limited precision? 

5. Why this good-enough? procedure is inadequate for very large numbers?

6. Design a sqrt procedure that implements an altenative good-enough? procedure that:
  - watches how guess changes from one iteration to another
  - stops to watch when this change is a very small fraction of the guess

# Answers
0. A mathematical square root is a function of x such that y >= 0 and square of y = x

1. To compute the square root of a number we can use Newton's successive approximation. This technique tries to find the square root of a number by starting with a guess. Then it tries to continuosly improve that guess by averaging what follows:
  - the sum of the radicand and the guess
  - with the guess itself
( ( radicand / guess ) + guess ) / 2 
sqr-iter does this.

2. The good-enough? procedure procedure tests wheter the square of a guess is close enough to a radicand. To check this closeness it uses an arbitrary mark (0.001). In other words if square-of-guess - radicand < 0.001 then our guess is good enough to be considered the square root of said radicand.

Example of correct sqrt computation
| radicand (x) | guess -> x         | good-enough?                                   | improved guess     |
| ------------ | ------------------ | ---------------------------------------------- |:------------------:|
| 1234567890   | 1.0                | 123456789.0-> false                            | 617283945.5        |
|              | 617283945.5        | 3.810394681374791e+017 -> false                | 308641973.75       |
|              | 308641973.75       | 9.52598667257278e+016 -> false                 | 154320988.875      |
|              | 154320988.875      | 23814966372789984.0 -> false                   | 77160498.43749993  |
|              | 77160498.43749993  | 5953741284555538.0 -> false                    | 38580257.21874941  |
|              | 38580257.21874941  | 1488435012496976.0 -> false                    | 19290144.609370288 |
|              | 19290144.609370288 | 372108444482527.56 -> false                    | 9645104.304649763  |
|              | 9645104.304649763  | 93026802479683.39 -> false                     | 4822616.1520417845 |
|              | 4822616.1520417845 | 23256391982044.31 -> false                     | 2411436.073756051  |
|              | 2411436.073756051  | 5813789369921.998 -> false                     | 1205974.01876024   |
|              | 1205974.01876024   | 1453138766034.7236 -> false                    | 603498.8644743405  |
|              | 603498.8644743405  | 362976311531.81836 -> false                    | 302772.2741700008  |
|              | 302772.2741700008  | 90436482116.07414 -> false                     | 153424.91010902377 |
|              | 153424.91010902377 | 22304635151.962025 -> false                    | 80735.81700115639  |
|              | 80735.81700115639  | 5283704256.8442135 -> false                    | 48013.63462224683  |
|              | 48013.63462224683  | 1070741219.6386194 -> false                    | 36863.24757008126  |
|              | 36863.24757008126  | 124331131.41310167 -> false                    | 35176.86425324605  |
|              | 35176.86425324605  | 2843888.6912999153 -> false                    | 35136.44153860574  |
|              | 35136.44153860574  | 1633.995858669281 -> false                     | 35136.41828645232  |
|              | 35136.41828645232  | 0.0005407333374023438 -> true -> correct guess | 35136.41828644462  |


1. Why the test says that the good-enough? procedure will not be effective for finding/evaluaing very small numbers?
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

5. Compute manually a large number using this good-enough? procedure to report why the test fails for very large numbers:
   * guess = 1.0
   * x = 98765456789812345

| radicand (x)      | guess -> x             | good-enough?              | improved guess         |
| ----------------- | ---------------------- | ------------------------- | ---------------------- |
| 98765456789812345 | 1.0                    | 9.876545678981235e+016    | 4.938272839490618e+016 |
|                   | 4.938272839490618e+016 | 2.4386538637250727e+033   | 2.469136419745309e+016 |
|                   | 2.469136419745309e+016 | 6.096634659312681e+032    | 12345682098726546.0    |
|                   | 12345682098726546.0    | 1.5241586648281701e+032   | 6172841049363277.0     |
|                   | 6172841049363277.0     | 3.8103966620704225e+031   | 3086420524681646.5     |
|                   | 3086420524681646.5     | 9.52599165517603e+030     | 1543210262340839.2     |
|                   | 1543210262340839.2     | 2.381497913793983e+030    | 771605131170451.6      |
|                   | 771605131170451.6      | 5.953744784484711e+029    | 385802565585289.8      |
|                   | 385802565585289.8      | 1.4884361961209309e+029   | 192901282792772.9      |
|                   | 192901282792772.9      | 3.7210904902998577e+028   | 96450641396642.45      |
|                   | 96450641396642.45      | 9.302726225724953e+027    | 48225320698833.23      |
|                   | 48225320698833.23      | 2.325681556406547e+027    | 24112660350440.613     |
|                   | 24112660350440.613     | 5.8142038907694535e+026   | 12056330177268.307     |
|                   | 12056330177268.307     | 1.4535509724454498e+026   | 6028165092730.153      |
|                   | 6028165092730.153      | 3.6338774286444882e+025   | 3014082554557.0767     |
|                   | 3014082554557.0767     | 9.084693546919855e+024    | 1507041293662.5383     |
|                   | 1507041293662.5383     | 2.2711733620386003e+024   | 753520679599.2687      |
|                   | 753520679599.2687      | 5.6779331581828694e+023   | 376760405335.63055     |
|                   | 376760405335.63055     | 1.419484030286674e+023    | 188380202667.81693     |
|                   | 188380202667.81693     | 3.5487100757166548e+022   | 94190101333.91174      |
|                   | 94190101333.91174      | 8.871775189291329e+021    | 47095050666.962425     |
|                   | 47095050666.962425     | 2.2179437973225233e+021   | 23547525333.49432      |
|                   | 23547525333.49432      | 5.544859493303222e+020    | 11773762666.773375     |
|                   | 11773762666.773375     | 1.3862148733227192e+020   | 5886881333.4391165     |
|                   | 5886881333.4391165     | 3.465537183275934e+019    | 2943440666.8244157     |
|                   | 2943440666.8244157     | 8.663842957881192e+018    | 1471720333.621923      |
|                   | 1471720333.621923      | 2.1659607391616563e+018   | 735860167.2303916      |
|                   | 735860167.2303916      | 5.41490184481772e+017     | 367930084.4540562      |
|                   | 367930084.4540562      | 1.3537254581180104e+017   | 183965043.9047489      |
|                   | 183965043.9047489      | 33843136144308296.0       | 91982525.30781595      |
|                   | 91982525.30781595      | 8460783727435112.0        | 45991269.36479075      |
|                   | 45991269.36479075      | 2115195623216850.5        | 22995648.104158975     |
|                   | 22995648.104158975     | 528798597162420.25        | 11497850.895591017     |
|                   | 11497850.895591017     | 132199340649353.16        | 5748979.134693226      |
|                   | 5748979.134693226      | 33049526523248.07         | 2874596.940139336      |
|                   | 2874596.940139336      | 8262073000368.434         | 1437513.2076338741     |
|                   | 1437513.2076338741     | 2065209654231.8298        | 719186.0147898046      |
|                   | 719186.0147898046      | 515993955979.241          | 360451.31655596185     |
|                   | 360451.31655596185     | 128690583716.92622        | 181938.18897671168     |
|                   | 181938.18897671168     | 31866936718.125652        | 94361.91678955514      |
|                   | 94361.91678955514      | 7669603450.198927         | 53722.62229904797      |
|                   | 53722.62229904797      | 1651552256.6861663        | 38351.51618016969      |
|                   | 38351.51618016969      | 236270903.31781745        | 35271.18289936989      |
|                   | 35271.18289936989      | 9488453.12080288          | 35136.675741672996     |
|                   | 35136.675741672996     | 18092.175471544266        | 35136.418287387845     |
|                   | 35136.418287387845     | 0.06628298759460449       | 35136.41828644462      |
|                   | 35136.41828644462      | 2.384185791015625e-007    | 35136.41828644462      |
|                   | 35136.41828644462      | 2.384185791015625e-007    | 35136.41828644462      |