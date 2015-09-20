open Batteries

type t = string

let crossover a _b =
  (* TODO *)
  a

let fitness ~ideal genes =
  (-1) * String.edit_distance ideal genes

let mutated ?(p=0.05) genes =
  String.(init (length genes)
            (fun i ->
               if Rand.bool ~p () then
                 Rand.char ()
               else
                 genes.[i]))

let random len = String.init len (fun _i -> Gene.random ())
