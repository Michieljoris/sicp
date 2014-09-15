;Ex1.30
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (+ result (term a)))))
  (iter a 0))

(define (same x) x)
(define (addone x) (+ 1 x))

(sum-iter same 1 addone 3)
