;; ;Ex1.15
(define (cube x) (* x x x))
(define c 0)
(define (p x) (set! c (+ c 1)) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
(sine 12.15)
(= c 5)
;; a) 5   12.15/3^5 = 0.05
;; b) The number of steps grows logarithmically. The number of times p gets called
;; ;is exactly (int(log3(10*a))+1. So if a grows by 1 time grows by log3.
;; ;The stack grows by the same proportion. Every time angle gets divided by 3
;; ;another return to p has to be remembered.

