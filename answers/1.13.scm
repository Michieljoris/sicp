;; ;Ex1.13
;; ;See notebook. In short:
;; ;Assume the hint proof. Is fib(n-2) + fib(n-1) = fib (n)?
;; ;After filling in the vars> left of = can indeed be reduced to right of =
;; Just rewrite the n and n-1 factors as n-2 factors and simplify.
;; ;It's true for n=3 and indeed for general n
;; ;For fib(n) to be closest integer to a=phi^n/sqrt5 then -.5<fib(n)-a<.5
;; ;then -.5<-epsilon^n/sqrt5<.5. This is true: -0.5<1/sqrt5<0.5 Since epsilon<1 then
;; ;epsilon^n<1 for every n>0 so it will always be between 0.5 and -0.5
(define (fib n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(define (fib2 n)
  (expt (/ (/ (+ 1 (sqrt 5)) 2) (sqrt 5)) n))
  ;; (expt (/ (+ (sqrt 5) 5) 10) n)) (/ (expt (/ (+ 1 (sqrt 5)) 2) n)
  ;; (sqrt 5))
