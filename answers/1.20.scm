;; ;Ex1.20
(define (rem a b) (remainder a b))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(gcd 206 40)

(gcd 40
     (rem 206 40))  ;40 6
(gcd (rem 206 40)  ;if does an evaluation of b, now a in the new call
     (rem 40 (rem 206 40))) ;6 4
(gcd (rem 40 (rem 206 40)) ;if does 2 rem's
     (rem (rem 206 40) (rem 40 (rem 206 40)))) ;4 2
(gcd (rem (rem 206 40) (rem 40 (rem 206 40))) ;if does 4 remainders
     (rem (rem 40 (rem 206 40)) (rem (rem 206 40) (rem 40 (rem 206 40))))) ;2,0

;In last call to gcd if does 7 remainder calls, then 4 to evaluate a
;total of 11 calls to remainder, plus 7 in previous iterations, makes
;18 calls to rem, compared to 4 in applicative order if I counted
;right, assuming that when 'if' evaluates b, it doesn't get remembered
;for further b's in the function.
