;; Ex1.4
 (define (a-plus-abs-b a b)
            ((if (> b 0) + -) a b))

;; Operator - is applied to a and b if b <= 0
