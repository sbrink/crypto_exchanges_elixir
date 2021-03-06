defmodule CryptoExchanges.BinanceAdapter do
  @moduledoc """
  An Adapter for Binance
  """
  use CryptoExchanges.Adapter

  def get_info, do: %CryptoExchange{
    name: "Binance",
    homepage_url: "https://www.binance.com/",
    api_docs_url: "https://www.binance.com/restapipub.html",
    country: "China",
    intervals: []
  }

  def get_currencies do
    [
      %CryptoCurrency{symbol: "BTC"},
      %CryptoCurrency{symbol: "ETH"},
      %CryptoCurrency{symbol: "BCH"},
      %CryptoCurrency{symbol: "LTC"},
      %CryptoCurrency{symbol: "NEO"},
      %CryptoCurrency{symbol: "OMG"},
      %CryptoCurrency{symbol: "QTUM"},
      %CryptoCurrency{symbol: "STRAT"},
      %CryptoCurrency{symbol: "EOS"},
      %CryptoCurrency{symbol: "BNB"},
      %CryptoCurrency{symbol: "GAS"},
      %CryptoCurrency{symbol: "ZRX"},
      %CryptoCurrency{symbol: "MCO"},
      %CryptoCurrency{symbol: "SNGLS"},
      %CryptoCurrency{symbol: "BQX"},
      %CryptoCurrency{symbol: "OAX"},
      %CryptoCurrency{symbol: "WTC"}
    ]
  end
end
