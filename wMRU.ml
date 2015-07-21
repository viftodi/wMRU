open Batteries

let rw_perm = BatFile.perm [BatFile.user_read ; BatFile.user_write]

let get_path fname = Sys.getenv "HOME" ^ "/." ^ fname

let print_line line = print_string (line  ^ "\n" )

let read_lines fname = BatFile.with_file_in
                     ~mode:[`create]
		     ~perm:rw_perm
		     (get_path fname)
		     (fun fh -> BatList.of_enum (BatIO.lines_of fh))

let do_get fname = List.iter print_line  (read_lines fname )

let do_add fname = let args = List.tl (List.tl (List.tl (Array.to_list Sys.argv))) in
			    let line = String.concat " " args in
			    let lines = List.filter (fun s -> not (BatString.equal s line)) (read_lines fname) in
			    BatFile.write_lines (get_path fname) (BatList.enum (line::lines))

let do_command () = let fname = Sys.argv.(2) in
		match Sys.argv.(1) with
		| "get" -> do_get fname
		| "add" -> do_add fname
		| _ 	 -> print_string "You must not be walt"
					
let () = do_command ()
