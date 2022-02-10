defmodule DicionaryTest do
  use ExUnit.Case
  doctest Dicionary

  test "greets the world" do
    assert Dicionary.hello() == :world
  end
end
