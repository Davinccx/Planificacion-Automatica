(define (domain dron)
    
    (:requirements :strips  :typing )

    (:types brazo caja localizacion persona dron contenido
    )



    (:predicates
        (localizacion-dron ?l - localizacion ?d - dron)
        (localizacion-caja ?l - localizacion ?c - caja)
        (localizacion-persona ?l - localizacion ?p - persona)
        (libre ?b - brazo)
        (caja-tiene-contenido ?c - caja ?cont - contenido)
        (persona-tiene-contenido ?p - persona ?cont - contenido)
        (persona-necesita ?p - persona ?cont - contenido)
        (llevando ?b - brazo ?c - caja)
    )
    (:action coger
        :parameters (?brazo - brazo ?caja - caja ?loc - localizacion ?contenido - contenido ?dron - dron ?persona - persona) 
        :precondition (and (localizacion-dron ?loc ?dron) (localizacion-caja ?loc ?caja) (libre ?brazo)
            (caja-tiene-contenido ?caja ?contenido) (persona-necesita ?persona ?contenido))
        :effect (and (llevando ?brazo ?caja) (not(libre ?brazo)) 
            (not(localizacion-caja ?loc ?caja)))
    )
    (:action mover-dron
        :parameters (?from - localizacion ?to - localizacion ?dron - dron)
        :precondition (and (localizacion-dron ?from ?dron) (localizacion-dron ?to ?dron))
        :effect (and (not(localizacion-dron ?from ?dron)) (localizacion-dron ?to ?dron))
    )

    (:action mover-caja
        :parameters (?from - localizacion ?to - localizacion ?dron - dron ?caja - caja ?brazo - brazo)
        :precondition (and (localizacion-dron ?from ?dron) (localizacion-dron ?to ?dron) (localizacion-caja ?from ?caja)
            (llevando ?brazo ?caja) )
        :effect (and (not(localizacion-dron ?from ?dron)) (localizacion-dron ?to ?dron))
    )
    
    (:action dejar
        :parameters (?caja - caja ?localizacion - localizacion ?dron - dron ?brazo - brazo ?persona - persona ?contenido - contenido)
        :precondition (and (llevando ?brazo ?caja) (localizacion-persona ?localizacion ?persona)
            (localizacion-dron ?localizacion ?dron)  (persona-necesita ?persona ?contenido))
        :effect (and (localizacion-caja ?localizacion ?caja) (libre ?brazo) (not(llevando ?brazo ?caja))
            (persona-tiene-contenido ?persona ?contenido) (not(persona-necesita ?persona ?contenido)))
    )
    

)