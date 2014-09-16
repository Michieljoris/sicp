;;Ex1.36
(define tolerance 0.0000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (display v1) (newline)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (x-power-x x)
  (fixed-point
   (lambda (y) (/ (log x) (log y)))
   2))

(x-power-x 1000)

(define (average x y)
  (/ (+ x y) 2))

(define (x-power-x2 x)
  (fixed-point
   (lambda (y) (average y (/ (log x) (log y))) )
   2))

(x-power-x2 1000)
