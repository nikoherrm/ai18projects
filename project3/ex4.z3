(set-option :produce-models true)

(declare-datatypes () ((Plant apple banana cherry rose tulip lily onion carrot pepper)))
(declare-datatypes () ((Garden garden1 garden2 garden3 garden4)))

(declare-fun Fruit (Plant) Bool)
(declare-fun Flower (Plant) Bool)
(declare-fun Vegetable (Plant) Bool)

(declare-fun GrowsIn (Plant Garden) Bool)

(assert (forall ((x Plant)) (= (Fruit x) (or (= x apple) (= x banana) (= x cherry)))))
(assert (forall ((x Plant)) (= (Flower x) (or (= x rose) (= x tulip) (= x lily)))))
(assert (forall ((x Plant)) (= (Vegetable x) (or (= x onion) (= x carrot) (= x pepper)))))


;; TODO: constraint 1
(assert (forall ((x Plant)) (or (Fruit x) (Flower x) (Vegetable x))))

;; TODO: constraint 2
(assert (forall ((x Garden)) (and (exists ((u Plant) (v Plant) (w Plant)) (and (GrowsIn u x) (GrowsIn v x) (GrowsIn w x) (distinct u v w))) (not (exists ((a Plant) (b Plant) (c Plant) (d Plant)) (and (GrowsIn a x) (GrowsIn b x) (GrowsIn c x) (GrowsIn d x) (distinct a b c d)))))))

;; TODO: constraint 3
(assert (forall ((x Plant)) (exists ((y Garden)) (GrowsIn x y))))

;; TODO: constraint 4
(assert (exists ((x Garden)) (and (GrowsIn apple x) (GrowsIn banana x) (GrowsIn cherry x) (not (exists ((y Garden)) (and (GrowsIn apple y) (GrowsIn banana y) (GrowsIn cherry y) (not (= x y))))))))

;; TODO: constraint 5
(assert (exists ((a Plant) (b Plant) (c Plant) (x Garden) (y Garden) ) (and  (GrowsIn a x) (GrowsIn b x) (GrowsIn c x) (GrowsIn a y) (GrowsIn b y) (GrowsIn c y) (distinct x y)  )))
;commented out :(not (exists ((z Plant)) (and (GrowsIn z x) (GrowsIn z y)(distinct a b c z))))
;commented out:  (Vegetable a) (Fruit b) (Fruit c)
;; TODO: constraint 6
(assert (not (exists ((x Garden)) (and (GrowsIn rose x) (GrowsIn carrot x)))))

;; TODO: constraint 7
(assert (forall ((x Garden)) (=> (GrowsIn tulip x) (exists ((y Plant)) (and (GrowsIn y x) (Flower y))))))

;; TODO: constraint 8
(assert (exists ((x Plant) (y Plant) (z Plant)) (and (Fruit x) (Vegetable y) (Flower z) (GrowsIn x garden1) (GrowsIn y garden1) (GrowsIn z garden1) (distinct x y z) )))

;; TODO: constraint 9
(assert (not (exists ((x Plant)) (and (Flower x) (GrowsIn x garden2)))))

;; TODO: constraint 10
(assert (and (GrowsIn carrot garden1) (GrowsIn carrot garden4) (GrowsIn banana garden3)))

;; TODO: statements (a-c) to prove

(assert (GrowsIn lily garden1))              ; a) there is a lily in garden 1


;; check and print model
(check-sat)

(echo "garden1:")
(get-value ((GrowsIn apple garden1) (GrowsIn banana garden1) (GrowsIn cherry garden1) (GrowsIn rose garden1) (GrowsIn tulip garden1) (GrowsIn lily garden1) (GrowsIn onion garden1) (GrowsIn carrot garden1) (GrowsIn pepper garden1)))

(echo "garden2:")
(get-value ((GrowsIn apple garden2) (GrowsIn banana garden2) (GrowsIn cherry garden2) (GrowsIn rose garden2) (GrowsIn tulip garden2) (GrowsIn lily garden2) (GrowsIn onion garden2) (GrowsIn carrot garden2) (GrowsIn pepper garden2)))

(echo "garden3:")
(get-value ((GrowsIn apple garden3) (GrowsIn banana garden3) (GrowsIn cherry garden3) (GrowsIn rose garden3) (GrowsIn tulip garden3) (GrowsIn lily garden3) (GrowsIn onion garden3) (GrowsIn carrot garden3) (GrowsIn pepper garden3)))

(echo "garden4:")
(get-value ((GrowsIn apple garden4) (GrowsIn banana garden4) (GrowsIn cherry garden4) (GrowsIn rose garden4) (GrowsIn tulip garden4) (GrowsIn lily garden4) (GrowsIn onion garden4) (GrowsIn carrot garden4) (GrowsIn pepper garden4)))
(echo "")