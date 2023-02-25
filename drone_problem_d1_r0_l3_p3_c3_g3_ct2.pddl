(define (problem drone_problem)
(:domain dron)
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
(caja-tiene-contenido crate1 medicine ) (caja-tiene-contenido crate2 medicine) (caja-tiene-contenido crate3 medicine) 
(persona-necesita person1 medicine) (persona-necesita person2 medicine) (persona-necesita person3 medicine) 

)
(:goal (and
(localizacion-dron depot drone1)
(persona-tiene-contenido person1 medicine) (persona-tiene-contenido person2 medicine) (persona-tiene-contenido person3 medicine) 	))
)
