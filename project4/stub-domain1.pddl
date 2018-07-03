(define (domain rush-hour)
    (:requirements :typing :strips)
    (:types position car - object)

    (:predicates
        (ADJACENT ?p1 - position ?p2 - position ?p3 - position)
        (SMALL ?c - car)
        (LARGE ?c - car)
        (isOccupied ?p - position)
        (containsCar ?p - position ?c - car)
    )

    (:action move-small															
        :parameters (?c - car ?p1 - position ?p2 - position ?p3 - position)
        :precondition (and													;these are the preconditions that have to be fulfilled in order for the action move-small to be executed
			(ADJACENT ?p1 ?p2 ?p3)											;the three positions given as parameters have to be in line
			(SMALL ?c)														;the car has to be a small car
            (containsCar ?p1 ?c)											;the car has to be placed in position p1, p2
			(containsCar ?p2 ?c)											;
			(not (isOccupied ?p3))											;there must not be any other car on position p3
        )
        :effect (and														;this is what happens after the action is executed
            (not (isOccupied ?p1))											;p1 is not occupied anymore because the car has moved to p2, p3
			(not (containsCar ?p1 ?c))										;p1 doesnt contain a car anymore because it moved to p2,p3
			(isOccupied ?p3)												;p3 is now occupied 
			(containsCar ?p3 ?c)											;p3 contains the car now 
			
        )
    )

    (:action move-large
        :parameters (?c - car ?p1 - position ?p2 - position ?p3 - position ?p4 - position)
        :precondition (and													;these are the preconditions that have to be fulfilled in order for the action move-small to be executed
            (ADJACENT ?p1 ?p2 ?p3)											
			(ADJACENT ?p2 ?p3 ?p4)											;the four positions given as parameters have to be in line (if p1, p2, p3 and p2, p3, p4 are in line, all four are as well)
			(LARGE ?c)														;the car has to be a large car
            (containsCar ?p1 ?c)											;the car has to be placed in position p1, p2, p3 
			(containsCar ?p2 ?c)
			(containsCar ?p3 ?c)
			(not (isOccupied ?p4))											;there must not be any other car on position p3
        )
        :effect (and														;this is what happens after the action is executed
            (not (isOccupied ?p1))											;p1 is not occupied anymore because the car has moved to p2, p3, p4
			(not (containsCar ?p1 ?c))										;p1 doesnt contain a car anymore because it moved to p2,p3, p4
			(isOccupied ?p4)												;p4 is now occupied 
			(containsCar ?p4 ?c)											;p4 now contains the car
        )
    )
)
