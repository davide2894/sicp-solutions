# Number to convert
0.1

## 1. Convert integer part into binary
0 / 2 = 0 -> 0 in base 2

## 2. Convert decimal part into binary
0.1 * 2 = 0.2 | 0
0.2 * 2 = 0.4 | 0
0.4 * 2 = 0.8 | 0
0.8 * 2 = 1.6 | 1
0.6 * 2 = 1.2 | 1
0.2 * 2 = 0.4 | 0
0.4 * 2 = 0.8 | 0
0.8 * 2 = 1.6 | 1
0.6 * 2 = 1.2 | 1
0.2 * 2 = 0.4 | 0
...
0110 is recurring so we can stop here

## 3. Put converted integer and decimal parts together
0.0001100110011001100110...

## 4. Normalize using scientific notation
It means that the part before the point should be only one number different from 0 
0001.10011001100110011001...
that becomes 
1.10011001100110011001 * 2^-4 base 2

## 5. Add bias of excess to exponent
-4+127 = 123

## 6. Convert exponent to binary
123/2 = 61 | 1
61/2 = 30  | 1
30/2 = 15  | 0
15/2 = 7   | 1
7/2 = 3    | 1
3/2 = 1    | 1
1/2 = 0    | 1

127 base 10 -> 110111 base 2

## 7. Put things together
Let's say we have a 32-bit system. IEEE 754 standard says we can place bits of memory to a floating point number as follows:
- 1 bit for the sign
- 8 bit for the exponent
- 23 bit for the Mantissa (part at the right of the point)

Sign is positive so we assign 0 to it.

0 | 1101111 | 1001 1001 1001 1001 1001 1001 100