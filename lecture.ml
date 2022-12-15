let op = open_in "test.txt" in
let line = input_line op in
close_in op ;
print_endline line ;;