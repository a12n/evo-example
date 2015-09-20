(** [true] with probability [p] (0.5 by default). *)
val bool : ?p:float -> unit -> bool

(** ASCII character with uniform distribution. *)
val char : unit -> char

(** Like [choice2i], but returns elements themselves. *)
val choice2 : (float * 'a) array -> 'a * 'a

(** Choose pair of distinct elements, based on distribution. Return
    array indices. *)
val choice2i : (float * 'a) array -> int * int

(** Like [choicei], but returns element itself, instead of index. *)
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
