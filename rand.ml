open Batteries

let xi () = Random.float 1.0

let int ?(min=0) ~max () = min + Random.int (max - min + 1)

let char () = Char.chr (int ~min:32 ~max:126 ())

(* TODO: check distr probs to sum to 1.0 *)
let choice distr =
  let p = ref (xi ()) in
  Array.find
    (fun (p_i, _a_i) ->
       if !p < p_i then
         true
       else
         ( p := !p -. p_i;
           false ))
    distr |> snd

let bool ?(p=0.5) () = xi () < p

let seed = Random.self_init
