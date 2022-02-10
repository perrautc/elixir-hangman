defmodule Dictionary.Impl.Wordlist do
  def word_list() do
    "/Users/charles/Documents/gitlab/elixir/hangman/dictionary/assets/words.txt"
    |> File.read!()
    |> String.split(~r/\n/)
    |> Enum.sort()
  end

  def random_word(wordlist), do: wordlist |> Enum.random()
end
