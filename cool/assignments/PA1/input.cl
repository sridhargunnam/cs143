(*
* Comment
*)

(*
* Basic Class 0 - with main method
*)
class Main inherits IO {
   main() : Object {
      out_string("hello world\n")
   };
};

(*
Tests for the Lexer:
1. Correct line numbers
2. Ignoring comments
3. Error reporting on bad comments
4. Unterminated literal string error
5. Literal string too long error
*)


