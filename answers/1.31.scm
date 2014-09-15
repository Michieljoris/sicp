;;Ex1.31
(define (product term a next b)
  (if (> a b)
      1
      (* 
       (term a)
       (product term (next a) next b))))

(define (factorial n) 
  (define (identity x) x)
  (define (add-one x) (+ x 1))
  (product identity 1 add-one n)
  )

(factorial 5)

(define (pi n)
  (define (identity x) x)
  (define (add-two x) (+ x 2))
  (define top (product identity 4 add-two  n))
  (define bottom (product identity 3 add-two n))
  (* (* n 8.0)
     (/
      (* top top) 
      (* bottom bottom) 
      ))
  )

(pi 10001)

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial-iter n) 
  (define (identity x) x)
  (define (add-one x) (+ x 1))
  (product-iter identity 1 add-one n)
  )

(factorial-iter 3)
