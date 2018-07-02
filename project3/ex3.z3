
;; TODO: model exercise 3 here

;Functions needed for the formulas that have to be proven. All take two integer values as input and return a boolean
(declare-fun p (Int Int) Bool)
(declare-fun q (Int Int) Bool)
(declare-fun r (Int Int) Bool)

;The 3 statements that have to hold in order for the fourth one to be true

(assert (forall ((x Int)) (exists ((y Int)) (p x y))))  ;first statement
(assert (forall ((x Int)) (exists ((y Int)) (q x y))))	;second statement
(assert (forall ((x Int) (y Int) (z Int)) (=> (or (p x y) (q x y)) (=> (or (p y z)(q y z)) (r x z)))))	;third statement

;The statement resulting from the 3 above

(assert (forall ((x Int)) (exists ((y Int)) (r x y))))

(check-sat)

