;;Ex1.39
;;recursive
(define (cont-frac n d k)
  (define (frac i) 
    (/ (n i) (+ (d i)
		(if (< i k)
		    (frac (+ i 1))
		    0)
		)))
  (frac 1)
  )

(define (tan-cf x k)
  (define xsq (- (* x x)))
  (cont-frac
   (lambda (i) (if (= i 1) x xsq))
   (lambda (i) (- (* i 2) 1)) k)
  )

(define k 50)
(tan-cf 1.0 k)
