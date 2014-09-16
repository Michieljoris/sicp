;;Ex1.38
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

(define max 12)

(define (D i)
  (cond ((= (remainder i 3) 2)
	 (/ (+ (* i 2) 2) 3))
	(#t 1)))

(define (e)
  (+ 2  (cont-frac (lambda (i) 1.0)
		   D
		   max)))

(e)
