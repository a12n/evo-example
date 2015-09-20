open Batteries

type t = Genotype.t Array.t

let random size ~genes_len =
  Array.init size (fun _i -> Genotype.random genes_len)

let repro_prob ~ideal pop =
  let fitness = Array.map (Genotype.fitness ~ideal) pop in
  let sum = Array.sum fitness in
  let prob = Array.map (fun k -> Float.(of_int k /. of_int sum)) fitness in
  Array.map2 (fun p genes -> p, genes) prob pop
