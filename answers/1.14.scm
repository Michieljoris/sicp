;; ;Ex1.14
;; ;Space used is linear. One more cent means one more depth at most when the
;; ;procedure is counting cents and not deducting larger coins.
;; ;The number of nodes in a tree is 2^n-1 where n is the depth. So if the
;; ;depth increases linearly with increasing amount then number of nodes
;; ;visited or number of times  the function is called is at most also
;; ;2^n-1. So the upperbound is exponential. It is less for count-change
;; ;because some branches are cut off because they are not resulting in
;; ;a valid change. What is the lowerbound? How many get cut off?

