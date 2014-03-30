;; Ex1.3
(define (square a) (* a a))
(define (sum-of-squares a b) (+ (square a) (square b)))

(define (square-largest a b c)
  (cond 
   ((and (<= a b) (<= a c)) (sum-of-squares b c))
   ((and (<= b a) (<= b c)) (sum-of-squares a c))
   ((and (<= c b) (<= c a)) (sum-of-squares b a))
   )
  ) 

(square-largest 2 3 4) ;25

