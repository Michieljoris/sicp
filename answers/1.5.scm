;; Ex1.5
;; The applicative order interpreter will hang, evaluating p forever.
;; The normal-order interpreter returns 0.
;; (define (p) (p))
;; (define (test x y)
;;   (if (= x 0)
;;       0
;;       y
;;       )
;;   )
;; (test 0 (p))
