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
(define (gm n) (expt 2 n)); == (A 1 n)
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

;; (A 2 5) ;=2^65536 = 2^2^2^2^2
;mathematical notation is 2^^n I think.
;the number of exponents is increasing linearly. 
(A 3 1) ; 2
(A 3 2) ; 2^2
(A 3 3) ; 2^2^2^2
;the number of exponents is doubling 2^^(2^(n-1))
