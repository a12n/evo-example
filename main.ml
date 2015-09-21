open Batteries

let wait_key () = ignore (read_line ())

let rec run target population generation =
  Printf.printf "%-70s %05d\n\n" target generation;
  let mating_pool = Population.repro_prob ~target population in
  Array.sort (fun a b -> (-1) * (compare a b)) mating_pool;
  Array.iter (fun (p, genes) ->
      Printf.printf "%-70s %g\n" genes p) (Array.sub mating_pool 0 39);
  wait_key ();
  let size = Array.length population in
  let next_generation = generation + 1 in
  let next_population = Array.init size
      (fun _i ->
         let a, b = Rand.choice2 mating_pool in
         Genotype.(mutated ~p:0.01 (crossover a b))) in
  run target next_population next_generation

let _ =
  let size = 1000 in
  let target = "Homo sapiens sapiens, the apex of creation" in
  Rand.seed ();
  let genes_len = String.length target in
  let pop = Population.random ~genes_len size in
  run target pop 1
