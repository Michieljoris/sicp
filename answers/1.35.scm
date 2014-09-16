;;Ex1.35
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point cos 1.0)
.7390822985224023

(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0)
1.2587315962971173

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (fixed-point 
   (lambda (y) (average y (/ x y)))
   1.0))

(sqrt 9)

(define (golden-ratio)
  (fixed-point 
   (lambda (y) (+ 1 (/ 1 y)))
   1.0))

(golden-ratio)


