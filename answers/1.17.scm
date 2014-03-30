;; ;Ex1.17
(define (m* a b)
  (if (= b 0)
      0
      (+ a (m* a (- b 1)))))

(define (halve n) (/ n 2))
(define (double n) (* n 2))

(define (fast-* a b)
  (cond ((= a 0) 0)
	((= b 0) 0)
        ((even? a) (double (fast-* (halve a) b)))
	(else (+ b (fast-* b (- a 1))))))

(fast-* 10 10)

