;Observe that our model of evaluation allows for combinations whose operators are compound expressions. 
;Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;This procedure takes in two arguments: a and b
;If it evaluates that b is greater than zero it procedes to calculate the sum of a and b
;Otherwise it calculates the difference between the two
;It computes the mathematical equivalent of a + |b|