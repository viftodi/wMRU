# wMRU
Walt's Most Recently Used

###Compiling

1) First install opam, instructions here https://opam.ocaml.org/doc/Install.html

2) Use opam to install batteries and ocamlfind (opam install ocamlfind)

   Note: batteries requires installing a native package m4 first to work, else the install will fail

3) Get yourself in the wMRU directory and run :

   ocamlfind ocamlopt -package batteries -linkpkg -o wMRU wMRU.ml
   
   Optionally you could also copy this into your /usr/bin/ or edit your $PATH variable.


###USAGE

./wMRU get will retrieve all the entries
./wMRU add an entry here  will add or move the "an entry here" to the top of the list

