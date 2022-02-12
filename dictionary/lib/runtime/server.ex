defmodule Dictionary.Runtime.Server do
  use Agent
  alias Dictionary.Impl.Wordlist

  @me __MODULE__
  @type t :: pid()
  def start_link(_) do
    Agent.start_link(&Wordlist.word_list/0, name: @me)
  end

  def random_word() do
    Agent.get(@me, &Wordlist.random_word/1)
  end
end
