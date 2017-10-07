defmodule CryptoExchanges.Schema.CryptoCandle do
  @moduledoc """
  Stores information about ohcl candle chart
  """
  defstruct [:time, :open, :high, :close, :low, :volume]
end
