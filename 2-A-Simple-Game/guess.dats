(* ****** ****** *)
//
// guess.dats
// A simple implementation of guess the number.
//
(* ****** ****** *)

#include "./staloadall.hats"

(* ****** ****** *)

implement play_again() =
  let
    val _ = print("Play again? (y/n) ")
    val line = fileref_get_line_string(stdin_ref)
  in
    ifcase
    | line = "y" => start_game()
    | line = "n" => println!("Goodbye!")
    | _ => play_again() where {
        val _ = println!("Please enter 'y' or 'n'.")
      }
  end

implement get_response() =
  let val line = fileref_get_line_string(stdin_ref) in
    if line = ">" || line = "<" || line = "=" then line
    else get_response() where {
      val _ = println!("Please enter '<', '>', or '='.")
    }
  end

implement game_loop(low, high) =
  let
    val guess = (high - low) / 2 + low
    val _ = print!("Is your number ", guess, "?\n")
    val line = get_response()
  in
    ifcase
    | line = "=" => play_again() where {
        val _ = println!("I got it!")
      }
    | line = ">" => game_loop(guess, high)
    | line = "<" => game_loop(low, guess)
  end

local
  val low = 0
  val high = 100
in
  implement start_game() = game_loop(low, high) where {
    val _ = println!("Please think of a number between ", low, " and ", high)
    val _ = print("Press enter when you have it.")
    val _ = fileref_get_line_string(stdin_ref)
  }
end

implement main0() = start_game() where {
  val _ = print("Welcome to Guess the Number!\n")
}

(* end of [guess.dats] *)