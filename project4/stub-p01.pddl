(define (problem rush-hour-p01)
    (:domain rush-hour)
    (:objects
        loc1_1 loc1_2 loc1_3 loc1_4 loc1_5 loc1_6 loc2_1 loc2_2 loc2_3 loc2_4 loc2_5 loc2_6 loc3_1 loc3_2 loc3_3 loc3_4 loc3_5 loc3_6 loc4_1 loc4_2 loc4_3 loc4_4 loc4_5 loc4_6 loc5_1 loc5_2 loc5_3 loc5_4 loc5_5 loc5_6 loc6_1 loc6_2 loc6_3 loc6_4 loc6_5 loc6_6  - position
        red car1 car3 car4 car5 car6 car10 car13 car14 car16 car17 car18 - car
    )
    (:init
        (ADJACENT loc1_1 loc2_1 loc3_1)
        (ADJACENT loc3_1 loc2_1 loc1_1)
        (ADJACENT loc2_1 loc3_1 loc4_1)
        (ADJACENT loc4_1 loc3_1 loc2_1)
        (ADJACENT loc3_1 loc4_1 loc5_1)
        (ADJACENT loc5_1 loc4_1 loc3_1)
        (ADJACENT loc4_1 loc5_1 loc6_1)
        (ADJACENT loc6_1 loc5_1 loc4_1)
        (ADJACENT loc1_2 loc2_2 loc3_2)
        (ADJACENT loc3_2 loc2_2 loc1_2)
        (ADJACENT loc2_2 loc3_2 loc4_2)
        (ADJACENT loc4_2 loc3_2 loc2_2)
        (ADJACENT loc3_2 loc4_2 loc5_2)
        (ADJACENT loc5_2 loc4_2 loc3_2)
        (ADJACENT loc4_2 loc5_2 loc6_2)
        (ADJACENT loc6_2 loc5_2 loc4_2)
        (ADJACENT loc1_3 loc2_3 loc3_3)
        (ADJACENT loc3_3 loc2_3 loc1_3)
        (ADJACENT loc2_3 loc3_3 loc4_3)
        (ADJACENT loc4_3 loc3_3 loc2_3)
        (ADJACENT loc3_3 loc4_3 loc5_3)
        (ADJACENT loc5_3 loc4_3 loc3_3)
        (ADJACENT loc4_3 loc5_3 loc6_3)
        (ADJACENT loc6_3 loc5_3 loc4_3)
        (ADJACENT loc1_4 loc2_4 loc3_4)
        (ADJACENT loc3_4 loc2_4 loc1_4)
        (ADJACENT loc2_4 loc3_4 loc4_4)
        (ADJACENT loc4_4 loc3_4 loc2_4)
        (ADJACENT loc3_4 loc4_4 loc5_4)
        (ADJACENT loc5_4 loc4_4 loc3_4)
        (ADJACENT loc4_4 loc5_4 loc6_4)
        (ADJACENT loc6_4 loc5_4 loc4_4)
        (ADJACENT loc1_5 loc2_5 loc3_5)
        (ADJACENT loc3_5 loc2_5 loc1_5)
        (ADJACENT loc2_5 loc3_5 loc4_5)
        (ADJACENT loc4_5 loc3_5 loc2_5)
        (ADJACENT loc3_5 loc4_5 loc5_5)
        (ADJACENT loc5_5 loc4_5 loc3_5)
        (ADJACENT loc4_5 loc5_5 loc6_5)
        (ADJACENT loc6_5 loc5_5 loc4_5)
        (ADJACENT loc1_6 loc2_6 loc3_6)
        (ADJACENT loc3_6 loc2_6 loc1_6)
        (ADJACENT loc2_6 loc3_6 loc4_6)
        (ADJACENT loc4_6 loc3_6 loc2_6)
        (ADJACENT loc3_6 loc4_6 loc5_6)
        (ADJACENT loc5_6 loc4_6 loc3_6)
        (ADJACENT loc4_6 loc5_6 loc6_6)
        (ADJACENT loc6_6 loc5_6 loc4_6)
        (ADJACENT loc1_1 loc1_2 loc1_3)
        (ADJACENT loc1_3 loc1_2 loc1_1)
        (ADJACENT loc1_2 loc1_3 loc1_4)
        (ADJACENT loc1_4 loc1_3 loc1_2)
        (ADJACENT loc1_3 loc1_4 loc1_5)
        (ADJACENT loc1_5 loc1_4 loc1_3)
        (ADJACENT loc1_4 loc1_5 loc1_6)
        (ADJACENT loc1_6 loc1_5 loc1_4)
        (ADJACENT loc2_1 loc2_2 loc2_3)
        (ADJACENT loc2_3 loc2_2 loc2_1)
        (ADJACENT loc2_2 loc2_3 loc2_4)
        (ADJACENT loc2_4 loc2_3 loc2_2)
        (ADJACENT loc2_3 loc2_4 loc2_5)
        (ADJACENT loc2_5 loc2_4 loc2_3)
        (ADJACENT loc2_4 loc2_5 loc2_6)
        (ADJACENT loc2_6 loc2_5 loc2_4)
        (ADJACENT loc3_1 loc3_2 loc3_3)
        (ADJACENT loc3_3 loc3_2 loc3_1)
        (ADJACENT loc3_2 loc3_3 loc3_4)
        (ADJACENT loc3_4 loc3_3 loc3_2)
        (ADJACENT loc3_3 loc3_4 loc3_5)
        (ADJACENT loc3_5 loc3_4 loc3_3)
        (ADJACENT loc3_4 loc3_5 loc3_6)
        (ADJACENT loc3_6 loc3_5 loc3_4)
        (ADJACENT loc4_1 loc4_2 loc4_3)
        (ADJACENT loc4_3 loc4_2 loc4_1)
        (ADJACENT loc4_2 loc4_3 loc4_4)
        (ADJACENT loc4_4 loc4_3 loc4_2)
        (ADJACENT loc4_3 loc4_4 loc4_5)
        (ADJACENT loc4_5 loc4_4 loc4_3)
        (ADJACENT loc4_4 loc4_5 loc4_6)
        (ADJACENT loc4_6 loc4_5 loc4_4)
        (ADJACENT loc5_1 loc5_2 loc5_3)
        (ADJACENT loc5_3 loc5_2 loc5_1)
        (ADJACENT loc5_2 loc5_3 loc5_4)
        (ADJACENT loc5_4 loc5_3 loc5_2)
        (ADJACENT loc5_3 loc5_4 loc5_5)
        (ADJACENT loc5_5 loc5_4 loc5_3)
        (ADJACENT loc5_4 loc5_5 loc5_6)
        (ADJACENT loc5_6 loc5_5 loc5_4)
        (ADJACENT loc6_1 loc6_2 loc6_3)
        (ADJACENT loc6_3 loc6_2 loc6_1)
        (ADJACENT loc6_2 loc6_3 loc6_4)
        (ADJACENT loc6_4 loc6_3 loc6_2)
        (ADJACENT loc6_3 loc6_4 loc6_5)
        (ADJACENT loc6_5 loc6_4 loc6_3)
        (ADJACENT loc6_4 loc6_5 loc6_6)
        (ADJACENT loc6_6 loc6_5 loc6_4)
		
		(isOccupied loc1_3)				;
		(isOccupied loc2_3)				;
		(containsCar loc1_3 red)		;  THIS IS INITIAL STATE OF THE RED CAR
		(containsCar loc2_3 red)		;
		(SMALL red)						;

        (isOccupied loc1_1)				;
		(isOccupied loc1_2)				;
		(containsCar loc1_1 car1)		;  THIS IS INITIAL STATE OF CAR 1
		(containsCar loc1_2 car1)		;
		(SMALL car1)					;
		
		(isOccupied loc3_3)				;
		(isOccupied loc3_4)				;
		(containsCar loc3_3 car3)		;  THIS IS INITIAL STATE OF CAR 3
		(containsCar loc3_4 car3)		;
		(SMALL car3)					;
		
		(isOccupied loc4_3)				;
		(isOccupied loc4_4)				;
		(containsCar loc4_3 car4)		;  THIS IS INITIAL STATE OF CAR 4
		(containsCar loc4_4 car4)		;
		(SMALL car4)					;
		
		(isOccupied loc5_3)				;
		(isOccupied loc5_4)				;
		(containsCar loc5_3 car5)		;  THIS IS INITIAL STATE OF CAR 5
		(containsCar loc5_4 car5)		;
		(SMALL car5)					;
		
		(isOccupied loc6_2)				;
		(isOccupied loc6_3)				;
		(isOccupied loc6_4)				;
		(containsCar loc6_2 car6)		;  THIS IS INITIAL STATE OF CAR 6
		(containsCar loc6_3 car6)		;
		(containsCar loc6_4 car6)		;
		(LARGE car6)					;
		
		(isOccupied loc4_5)				;
		(isOccupied loc4_6)				;
		(containsCar loc4_5 car10)		;  THIS IS INITIAL STATE OF CAR 10
		(containsCar loc4_6 car10)		;
		(SMALL car10)					;
		
		(isOccupied loc4_1)				;
		(isOccupied loc5_1)				;
		(isOccupied loc6_1)				;
		(containsCar loc4_1 car13)		;  THIS IS INITIAL STATE OF CAR 13
		(containsCar loc5_1 car13)		;
		(containsCar loc6_1 car13)		;
		(LARGE car13)					;
		
		(isOccupied loc3_2)				;
		(isOccupied loc4_2)				;
		(isOccupied loc5_2)				;
		(containsCar loc3_2 car14)		;  THIS IS INITIAL STATE OF CAR 14
		(containsCar loc4_2 car14)		;
		(containsCar loc5_2 car14)		;
		(LARGE car14)					;
		
		(isOccupied loc1_4)				;
		(isOccupied loc2_4)				;
		(containsCar loc1_4 car16)		;  THIS IS INITIAL STATE OF CAR 16
		(containsCar loc2_4 car16)		;
		(SMALL car16)					;
		
		(isOccupied loc5_5)				;
		(isOccupied loc6_5)				;
		(containsCar loc5_5 car17)		;  THIS IS INITIAL STATE OF CAR 17
		(containsCar loc6_5 car17)		;
		(SMALL car17)					;
		
		(isOccupied loc2_6)				;
		(isOccupied loc3_6)				;
		(containsCar loc2_6 car18)		;  THIS IS INITIAL STATE OF CAR 18
		(containsCar loc3_6 car18)		;
		(SMALL car18)					;
		
		

    )
    (:goal (and
        (containsCar loc5_3 red)		;
		(containsCar loc6_3 red)		; RED CAR IS IN GOAL STATE (5,3) and (6,3)
    ))
)
