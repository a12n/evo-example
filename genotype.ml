open Batteries

type t = string

let crossover a b =
  let len_a, len_b = String.(length a, length b) in
  let min_len = min len_a len_b in
  let max_len = max len_a len_b in
  let k = Rand.int ~max:(min_len - 1) () in
  String.init max_len (fun i -> if i > k then a.[i] else b.[i])

let fitness ~target genes =
  let len = min (String.length target) (String.length genes) in
  let score = Enum.init len (fun i -> target.[i] == genes.[i])
              |> Enum.map Bool.to_int |> Enum.sum in
  Float.of_int (score * score)

let mutated ?(p=0.02) genes =
  String.(init (length genes)
            (fun i ->
               if Rand.bool ~p () then
                 Rand.char ()
               else
                 genes.[i]))

let random len = String.init len (fun _i -> Gene.random ())
