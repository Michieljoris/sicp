;;Ex.1.23
(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next n)
  (if (= n 2) 3 (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

;; We can test whether a number is prime as follows: n is prime if and
;; only if n is its own smallest divisor.

(define (prime? n)
  (= n (smallest-divisor n)))

(define (runtime) (/ (tms:clock (times)) 1000000))

;;racket
(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
  ;; (newline)
  ;; (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
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

;;Roughly 3 times as slow when prime is 10 times as big
;;But only at 2/3 speed with even numbers removed. 

;;When all numbers get tested the even numbers need only one test to
;;be discarded. So we're not avoiding half of the work, but less.

;; Output on desktop
;; 10000000019 *** 6ms
;; 10000000033 *** 7ms
;; 10000000061 *** 6ms
;; done
;; 100000000003 *** 21ms
;; 100000000019 *** 21ms
;; 100000000057 *** 21ms
;; done
;; 1000000000039 *** 66ms
;; 1000000000061 *** 66ms
;; 1000000000063 *** 65ms
;; done
;; 10000000000037 *** 212ms
;; 10000000000051 *** 212ms
;; 10000000000099 *** 212ms
;; done
;; 100000000000031 *** 682ms
;; 100000000000067 *** 682ms
;; 100000000000097 *** 682ms
;; done

;;TO:

;; 10000000019 *** 4ms
;; 10000000033 *** 3ms
;; 10000000061 *** 4ms
;; done
;; 100000000003 *** 12ms
;; 100000000019 *** 12ms
;; 100000000057 *** 12ms
;; done
;; 1000000000039 *** 39ms
;; 1000000000061 *** 39ms
;; 1000000000063 *** 38ms
;; done
;; 10000000000037 *** 124ms
;; 10000000000051 *** 125ms
;; 10000000000099 *** 124ms
;; done
;; 100000000000031 *** 399ms
;; 100000000000067 *** 400ms
;; 100000000000097 *** 400ms
;; done


