defmodule CryptoExchanges.KorbitAdapter do
  @moduledoc """
  An Adapter for Korbit
  """
  use CryptoExchanges.Adapter

  def get_info, do: %CryptoExchange{
    name: "Korbit",
    homepage_url: "https://www.korbit.co.kr/",
    api_docs_url: "https://apidocs.korbit.co.kr/",
    country: "Korea",
    intervals: []
  }

  def get_currencies do
    [
      %CryptoCurrency{symbol: "BCH"},
      %CryptoCurrency{symbol: "BTC"},
      %CryptoCurrency{symbol: "ETC"},
      %CryptoCurrency{symbol: "ETH"},
      %CryptoCurrency{symbol: "LTC"},
      %CryptoCurrency{symbol: "XRP"}
    ]
  end
end
