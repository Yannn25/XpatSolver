
open XpatLib

type game = Freecell | Seahaven | Midnight | Baker

type mode =
  | Check of string (* filename of a solution file to check *)
  | Search of string (* filename where to write the solution *)

type config = { mutable game : game; mutable seed: int; mutable mode: mode }
let config = { game = Freecell; seed = 1; mode = Search "" }

let getgame = function
  | "FreeCell"|"fc" -> Freecell
  | "Seahaven"|"st" -> Seahaven
  | "MidnightOil"|"mo" -> Midnight
  | "BakersDozen"|"bc" -> Baker
  | _ -> raise Not_found

let split_on_dot name =
  match String.split_on_char '.' name with
  | [string1;string2] -> (string1,string2)
  | _ -> raise Not_found



let set_game_seed name =
  try
    let (sname,snum) = split_on_dot name in
    config.game <- getgame sname;
    config.seed <- int_of_string snum;
  with _ -> failwith ("Error: <game>.<number> expected, with <game> in "^
                      "FreeCell Seahaven MidnightOil BakersDozen")

(* TODO : La fonction suivante est à adapter et continuer *)

(*type coup = int * char * int

 Option -check qui traite la lecture du fichier solution *)
(*let read filename conf col reg dep = 
  let col_len = PArray.length col in
  let opf = open_in filename in
    try
    (* Execution du coup sur la ligne lu *)
      let next_play col reg dep n_line =
        let col, reg, dep = 
          if n_line = 1 then start_play col reg dep
          else col, reg, dep in
        let str = try
          input_line opf 
          with End_of_file ->
            close_in opf;
            Printf.printf "\n\n\n --- fin du fichier atteint ---\n  ECHEC l : %d" n_line;
            exit 1
        in
      let split = String.split_on_char ' ' str in
      let card, op_c, str_c= 
        match split with
        | x::y:: [] -> Stdlib.int_of_string x, Stdlib.int_of_string y,y
        | _ -> raise Not_found
      in
      let coup, c_depl =
      if op_c = None then
        if str_c = "T" then Registre,0
        else if str_c = "V" then Video,0
        else raise Not_found
      else Colonne, (match op_c with
      | Some card -> card
      | None -> raise Not_found)
    in

    (* verify_coup new_coup split*)
    print_card card;
    print_string "->";
  done
with End_of_file ->
  close_in opf;
  ;;


 let new_coup list = ;; 

let verify_coup coup = function;; *)





(*let colonnes, registres = Configuration.partie_init permut conf.game in
  let depots = PArray.make 4 (-1);
  (match conf.mode with
	| Check filename -> read filename conf.game colonnes registres depots
	| Search "" -> ()); *)
	(*| ( *Search filename -> a compléter ...*)
  (* let depots = PArray.make 4 (-1) in*)

  let treat_game conf =
    let permut = XpatRandom.shuffle conf.seed in
  Printf.printf "Voici juste la permutation de graine %d:\n" conf.seed;
  List.iteri (fun n e -> Printf.printf "  %2d : (%2d %4s)" (n+1) e
  (Card.to_string (Card.of_num e)); 
  if (n mod 4) + 1 = 4 then print_newline ()) permut;
    
    print_newline ();
    print_string "C'est tout pour l'instant. TODO: continuer...\n";
    exit 0
  
  let main () =
    Arg.parse
      [("-check", String (fun filename -> config.mode <- Check filename),
          "<filename>:\tValidate a solution file");
       ("-search", String (fun filename -> config.mode <- Search filename),
          "<filename>:\tSearch a solution and write it to a solution file")]
      set_game_seed (* pour les arguments seuls, sans option devant *)
      "XpatSolver <game>.<number> : search solution for Xpat2 game <number>";
    treat_game config
  
  let _ = if not !Sys.interactive then main () else ()
  