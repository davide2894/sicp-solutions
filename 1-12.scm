#lang scheme 
;Write a procedure that computes elements of Pascal’s triangle by means of a recursive process.

; pseudocode
; pascalTriangle(Row, Column)
;     if(row == 0)
;         return 1
;     else if(column < 1 || column > row)
;         return 0
;     else 
;         return pascalTriangle(row-1, column) + pascalTriangle(row-1, column-1)


(define (pascalTriangle row column)
    (cond
       [(= row 1) 1]
       [(or 
            (= column 1)
            (= column row)) 1]
        [else
         (+ (pascalTriangle(- row 1) column)
            (pascalTriangle(- row 1) (- column 1)))]))

(pascalTriangle 1 1) 
(pascalTriangle 2 1)
(pascalTriangle 2 2)
(pascalTriangle 3 1)
(pascalTriangle 3 2)
(pascalTriangle 3 3)
(pascalTriangle 4 1)
(pascalTriangle 4 2)
(pascalTriangle 5 3)