open Batteries

type t = Genotype.t Array.t

let random size ~genes_len =
  Array.init size (fun _i -> Genotype.random genes_len)

let repro_prob ~target pop =
  let fitness = Array.map (Genotype.fitness ~target) pop in
  let sum = Array.fsum fitness in
  let prob = Array.map (fun k -> k /. sum) fitness in
  Array.map2 (fun p genes -> p, genes) prob pop
