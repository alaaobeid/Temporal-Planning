(define (domain Delivery)
(:requirements :typing :durative-actions :fluents :timed-initial-literals)
(:types 
driver
package
truck
boat
plane
waypoint
 )
(:predicates
(driver-on-foot ?d - driver)
(driver-in-truck ?d - driver ?t - truck) 
(package-in-truck ?p - package ?t - truck)
(package-in-plane ?p - package ?pl - plane)
(package-in-boat ?p - package ?b - boat)
(at-truck ?t - truck ?s - waypoint)
(at-plane ?pl - plane ?s - waypoint)
(at-boat ?b - boat ?s - waypoint)
(at-driver ?d - driver ?s - waypoint)
(at-package ?p - package ?s - waypoint)
(connected ?s ?l - waypoint)
(connected-sea ?s ?l - waypoint)
(connected-sky ?s ?l - waypoint)
(deliverable ?p - package)
)

(:functions 
(distance ?s ?l - waypoint)
(truck-speed ?t - truck)
(driver-speed ?d - driver)
(plane-speed ?pl - plane)
(boat-speed ?t - boat)
)

(:durative-action move-driver
:parameters 
(?d - driver ?s ?l - waypoint)
:duration (= ?duration (/(distance ?s ?l) (driver-speed ?d)))
:condition 
(and 
(at start (at-driver ?d ?s))
(over all (driver-on-foot ?d))
(over all (connected ?s ?l)))
:effect 
(and
(at start (not (at-driver ?d ?s)))    
(at end (at-driver ?d ?l))
 ))

 (:durative-action move-truck
:parameters 
(?t - truck ?d - driver ?s ?l - waypoint)
:duration (= ?duration (/(distance ?s ?l) (truck-speed ?t)) )
:condition 
(and 
(at start (at-truck ?t ?s))
(over all (driver-in-truck ?d ?t))
(over all (connected ?s ?l)))
:effect 
(and
(at start (not (at-truck ?t ?s)))    
(at end (at-truck ?t ?l))
 )
)

(:durative-action move-boat
:parameters 
(?b - boat ?s ?l - waypoint)
:duration (= ?duration (/(distance ?s ?l) (boat-speed ?b)) )
:condition 
(and 
(at start (at-boat ?b ?s))
(over all (connected-sea ?s ?l)))
:effect 
(and    
(at start (not (at-boat ?b ?s)))
(at end (at-boat ?b ?l))
))

(:durative-action move-plane
:parameters 
(?pl - plane ?s ?l - waypoint)
:duration (= ?duration (/(distance ?s ?l) (plane-speed ?pl)) )
:condition 
(and 
(at start (at-plane ?pl ?s))
(over all (connected-sky ?s ?l)))
:effect 
(and    (at start (not (at-plane ?pl ?s)))
(at end (at-plane ?pl ?l))
))

(:durative-action driver-enter-truck
:parameters 
(?t - truck ?d - driver ?s - waypoint)
:duration (= ?duration 10)
:condition (and 
    (at start (at-driver ?d ?s))
    (at start (driver-on-foot ?d))
    (over all (at-truck ?t ?s))
)
:effect (and 
    (at start (not (at-driver ?d ?s)))
    (at start (not (driver-on-foot ?d)))
    (at end (driver-in-truck ?d ?t))
)
)

(:durative-action driver-leave-truck
:parameters 
(?t - truck ?d - driver ?s - waypoint)
:duration (= ?duration 10)
:condition (and 
    (at start (driver-in-truck ?d ?t))
    (over all (at-truck ?t ?s))
)
:effect (and 
    (at start (not (driver-in-truck ?d ?t)))
    (at end (driver-on-foot ?d))
    (at end (at-driver ?d ?s))
)
)

(:durative-action load_package_on_truck
:parameters 
(?t - truck ?d - driver ?p - package ?s - waypoint)
:duration (= ?duration 10)
:condition (and 
    (at start (at-package ?p ?s))
    (over all (at-driver ?d ?s))
    (over all (at-truck ?t ?s))
    (over all (deliverable ?p))
)
:effect (and 
    (at start (not(at-package ?p ?s)))
    (at end (package-in-truck ?p ?t)))
)


(:durative-action unload_package_from_truck
:parameters (?t - truck ?p - package ?s - waypoint)
:duration (= ?duration 10)
:condition (and 
    (at start (package-in-truck ?p ?t))
    (over all (at-truck ?t ?s))
    (over all (deliverable ?p))
)
:effect (and 
    (at start (at-package ?p ?s))
    (at end (not(package-in-truck ?p ?t)))
))

(:durative-action load_package_into_boat
:parameters (?p - package ?b - boat ?s - waypoint)
:duration (= ?duration 10)
:condition (and
        (at start (at-package ?p ?s))
        (over all (at-boat ?b ?s))
	(over all (deliverable ?p))
 )    

:effect       (and
	      (at start(not(at-package ?p ?s)))
              (at end(package-in-boat ?p ?b))
    
)
)

(:durative-action unload_package_from_boat
:parameters (?p - package ?b - boat ?s - waypoint)
:duration (= ?duration 10)
:condition (and
        (at start (package-in-boat ?p ?b))
        (over all (at-boat ?b ?s))
	;;(over all (deliverable ?p))
 )    

:effect       (and
	      
              (at start(not (package-in-boat ?p ?b)))
              (at end(at-package ?p ?s))
)
)

(:durative-action load_package_into_plane
:parameters (?p - package ?pl - plane ?s - waypoint)
:duration (= ?duration 10)
:condition (and
        (at start (at-package ?p ?s))
        (over all (at-plane ?pl ?s))
	(over all (deliverable ?p))
 )    

:effect       (and
	      (at start(not(at-package ?p ?s)))
              (at end (package-in-plane ?p ?pl))
    
)
)

(:durative-action unload_package_from_plane
:parameters (?p - package ?pl - plane ?s - waypoint)
:duration (= ?duration 10)
:condition (and
        (at start (package-in-plane ?p ?pl))
        (over all (at-plane ?pl ?s))
        (over all (deliverable ?p))
 )    

:effect       (and
	      
              (at start(not (package-in-plane ?p ?pl)))
              (at end(at-package ?p ?s))
)
)
) 

