defmodule CryptoExchanges.TestAdapter do
  @moduledoc """
  TestAdapter
  """
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.CryptoCurrency

  def coinlist do
    [
      %CryptoCurrency{symbol: "BTC"},
      %CryptoCurrency{symbol: "LTC"},
      %CryptoCurrency{symbol: "ETH"}
    ]
  end
end
