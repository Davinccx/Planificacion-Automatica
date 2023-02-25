(define (problem drone_problem_d1_r0_l3_p3_c3_g3_ct2)
(:domain drone-domain)
(:objects
	drone1 - dron
	depot - localizacion
	loc1 - localizacion
	loc2 - localizacion
	loc3 - localizacion
	crate1 - caja
	crate2 - caja
	crate3 - caja
	food - contenido
	medicine - contenido
	person1 - persona
	person2 - persona
	person3 - persona
	derecho - brazo
	izquierdo - brazo
)
(:init(libre derecho) (libre izquierdo)
(localizacion-dron depot drone1) 
(localizacion-caja depot crate1) (localizacion-caja depot crate2) (localizacion-caja depot crate3) 
(localizacion-persona loc3 person1) (localizacion-persona loc2 person2) (localizacion-persona loc1 person3) 
(caja-tiene-contenido crate1 food ) (caja-tiene-contenido crate2 food) (caja-tiene-contenido crate3 medicine) 
(necesita person1 food) (necesita person2 food) (necesita person3 medicine) 

)
(:goal (and
(localizacion-dron depot drone1)
(tiene-contenido person1 food) (tiene-contenido person2 food) (tiene-contenido person3 medicine) 	))
)