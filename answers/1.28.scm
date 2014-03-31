;;Ex. 1.28

(define (square x) (* x x))


(define (expmod base exp m)
  (define (check result squared_and_modded) 
    (if (and (not (= result 1))
	     (not (= result (- m 1)))
	     (= squared_and_modded 1)
	     )
	0
	squared_and_modded
	)
    )
  (cond ((= exp 0) 1)
	((even? exp)
	 ;; (remainder (square2 (expmod base (/ exp 2) m))
	 (define result (expmod base (/ exp 2) m))
	 (check result
	  (remainder (square result) m)))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define ( display-result r n)
  (cond (r (display "Prime number: ") )
	(#t (display "Not a prime number: "))
	)
  (display n) (newline) 
  )

(define (do-test a n)
  (define  result (expmod a (- n 1) n))
  (= result 1)
  )

(define (fermat-test n a)
  (cond 
   ;;tried all numbers, it's a prime number
   ((= a n) (display-result #t n))
   ;;if passing test, test next number
   ((do-test a n) (fermat-test n (+ a 1)))
   ;;test failed, not a prime number
   (#t (display-result #f n))
   )
  )

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else #f)))


(fermat-test 12 1)
(fermat-test 11 1)

(fermat-test 561 1)
(fermat-test 1105 1)
(fermat-test 1729 1)
(fermat-test 2465 1)
(fermat-test 2821 1)
(fermat-test 6601 1)


;; Output
;; Not a prime number: 12
;; Prime number: 11
;; Not a prime number: 561
;; Not a prime number: 1105
;; Not a prime number: 1729
;; Not a prime number: 2465
;; Not a prime number: 2821
;; Not a prime number: 6601

