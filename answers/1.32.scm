;;Ex1.32

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner result (term a)))))
  (iter a null-value))


(define (sum term a next b)
  (accumulate
   + 0 term a next b))

(define (product term a next b)
  (accumulate
   * 1 term a next b))

(define (identity x) x)
(define (add-one x) (+ x 1))

(product identity 1 add-one 4)

(sum identity 1 add-one 4)

