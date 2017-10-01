defmodule CryptoExchanges.CryptoCurrency do
  @moduledoc """
  Stores information about a currency
  """
  defstruct [:symbol, active: true]
end
