type t = string

val crossover : t -> t -> t

val fitness : ideal:t -> t -> float

val mutated : ?p:float -> t -> t

val random : int -> t
