(define (domain rush-hour)
    (:requirements :typing :strips)
    (:types num car - object)

    (:predicates
        (plusone ?p1 - num ?p2 - num)
        (isOccupied ?px ?py - num)
        (carTail ?c - car ?px ?py - num)
        (carHead ?c - car ?px ?py - num)
    )

    (:action move-down
        :parameters (?c - car ?px - num ?p1y - num ?p2y - num ?p3y - num ?p4y - num)
        :precondition (and															;preconditions for the move-down action
			(plusone ?p3y ?p4y)														;the position of the current HEAD has to be above its upcoming position after the action
			(plusone ?p1y ?p2y)  													;the position of the current TAIL has to be above its upcoming position after the action
			(not (isOccupied ?px ?p4y))												;the upcoming position of the HEAD has to be available
			(carTail ?c ?px ?p1y)													;the TAIL's current position (px, p1y) 
			(carHead ?c ?px ?p3y)													;the HEAD's current position (px, p3y)
		)
        :effect (and																;this is what happens when executing move-down
            
			(not (isOccupied ?px ?p1y))												;update the previous TAIL position to "notOccupied"
			(not (carTail ?c ?px ?p1y))												;update the previous TAIL position to "no Tail anymore"
			(not (carHead ?c ?px ?p3y))												;update the previous HEAD position to "no Head anymore"
			(isOccupied ?px ?p4y)													;the HEAD moved to (px, p4y) so this position is now occupied
			(carTail ?c ?px ?p2y)													;update the TAIL position
			(carHead ?c ?px ?p4y)													;update the HEAD position
        )
    )

    (:action move-up
        :parameters (?c - car ?px - num ?p1y - num ?p2y - num ?p3y - num ?p4y - num)
        :precondition (and															;preconditions for the move-up action
			(plusone ?p3y ?p4y)														;the position of the current HEAD has to be below its upcoming position after the action
			(plusone ?p1y ?p2y)  													;the position of the current TAIL has to be below its upcoming position after the action
			(not (isOccupied ?px ?p1y))												;the upcoming position of the TAIL has to be available
			(carTail ?c ?px ?p2y)													;the TAIL's current position (px, p2y)
			(carHead ?c ?px ?p4y)													;the HEAD's current position (px, p4y)
        )
        :effect (and																;this is what happens when executing move-up
			(not (isOccupied ?px ?p4y))												;update the previous HEAD position to "notOccupied"
			(not (carTail ?c ?px ?p2y))												;update the previous TAIL position to "no Tail anymore"
			(not (carHead ?c ?px ?p4y))												;update the previous HEAD position to "no Head anymore"
			(isOccupied ?px ?p1y)													;the TAIL moved to (px, p1y) so this position is now occupied
			(carTail ?c ?px ?p1y)													;update the TAIL position
			(carHead ?c ?px ?p3y)													;update the HEAD position
        )
    )
    
    (:action move-left
        :parameters (?c - car ?py - num ?p1x - num ?p2x - num ?p3x - num ?p4x - num)
        :precondition (and															;preconditions for the move-left action
            (plusone ?p3x ?p4x)														;the position of the current HEAD has to be one position right from its upcoming position after the action
			(plusone ?p1x ?p2x)  													;the position of the current TAIL has to be one position right from its upcoming position after the action
			(not (isOccupied ?p1x ?py))												;the upcoming position of the TAIL has to be available
			(carTail ?c ?p2x ?py)													;the TAIL's current position (p2x, py)
			(carHead ?c ?p4x ?py)													;the HEAD's current position (p4x, py)
        )
        :effect (and																;this is what happens when executing move-left
            (not (isOccupied ?p4x ?py))												;update the previous HEAD position to "notOccupied"
			(not (carTail ?c ?p2x ?py))												;update the previous TAIL position to "no Tail anymore"
			(not (carHead ?c ?p4x ?py))												;update the previous HEAD position to "no Head anymore"
			(isOccupied ?p1x ?py)													;the TAIL moved to (p1x, py) so this position is now occupied
			(carTail ?c ?p1x ?py)													;update the TAIL position
			(carHead ?c ?p3x ?py)													;update the HEAD position
        )
    )
    
    (:action move-right
        :parameters (?c - car ?py - num ?p1x - num ?p2x - num ?p3x - num ?p4x - num)
        :precondition (and															;preconditions for the move-right action
            (plusone ?p3x ?p4x)														;the position of the current HEAD has to be one position left from its upcoming position after the action
			(plusone ?p1x ?p2x)  													;the position of the current TAIL has to be one position left from its upcoming position after the action
			(not (isOccupied ?p4x ?py))												;the upcoming position of the HEAD has to be available
			(carTail ?c ?p1x ?py)													;the TAIL's current position (p1x, py)
			(carHead ?c ?p3x ?py)													;the HEAD's current position (p3x, py)
        )
        :effect (and																;this is what happens when executing move-right
            (not (isOccupied ?p1x ?py))												;update the previous TAIL position to "notOccupied"
			(not (carTail ?c ?p1x ?py))												;update the previous TAIL position to "no Tail anymore"
			(not (carHead ?c ?p3x ?py))												;update the previous HEAD position to "no Head anymore"
			(isOccupied ?p4x ?py)													;the HEAD moved to (p4x, py) so this position is now occupied
			(carTail ?c ?p2x ?py)													;update the TAIL position
			(carHead ?c ?p4x ?py)													;update the HEAD position
        )
    )
    
)
