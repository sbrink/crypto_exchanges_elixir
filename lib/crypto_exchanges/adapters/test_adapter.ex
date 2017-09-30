defmodule CryptoExchanges.TestAdapter do
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
