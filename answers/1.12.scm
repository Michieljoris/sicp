;Ex1.12
(define (pt r n)
  (cond
   ((= n 0) 1)
   ((= n r) 1)
   (else (+ (pt (- r 1) (- n 1)) (pt (- r 1) n)))))
(pt 4 2) ;6

