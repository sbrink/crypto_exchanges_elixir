defmodule CryptoExchanges.CoinoneAdapter do
  @moduledoc """
  An Adapter for Coinone
  """
  use CryptoExchanges.Adapter

  def get_info, do: %CryptoExchange{
    name: "Coinone",
    homepage_url: "https://coinone.co.kr/",
    api_docs_url: "http://doc.coinone.co.kr/",
    country: "Korea",
    intervals: []
  }

  def get_currencies do
    [
      %CryptoCurrency{symbol: "BTC"},
      %CryptoCurrency{symbol: "ETH"},
      %CryptoCurrency{symbol: "XRP"},
      %CryptoCurrency{symbol: "BCH"},
      %CryptoCurrency{symbol: "ETC"},
      %CryptoCurrency{symbol: "QTUM"}
    ]
  end
end
