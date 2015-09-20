type t = string

val crossover : t -> t -> t

val fitness : ideal:t -> t -> int

val mutated : ?p:float -> t -> t

val random : int -> t
