defmodule CryptoExchangesTest do
  use ExUnit.Case
  doctest CryptoExchanges

  test "greets the world" do
    assert CryptoExchanges.hello() == :world
  end
end
