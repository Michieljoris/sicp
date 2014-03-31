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

;;racket
(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100000)
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
(search-for-primes 1001 3) ; 3 digits
(search-for-primes 10001 3) ; 4 digits
(search-for-primes 100001 3) 
(search-for-primes 1000001 3) 
(search-for-primes 10000001 3) ;6 digits
(search-for-primes 100000001 3) ; 8 digits

;;Results

;; 1009 *** 114ms  3 digits
;; 1013 *** 112ms
;; 1019 *** 117ms
;; done
;; 10007 *** 151ms 4
;; 10009 *** 145ms
;; 10037 *** 148ms
;; done
;; 100003 *** 177ms 5
;; 100019 *** 182ms
;; 100043 *** 182ms
;; done
;; 1000003 *** 210ms 6 
;; 1000033 *** 212ms
;; 1000037 *** 220ms
;; done
;; 10000019 *** 269ms 7
;; 10000079 *** 286ms
;; 10000103 *** 284ms
;; done
;; 100000007 *** 332ms 8
;; 100000037 *** 333ms
;; 100000039 *** 335ms

;;Twice as many digits, only twice as slow, which is ~ log30(n) =
;;log(n)/log(30)=.3*log(n) = theta(log(n))
