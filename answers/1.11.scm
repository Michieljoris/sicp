;; Ex.1.11
(define (count-change amount)
  (cc amount 5))

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 100)
;recursive
(define (f n)
  (cond ((< n 3) n)
        ((>= n 3)  
         (+ (* 1 (f (- n 1)))
            (* 2 (f (- n 2)))
            (* 3 (f (- n 3)))
            ))))
;iterative
(define (fi n)
  (cond ((< n 3) n)
        (else (f-iterate 0 1 2 (- n 3)))))

(define (f-iterate n0 n1 n2 counter)
  (define n (+ (* 1  n2) 
               (* 2  n1) 
               (* 3  n0)))
  (cond ((> counter 0) (f-iterate n1 n2 n (- counter 1)))
         (else n)))
(f 10);1892
(fi 10);1892
(f 3)
(fi 3)

