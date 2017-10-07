defmodule CryptoExchanges.BitstampAdapter do
  @moduledoc """
  An Adapter for Bitstamp
  """
  use CryptoExchanges.Adapter

  def get_info, do: %CryptoExchange{
    name: "Bitstamp",
    homepage_url: "https://www.bitstamp.net/",
    api_docs_url: "https://www.bitstamp.net/api/",
    country: "UK"
  }

  def get_currencies do
    [
      %CryptoCurrency{symbol: "BTC"},
      %CryptoCurrency{symbol: "LTC"},
      %CryptoCurrency{symbol: "XRP"}
    ]
  end
end
