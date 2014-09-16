;;Ex1.37
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

(define k 12)
(/ 1 (cont-frac (lambda (i) 1.0)
		(lambda (i) 1.0)
		k))

;;=> 1.6180555555555558

;; we like shadowing variables..
(define (cont-frac-iter n d k)
  (define (iter k result)
    (if (= k 0)
	result
	(iter (- k 1)
	      (/ (n k) (+ (d k) result)))))
  (iter k (/ (n k) (d k)))
  )


(/ 1 (cont-frac-iter (lambda (i) 1.0)
		     (lambda (i) 1.0)
		     k))

;;=> 1.6180555555555558

(define (cont-frac-iter2 n d k precision)
  (define (iter k result prev)
    (if (or (= k 0) (< (abs (- result prev)) precision))
	k
	(iter (- k 1)
	      (/ (n k) (+ (d k) result))
	      result
	      )))
  (iter k (/ (n k) (d k)) 0)
  )

(define max 30)
(define (golden-ratio precision)
  (- max
     (cont-frac-iter2 (lambda (i) 1.0)
		      (lambda (i) 1.0)
		      max
		      precision)))

(golden-ratio 0.0001)
;;=> 10

;;minimal version
(define (golden-ratio2 precision)
  (define (iter k result prev)
    (if (< (abs (- result prev)) precision)
	k
	(iter (+ k 1)
	      (/ 1 (+ 1 result))
	      result
	      )))
  (iter 0 1 0)
  )

(golden-ratio2 0.0001)
;;=> 10
