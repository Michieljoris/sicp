;Ex1.8
(define (cube-iter guess x)
  (if (cube-good-enough? guess x)
      guess
      (cube-iter (cube-improve guess x)
                 x)))

(define (cube-improve y x)
 (/ (+ (/ x (square y)) (* 2 y)) 3))

(define (cube-good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (cube x) (* x x x))

(define (cube-root x)
 (cube-iter 1 x))
(cube-root 1000)
