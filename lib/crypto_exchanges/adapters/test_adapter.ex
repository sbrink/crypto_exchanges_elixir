defmodule CryptoExchanges.TestAdapter do
  @moduledoc """
  TestAdapter
  """
  use CryptoExchanges.Adapter

  def get_currencies do
    [
      %CryptoCurrency{symbol: "BTC"},
      %CryptoCurrency{symbol: "LTC"},
      %CryptoCurrency{symbol: "ETH"}
    ]
  end
end
