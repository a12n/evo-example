open Batteries

let wait_key () = ignore (read_line ())

let diff pattern str =
  let normal = String.of_char in
  let highlight char = "\x1b[31m" ^ String.of_char char ^ "\x1b[0m" in
  let n = String.length pattern in
  assert String.(length str == n);
  List.init n (fun i ->
    if pattern.[i] != str.[i] then
      highlight str.[i]
    else
      normal str.[i]) |> String.join ""

let rec run target population generation =
  Printf.printf "%-70s %05d\n\n" target generation;
  let mating_pool = Population.repro_prob ~target population in
  Array.sort (fun a b -> (-1) * (compare a b)) mating_pool;
  Array.iter (fun (p, genes) ->
    Printf.printf "%-70s %g\n" (diff target genes) p)
    (Array.sub mating_pool 0 39);
  wait_key ();
  let size = Array.length population in
  let next_generation = generation + 1 in
  let next_population = Array.init size
      (fun _i ->
         let a, b = Rand.choice2 mating_pool in
         Genotype.(mutated ~p:0.01 (crossover a b))) in
  run target next_population next_generation

let parse_args () =
  let target = ref "Homo sapiens sapiens, the apex of creation" in
  let size = ref 1000 in
  Arg.parse [ "-target", Arg.Set_string target,
              Printf.sprintf "The ultimate genotype (default \"%s\")" !target;
              "-size", Arg.Set_int size,
              Printf.sprintf "Population size (default %d)" !size ]
    (fun _anon -> ())
    "Evolution of a string of text";
  !target, !size

let _ =
  let target, size = parse_args () in
  Rand.seed ();
  let genes_len = String.length target in
  let pop = Population.random ~genes_len size in
  run target pop 1
