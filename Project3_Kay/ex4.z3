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
(assert (forall ((g Garden)) 
  (exists ((p Plant)) (exists ((q Plant)) (exists ((r Plant)) 
    (and (GrowsIn p g) (GrowsIn q g) (GrowsIn r g) (distinct p q r)))
))))

;; TODO: constraint 3
(assert (forall ((p Plant))
  (exists ((g Garden)) (GrowsIn p g))
))

;; TODO: constraint 4
(assert (exists ((k Garden))
  (exists ((a Plant)) (exists ((b Plant)) (exists ((c Plant))
    (and (GrowsIn a k) (GrowsIn b k) (GrowsIn c k) 
      (Fruit a) (Fruit b) (Fruit c) (distinct a b c)
))))))

;; TODO: constraint 5
(assert 
  (exists ((p Plant)) (exists ((q Plant)) 
    (exists ((r Plant)) (exists ((g Garden))  
      (exists ((h Garden))
        (and (distinct g h) (GrowsIn p g) (GrowsIn p h) 
             (GrowsIn q g) (GrowsIn q h) (GrowsIn r g) 
             (GrowsIn r h)
)))))))

;; TODO: constraint 6
(assert (not (exists ((g Garden)) 
       (and (GrowsIn rose g) (GrowsIn carrot g)
))))

;; TODO: constraint 7
(assert (forall ((g Garden)) 
  (implies 
    (GrowsIn tulip g)
    (exists ((f Plant)) (and (GrowsIn f g) (Flower f) 
      (not (= f tulip)))))  
))

;; TODO: constraint 8
(assert (exists ((f Plant)) (exists ((x Plant))
  (exists ((v Plant)) (and (GrowsIn f garden1) 
    (GrowsIn x garden1) (GrowsIn v garden1)
  (Flower f) (Fruit x) (Vegetable v))))
))

;; TODO: constraint 9
(assert (not (exists ((f Plant)) 
      (and (GrowsIn f garden2) (Flower f)))))

;; TODO: constraint 10
(assert (and (GrowsIn carrot garden1) 
  (GrowsIn carrot garden4) (GrowsIn banana garden3)))

;; TODO: statements (a-c) to prove
;; TODO: a
(assert (and (GrowsIn lily garden1)
  (exists ((p Plant)) (exists ((q Plant)) 
  (and (GrowsIn p garden1)  (GrowsIn q garden1)
    (not (= p lily)) (not (= q lily)))
))))

;; TODO: b
(assert (exists ((p Plant)) (exists ((q Plant))
    (and (GrowsIn p garden2) (GrowsIn q garden3) 
      (Fruit p) (Fruit q) (not (distinct p q)))
)))

;; TODO: c
(assert (forall ((g Garden)) 
    (implies (GrowsIn tulip g) (GrowsIn rose g))))


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
