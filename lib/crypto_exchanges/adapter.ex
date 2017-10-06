defmodule CryptoExchanges.Adapter do
  @moduledoc """
  Behaviour for creating Crypto Exchange Adapters
  """
  @callback get_currencies() :: any

  # @callback get_markets() :: any
end
