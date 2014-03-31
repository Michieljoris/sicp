;Ex.1.22
(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

;; We can test whether a number is prime as follows: n is prime if and
;; only if n is its own smallest divisor.

(define (prime? n)
  (= n (smallest-divisor n)))

;;guile
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
;;laptop results after sexp
(search-for-primes 10000000001 3) ;70ms
(search-for-primes 100000000001 3) ;250ms
(search-for-primes 1000000000001 3) ;740ms
(search-for-primes 10000000000001 3) ;2290ms
(search-for-primes 100000000000001 3) ; 7320ms
;;Roughly 3 times as slow when prime is 10 times as big
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

