defmodule CryptoExchanges.BinanceAdapter do
  @moduledoc """
  An Adapter for Binance

  Homepage: https://www.binance.com/
  API Docs: https://www.binance.com/restapipub.html

  Country: China
  """
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.Schema.CryptoCurrency

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
