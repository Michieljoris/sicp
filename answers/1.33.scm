;;Ex1.33

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))


(define (filtered-accumulate combiner null-value term a next b filter?)
  (if (> a b)
      null-value
      (combiner (if (filter? a)  (term a) null-value)
		(filtered-accumulate combiner null-value term (next a) next b filter?))))


(define (identity x) x)
(define (add-one x) (+ x 1))
(even? 2)
(define (yes x) #t)
(define (no x) #f)

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))


(filtered-accumulate + 0 identity 1 add-one 7 prime?)

(define (product-relative-prime n)
  (define  (relative-prime? i)
    (= (gcd i n) 1)
    )
  (filtered-accumulate * 1 identity 1 add-one n relative-prime?)
  )

(product-relative-prime 11)



