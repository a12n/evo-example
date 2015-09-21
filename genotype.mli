type t = string

val crossover : t -> t -> t

val fitness : target:t -> t -> float

val mutated : ?p:float -> t -> t

val random : int -> t
