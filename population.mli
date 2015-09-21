type t = Genotype.t array

(** Random population of [size], with genotypes of size
    [genes_len]. *)
val random : int -> genes_len:int -> t

(** Reproduction probability for each of the specimen, based on the
    fitness. *)
val repro_prob : target:Genotype.t -> t -> (float * Genotype.t) array
