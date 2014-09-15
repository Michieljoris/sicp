;Ex1.31
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (identity x) x)
(define (add-one x) (+ x 1))

(product identity 1 add-one 3)




