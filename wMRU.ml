open Batteries

let fname = Sys.getenv "HOME" ^ "/.wMRU"
let rw_perm = BatFile.perm [BatFile.user_read ; BatFile.user_write]

let print_line line = print_string (line  ^ "\n" )

let read_lines () = BatFile.with_file_in
                     ~mode:[`create]
		     ~perm:rw_perm
		     fname
		     (fun fh -> BatList.of_enum (BatIO.lines_of fh))

let do_get () = List.iter print_line  (read_lines () )

let do_add () = let args = List.tl (List.tl (Array.to_list Sys.argv)) in
			    let line = String.concat " " args in
			    let lines = List.filter (fun s -> not (BatString.equal s line)) (read_lines ()) in
			    BatFile.write_lines fname (BatList.enum (line::lines))

let do_command () = match Sys.argv.(1) with
 | "get" -> do_get ()
 | "add" -> do_add()
 | _ 	 -> print_string "You must not be walt"
					
let () = do_command ()
