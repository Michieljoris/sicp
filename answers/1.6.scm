;Ex1.6
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (new-sqrt-iter guess x)
  (new-if (good-enough? guess x)  
          guess   
          (new-sqrt-iter (improve guess x)
                      x)))


(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
       (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs
 (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (msqrt x)
  (sqrt-iter 1.0 x))

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

(msqrt 100)

;; (new-sqrt 100)				;
;The new-if hangs or crashes!!!
;All the args of new-if always get evaluated by Eva Lu Ator's new-if's
;function and we don't want to evaluate the third arg if the guess
;is good-enough. 
