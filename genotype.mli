type t = string

val fitness : ideal:t -> t -> int

val mutated : ?p:float -> t -> t

val random : int -> t
