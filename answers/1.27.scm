;;Ex. 1.27
;; 561, 1105, 1729, 2465, 2821, and 6601

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define ( display-result r n)
  (cond (r (display "Probably a prime number: ") )
	(#t (display "Not a prime number"))
	)
  (display n) (newline) 
  )

(define (fermat-test n a)
  (cond 
   ((= a n) (display-result #t n) #f)
   ((= (expmod a n n) a) (fermat-test n (+ a 1)))
   (#t (display-result #f n))
   )
  )

(fermat-test 12 1)
(fermat-test 11 1)

(fermat-test 561 1)
(fermat-test 1105 1)
(fermat-test 1729 1)
(fermat-test 2465 1)
(fermat-test 2821 1)
(fermat-test 6601 1)

;; Not a prime number: 12
;; Probably a prime number: 11
;;But:
;; Probably a prime number: 561
;; Probably a prime number: 1105
;; Probably a prime number: 1729
;; Probably a prime number: 2465
;; Probably a prime number: 2821
;; Probably a prime number: 6601

;;Oops.
