(** In Xpat2, the index of the game is a seed used to shuffle
    pseudo-randomly the cards.
    The shuffle function emulates this permutation generator.
    The input number is the seed (in 1..999_999_999).
    The output list is of size 52, and contains all numbers in 0..51
    (hence without duplicates).
*)

val shuffle : int -> int list

(* tri insertion pour la liste de 55 paires 
x une paire de la liste l
l la liste de 55 paires *)
val insert x l : int -> int list -> int list

val trier l : int list -> int list

(* retourner la sousliste de la liste l incluant l'index x à l'index y *)
val sousliste l x y : int list -> int -> int -> int list

(* retourner une liste avec les premiers elements de liste de paires. *)
val prendre_premier l : (int * int) list -> int list

(* retourner le modulo a b *)
val modulo a b : int -> int -> int

(* effectuer un tirage
    x compteur
   f1 fifo 
   f2 fifo
   d difference de f1 et f2 *)
val tirage x f1 f2 d : int -> fifo t -> fifo t -> int -> (fifo t -> fifo t -> int) 

(* retourner la liste de permutation
x compteur
f1 fifo 
f2 fifo
l liste de 52 chiffres *)
val permutation x f1 f2 l : int -> fifo t -> fifo t -> int list -> int list