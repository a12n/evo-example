open Batteries

type t = string

let fitness ~ideal genes =
  (-1) * String.edit_distance ideal genes

let mutated ?(p=0.05) genes =
  if Rand.bool ~p () then
    ( let max = String.length genes - 1 in
      let k = Rand.int ~max () in
      let copy = String.copy genes in
      copy.[k] <- Rand.char ();
      copy )
  else
    genes

let random len = String.init len (fun _i -> Gene.random ())
