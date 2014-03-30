;; ;Ex1.18
(define (*-it a b)
  (*-iterative 0 a b))

(define (*-iterative r a b)
  (cond ((= a 0) r)
	((= b 0) r)
	((even? a) (*-iterative r (halve a) (double b)))
	(else (*-iterative (+ r a) a (- b 1)))))
(*-it 10 10)
