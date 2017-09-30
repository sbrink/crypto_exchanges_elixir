defmodule CryptoExchanges.Adapter do
  @moduledoc """
  Behaviour for creating Crypto Exchange Adapters
  """
  @callback coinlist() :: any
end
