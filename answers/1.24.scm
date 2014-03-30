;;Ex. 1.24
(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else #f)))


(define (runtime) (/ (tms:clock (times)) 1000000))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime n (- (runtime) start-time))
      #f
      ))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (display "ms")
  )

; (prime? 100043)
; (if  (timed-prime-test 1999) #t #f)
; (if  (timed-prime-test 1998) #t #f)

;; from needs to be uneven
(define (search-for-primes from num)
  (cond ((= num 0) (newline) (display "done")) 
	(#t (search-for-primes (+ from 2)
			       (if (timed-prime-test from) (- num 1) num)
			       ))
	)
  )
  
(sqrt 10) ;~3.16
(search-for-primes 10000000001 3) ;50ms from 70ms
(search-for-primes 100000000001 3) ;170ms from 250ms
(search-for-primes 1000000000001 3) ;510ms from 740ms
(search-for-primes 10000000000001 3) ;1590ms from 2290ms
(search-for-primes 100000000000001 3) ; 4970ms from 7320ms
(search-for-primes 100000000000000000000000000000000000000000001 3) ; 4970ms from 7320ms
