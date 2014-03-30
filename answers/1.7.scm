;; Ex1.7
; This should return false, but returns true:
(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
       (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs
 (- (square guess) x)) 0.001))

(define (square x) (* x x))
(if  (good-enough? .001 .001)
     "wrong answer!!") 

(define big-number (expt 10.0 1000))
(good-enough? (+ 0 big-number) (square big-number))
;returns true as it should. 

;but this should return false, but returns true as well:
(if  (good-enough? (+ big-number 1) (square big-number ))
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

;; (msqrt 0.001) ;0.041245
(msqrt2 0.001) ; 0.031622..
; system function
(sqrt 0.001) ; 0.031622..

;msqrt2 uses the change of guess to decided good-enough?. Works much better for
;small numbers. You can set the precision you want in good-enough?.
;Not better for big numbers. Decimal numbers still get eaten by the
;scientific notation or overflows.
