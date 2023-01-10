(* Dans la suite ne pas oublier d'implémenter l'historique des coups !!!! *)


let partie_init permutation config = 
  match config with
  | Freecell | Bakers -> fc_bk_init permutation config
  | Seahaven | Midnight -> sh_md_init permutation config
;;

let fc_bk_init permut config =
  let registre = List.make 
  let colonne = PArray.make
;;

let sh_md_init permut config = ;;