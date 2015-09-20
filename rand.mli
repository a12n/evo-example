(** [true] with probability [p] (0.5 by default). *)
val bool : ?p:float -> unit -> bool

(** ASCII character with uniform distribution. *)
val char : unit -> char

(** Choose a single [a] according to the distribution. *)
val choice : (float * 'a) array -> 'a

(** Choose a single [a] according to the distribution. Return array
    index. *)
val choicei : (float * 'a) array -> int

(** Integer from [min] (0 by default) to [max] inclusive with uniform
    distribution. *)
val int : ?min:int -> max:int -> unit -> int

(** Initialize with more or less random seed. *)
val seed : unit -> unit

(** Canonical uniform random variable. *)
val xi : unit -> float
