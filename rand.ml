open Batteries

let xi () = Random.float 1.0

let int ?(min=0) ~max () = min + Random.int (max - min + 1)

let char () = Char.chr (int ~min:32 ~max:126 ())

(* TODO: check distr probs to sum to 1.0 *)
let choicei distr =
  let p = ref (xi ()) in
  Array.findi
    (fun (p_i, _a_i) ->
       if !p < p_i then
         true
       else
         ( p := !p -. p_i;
           false )) distr

let choice distr = snd distr.(choicei distr)

let choice2i distr =
  let rec choose_distinct i =
    match choicei distr with
      j when j != i -> i, j
    | j -> choose_distinct i in
  choose_distinct (choicei distr)

let choice2 distr =
  let i, j = choice2i distr in
  snd distr.(i), snd distr.(j)

let bool ?(p=0.5) () = xi () < p

let seed = Random.self_init
