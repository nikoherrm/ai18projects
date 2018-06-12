
;; TODO: model exercise 3 here

;Functions needed for the formulas that have to be proven. All take two integer values as input and return a boolean
(declare-fun P (Int Int) Bool)
(declare-fun Q (Int Int) Bool)
(declare-fun R (Int Int) Bool)

;The 3 statements that have to hold in order for the fourth one to be true

(assert (forall ((x Int)) (exists ((y Int)) (P x y))))  ;first statement
(assert (forall ((x Int)) (exists ((y Int)) (Q x y))))	;second statement
(assert (forall ((x Int) (y Int) (z Int)) (=> (or (P x y) (Q x y)) (=> (or (P y z)(Q y z)) (R x z)))))	;third statement

;The statement resulting from the 3 above

(assert (forall ((x Int)) (exists ((y Int)) (R x y))))

(check-sat)

