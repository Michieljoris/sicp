;; ;Ex1.16
(define (square x) (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (expt-it b n)
  (expt-iterate 1 b n))

(define (expt-iterate a b n)
  (cond ((= n 0) a)
        ((even? n) (expt-iterate a (square b) (/ n 2)))
        (else (expt-iterate (* a b) b (- n 1)))))

(fast-expt 2 10)
