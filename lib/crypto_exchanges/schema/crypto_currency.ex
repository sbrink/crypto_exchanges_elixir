defmodule CryptoExchanges.Schema.CryptoCurrency do
  @moduledoc """
  Stores information about a currency
  """
  defstruct [:symbol, active: true]
end
