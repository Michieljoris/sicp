;Ex1.29.
(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(sum-integers 1 7) 

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

(pi-sum 10 12000)

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (same x) x)
(define (addone x) (+ 1 x))
(sum same 1 addone 4)

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (cube x) (* x x x))

(integral cube 0 1 0.01)
.24998750000000042
(integral cube 0 1 0.001)
.249999875000001



(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (yk k)
    (f (+ a (* k h)))
    )
  (define (add2 x) (+ x 2))
  (* (/ h 3)
     (+ 
      (f a)
      (* 4 
	 (sum yk 1 add2 (- n 1))
	 )
      (* 2 
	 (sum yk 2 add2 (- n 2))
	 )
      (f (+ a (* n h)))
      )
     )
  )

(simpson cube 0 1 10) ;1/4
(simpson cube 0 1 1000) ;1/4
