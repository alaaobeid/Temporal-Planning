(define (problem problem4)
  (:domain Delivery)
  (:objects p1 p2 p3 p4 - package
	d1 d2 -driver 
	t1 t2 - truck
 	pl -plane 
	b - boat
 	wp1 wp2 wp3 wp4 wp5 wp6 wp7 wp8 wp9 wp10 wp11 sea sky - waypoint)
  (:init 
		 (deliverable p1)
    	         (deliverable p2)
                 (deliverable p3)
                 (deliverable p4)
		 (at 1660.012 (not (deliverable p1)))
		 (connected wp1 wp2) 
		 (connected wp2 wp1) 
		 (connected wp1 wp5)
		 (connected wp5 wp1)
		 (connected wp1 wp4)
		 (connected wp4 wp1)
		 (connected wp2 wp3)
		 (connected wp3 wp2)
		 (connected wp2 wp6)
		 (connected wp6 wp2)
		 (connected wp3 wp8)
		 (connected wp8 wp3)
		 (connected wp4 wp9)
		 (connected wp9 wp4)
		 (connected wp5 wp6)
		 (connected wp6 wp5)
		 (connected wp6 wp7)
		 (connected wp7 wp6)
		 (connected wp8 wp11)
		 (connected wp11 wp8)
		 (connected wp9 wp10)
		 (connected wp10 wp9)
		 (connected wp10 wp11)
		 (connected wp11 wp10)
		 (connected-sea wp7 sea)
		 (connected-sea sea wp7)
		 (connected-sky wp4 sky)
		 (connected-sky sky wp4)
		 (connected-sky wp2 sky)
		 (connected-sky sky wp2)
		 (= (distance wp1 wp2) 100)
		 (= (distance wp2 wp1) 100)
		 (= (distance wp1 wp5) 100)
		 (= (distance wp5 wp1) 100)
		 (= (distance wp1 wp4) 75)
		 (= (distance wp4 wp1) 75)
		 (= (distance wp2 wp3) 100)
		 (= (distance wp3 wp2) 100)
		 (= (distance wp2 wp6) 75)
		 (= (distance wp6 wp2) 75)
		 (= (distance wp3 wp8) 75)
		 (= (distance wp8 wp3) 75)
		 (= (distance wp4 wp9) 75)
		 (= (distance wp9 wp4) 75)
		 (= (distance wp5 wp6) 50)
		 (= (distance wp6 wp5) 50)
		 (= (distance wp6 wp7) 50)
		 (= (distance wp7 wp6) 50)
		 (= (distance wp8 wp11) 75)
		 (= (distance wp11 wp8) 75)
		 (= (distance wp9 wp10) 100)
		 (= (distance wp10 wp9) 100)
		 (= (distance wp10 wp11) 100)
		 (= (distance wp11 wp10) 100)
		 (= (distance wp4 sky) 20)
		 (= (distance sky wp4) 20)
		 (= (distance wp2 sky) 20)
		 (= (distance sky wp2) 20)
		 (= (distance wp7 sea) 75)
		 (= (distance sea wp7) 75)
		 (= (truck-speed t1) 1)
		 (= (truck-speed t2) 1)
		 (= (boat-speed b) 1.5)
		 (= (driver-speed d1) 0.5)
		 (= (driver-speed d2) 0.5)
		 (= (plane-speed pl) 2)
		 (at-package p1 wp2)
		 (at-package p2 wp3)
		 (at-package p3 wp5)
		 (at-package p4 wp11)
		 (at-truck t1 wp6)
		 (at-truck t2 wp9)
		 (at-plane pl sky)
		 (at-boat b sea)
		 (at-driver d1 wp1)
		 (at-driver d2 wp4)
		 (driver-on-foot d1)
         	 (driver-on-foot d2)
)
  (:goal (and (at-package p4 wp2)
  	      (at-package p1 wp9)
	      (at-package p3 wp9)
	      (at-package p2 sea)
	      (at-driver d1 wp1)
	      (at-driver d2 wp1)
	 )
  )
)