(define (domain drone-domain)
    
    (:requirements :strips  :typing )

    (:types brazo caja localizacion persona dron contenido
    )

    (:predicates
        (localizacion-dron ?l - localizacion ?d - dron)
        (localizacion-caja ?l - localizacion ?c - caja)
        (localizacion-persona ?l - localizacion ?p - persona)
        (libre ?b - brazo)
        (caja-tiene-contenido ?c - caja ?cont - contenido)
        (tiene-contenido ?p - persona ?cont - contenido)
        (necesita ?p - persona ?cont - contenido)
        (llevando ?b - brazo ?c - caja)
    )
   

    (:action mover-dron
        :parameters (?from - localizacion  ?to - localizacion ?d - dron )
        :precondition (and 
            (localizacion-dron ?from ?d))
        :effect (and (localizacion-dron ?to ?d)
                (not(localizacion-dron ?from ?d)))
    )

    (:action coger
        :parameters (?caja - caja ?l - localizacion ?contenido - contenido ?dron - dron ?brazo - brazo ?persona - persona)
        :precondition (and
            (localizacion-caja ?l ?caja)(localizacion-dron ?l ?dron)
            (libre ?brazo)(caja-tiene-contenido ?caja ?contenido)(necesita ?persona ?contenido)    
        )
        :effect (and

            (llevando ?brazo ?caja)
            (not(libre ?brazo))
            (not(localizacion-caja ?l ?caja))
        
         )
    )


    (:action dejar_caja

        :parameters (?caja - caja ?localizacion - localizacion ?dron - dron ?persona - persona ?brazo - brazo ?cont - contenido)
        :precondition (and
        (localizacion-persona?localizacion ?persona)(localizacion-dron ?localizacion ?dron)
        (llevando ?brazo ?caja)
        )
        :effect (and 
                (tiene-contenido ?persona ?cont)
                (not(necesita ?persona ?cont))
                (libre ?brazo)
                (not(llevando ?brazo ?caja)))
    )

    (:action mover_caja
        :parameters (?persona - persona ?localizacion - localizacion ?contenido - contenido ?caja - caja ?brazo - brazo ?dron - dron)
        :precondition (and
         (llevando ?brazo ?caja) (necesita ?persona ?contenido)
         (localizacion-persona ?localizacion ?persona)(localizacion-dron ?localizacion ?dron)
        )
        :effect (and 
        (not(localizacion-dron ?localizacion ?dron))
        )
    )
    

    

)