defmodule TextClient.Impl.Player do
  @typep game :: Hangman.game()
  @typep tally :: Hangman.tally()
  @typep state :: {game, tally}
  def start() do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    interact({game, tally})
  end

  def interact({_game, _tally = %{game_state: :won}}) do
    IO.puts("Congratulations. You Won!")
  end

  def interact({game, _tally = %{game_state: :lost}}) do
    IO.puts("Sorry. You Lost ... the word was #{game.letters |> Enum.join("")}")
  end

  @spec interact(state) :: no_return
  def interact({game, tally}) do
    IO.puts(feedback_for(tally))
    IO.puts(current_word(tally))

    game
    |> Hangman.make_move(get_guess())
    |> interact()
  end

  def feedback_for(tally = %{game_state: :initializing}),
    do: "Welcome! I'm thinking of a #{tally.letters |> length} letter word"

  def feedback_for(%{game_state: :good_guess}), do: "Good guess!"
  def feedback_for(%{game_state: :bad_guess}), do: "Sorry, that letter's not in the word"
  def feedback_for(%{game_state: :already_used}), do: "You already used that letter"

  def current_word(tally) do
    [
      "Word so far: ",
      tally.letters |> Enum.join(" "),
      "   turns left: ",
      tally.turns_left |> to_string,
      "   used so far: ",
      tally.used |> Enum.join(",")
    ]
  end

  def get_guess() do
    IO.gets("Next letter: ") |> String.trim() |> String.downcase()
  end
end
