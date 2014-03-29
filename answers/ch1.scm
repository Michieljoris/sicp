;;Answers to exercises in SICP

;;Ex1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) ( - 2 7)))

;; Ex1.3
(define (square a) (* a a))
(define (sum-of-squares a b) (+ (square a) (square b)))

(define (square-largest a b c)
  (cond 
   ((and (<= a b) (<= a c)) (sum-of-squares b c))
   ((and (<= b a) (<= b c)) (sum-of-squares a c))
   ((and (<= c b) (<= c a)) (sum-of-squares b a))i
   )
  ) 

;; Ex1.4
 (define (a-plus-abs-b a b)
            ((if (> b 0) + -) a b))

;; Operator - is applied to a and b if b <= 0

;; Ex1.5
;; The applicative order interpreter will hang, evaluating p forever.
;; The normal-order interpreter returns 0.
;; (define (p) (p))
;; (define (test x y)
;;   (if (= x 0)
;;       0
;;       y
;;       )
;;   )
;; (test 0 (p))

;Ex1.6

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)  
          guess   
          (new-sqrt-iter (improve guess x)
                      x)))


(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
       (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (msqrt x)
  (sqrt-iter 1.0 x))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

(msqrt 100)

;; (new-sqrt 100)				;
;The new-if hangs or crashes!!!
;All the args of new-if always get evaluated by Eva Lu Ator's new-if's
;function and we don't want to evaluate the third arg if the guess
;is good-enough. 


;; Ex1.7
; This should return false, but returns true:
(if  (good-enough? .001 .001)
     "wrong answer!!") 

(define big-number (expt 10 1000))
(good-enough? (+ 0 big-number) (square big-number))
;returns true as it should. 

;but this should return false, but returns true as well:
(if  (good-enough? (+ big-number 1 (square big-number ))
     "wrong answer" "ok"
     )
; In guile this works ok by the way
     
; In this case the comparision operator < can't deal with big numbers:
(< (expt 10 10 ) 0.003) ; #f
(< (expt 10 100 ) 0.003) ; #t
; In guile this works ok by the way

; Some overflow problem, but I can imagine that even if numbers get
; converted into scientific notation numbers end up being equal
; despite being actually being different to a large extent but
; precision was lost, depends on scheme used. Guile was ok
(define (good-enough2? last-guess guess)
  (< (abs (- last-guess guess )) 0.001))


(define (sqrt-iter2 last-guess guess x)
  (if (good-enough2? last-guess guess)  
          guess   
          (sqrt-iter2 guess
                      (improve guess x)
                      x)))

(define (msqrt2 x)
  (sqrt-iter2 0 1.0 x))

(msqrt 0.001) ;0.041245
(msqrt2 0.001) ; 0.031622..
; system function
(sqrt 0.001) ; 0.031622..

;msqrt2 uses the change of guess to decided good-enough?. Works much better for
;small numbers. You can set the precision you want in good-enough?.
;Not better for big numbers. Decimal numbers still get eaten by the
;scientific notation or overflows.

;Ex1.8
(define (cube-iter guess x)
  (if (cube-good-enough? guess x)
      guess
      (cube-iter (cube-improve guess x)
                 x)))

(define (cube-improve y x)
 (/ (+ (/ x (square y)) (* 2 y)) 3))

(define (cube-good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (cube x) (* x x x))

(define (cube-root x)
 (cube-iter 1 x))
(cube-root 1000)
;Ex1.9
(define (inc x) (+ x 1))
;recursive
(+ 4 5)
(inc (+ 3 5))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
;iterative
(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)

;; ;Ex1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
(A 1 10) ; 1024
(A 2 4) ; 65536
(A 3 3) ; 65536

(define (f n) (A 0 n))
(A 0 1) ;2
(f 1)
(A 0 2) ;4 etc so:
(A 0 3) ;6 etc so:
(A 0 4) ;16 etc so:
(define (fm n) (* 2 n)) ; == (A 0 n)
;the value is doubled

(define (g n) (A 1 n))
(A 1 1) ; 2  2^1
(A 1 2) 
    (A 0 (A 1 1))
    (A 0 2) ; 4  2^2
(A 1 3) 
;;     (A 0 (A 1 2));8  2^3 etc so:
(define (gm n) (expt 2 n)) == (A 1 n)
;the exponent of 2 is increasing linearly.

(define (h n) (A 2 n))
(A 2 1) ;2 

(A 2 2) ;=
(A 1 (A 2 1)) 
(A 1 2)
(A 0 (A 1 1))
(A 0 2) ;4 2^2 

(A 2 3) ;= 
(A 1 (A 2 2));16 2^2^2 

(A 2 4) ;=65536 2^2^2^2

(A 2 5) ;=2^65536 = 2^2^2^2^2
;mathematical notation is 2^^n I think.
;the number of exponents is increasing linearly. 
(A 3 1) ; 2
(A 3 2) ; 2^2
(A 3 3) ; 2^2^2^2
;the number of exponents is doubling 2^^(2^(n-1))

;; Ex.1.11
(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 1000)
;recursive
(define (f n)
  (cond ((< n 3) n)
        ((>= n 3)  
         (+ (* 1 (f (- n 1)))
            (* 2 (f (- n 2)))
            (* 3 (f (- n 3)))
            ))))
;iterative
(define (fi n)
  (cond ((< n 3) n)
        (else (f-iterate 0 1 2 (- n 3)))))

(define (f-iterate n0 n1 n2 counter)
  (define n (+ (* 1  n2) 
               (* 2  n1) 
               (* 3  n0)))
  (cond ((> counter 0) (f-iterate n1 n2 n (- counter 1)))
         (else n)))
(f 10);1892
(fi 10);1892
(f 3)
(fi 3)

;Ex1.12
(define (pt r n)
  (cond
   ((= n 0) 1)
   ((= n r) 1)
   (else (+ (pt (- r 1) (- n 1)) (pt (- r 1) n)))))
(pt 4 2) ;6

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
;; ;Ex1.14
;; ;Space used is linear. One more cent means one more depth at most when the
;; ;procedure is counting cents and not deducting larger coins.
;; ;The number of nodes in a tree is 2^n-1 where n is the depth. So if the
;; ;depth increases linearly with increasing amount then number of nodes
;; ;visited or number of times  the function is called is at most also
;; ;2^n-1. So the upperbound is exponential. It is less for count-change
;; ;because some branches are cut off because they are not resulting in
;; ;a valid change. What is the lowerbound? How many get cut off?

;; ;Ex1.15
(define (cube x) (* x x x))
(define c 0)
(define (p x) (set! c (+ c 1)) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
(sine 12.15)
(= c 5)
;; a) 5   12.15/3^5 = 0.05
;; b) The number of steps grows logarithmically. The number of times p gets called
;; ;is exactly (int(log3(10*a))+1. So if a grows by 1 time grows by log3.
;; ;The stack grows by the same proportion. Every time angle gets divided by 3
;; ;another return to p has to be remembered.

;; ;Ex1.16
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (expt-it b n)
  (expt-iterate 1 b n))

(define (expt-iterate a b n)
  (cond ((= n 0) a)
        ((even? n) (expt-iterate a (square b) (/ n 2)))
        (else (expt-iterate (* a b) b (- n 1)))))
;; ;Ex1.17
(define (m* a b)
  (if (= b 0)
      0
      (+ a (m* a (- b 1)))))

(define (halve n) (/ n 2))
(define (double n) (* n 2))

(define (fast-* a b)
  (cond ((= a 0) 0)
	((= b 0) 0)
        ((even? a) (double (fast-* (halve a) b)))
	(else (+ b (fast-* b (- a 1))))))


;; ;Ex1.18
(define (*-it a b)
  (*-iterative 0 a b))

(define (*-iterative r a b)
  (cond ((= a 0) r)
	((= b 0) r)
	((even? a) (*-iterative r (halve a) (double b)))
	(else (*-iterative (+ r a) a (- b 1)))))
;; ;Ex1.19
;; (define (fib n)
;;   (fib-iter 1 0 0 1 n))

;; (define (fib-iter a b p q count)
;;   (cond ((= count 0) b)
;; 	((even? count)
;; 	 (fib-iter a
;; 		   b
;; 		   (+ (square p) (square q))
;; 		   (+ (* 2 p q) (square q))
;; 		   (/ count 2)))
;; 	(else (fib-iter (+ (* b q) (* a q) (* a p))
;; 			(+ (* b p) (* a q))
;; 			p
;; 			q
;; 			(- count 1)))))
;; ;Ex1.20
;; (define (rem a b) (remainder a b))
;; (gcd 206 40)
;; (gcd 40
;;      (rem 206 40))  ;40 6
;; (gcd (rem 206 40)  ;if does an evaluation of b, now a in the new call
;;      (rem 40 (rem 206 40))) ;6 4
;; (gcd (rem 40 (rem 206 40)) ;if does 2 rem's
;;      (rem (rem 206 40) (rem 40 (rem 206 40)))) ;4 2
;; (gcd (rem (rem 206 40) (rem 40 (rem 206 40))) ;if does 4 remainders
;;      (rem (rem 40 (rem 206 40)) (rem (rem 206 40) (rem 40 (rem 206 40))))) ;2 0
;; ;;in last call to gcd if does 7 remainder calls, then 4 to evaluate a
;; ;total of 18 calls to remainder, compared to 4 in applicative order
;; ;if I counted right, assuming that when 'if' evaluates b, it doesn't get.
;; ;remembered for further b's in the function.
