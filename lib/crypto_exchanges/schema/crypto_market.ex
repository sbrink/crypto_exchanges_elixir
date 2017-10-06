defmodule CryptoExchanges.Schema.CryptoMarket do
  @moduledoc """
  Stores information about a market
  """
  defstruct [:symbol, :base_symbol, :name, active: true]
end
