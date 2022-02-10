defmodule Dictionary do
  alias Dictionary.Impl.Wordlist
  defdelegate random_word(wordlist), to: Wordlist
  defdelegate word_list(), to: Wordlist
end
