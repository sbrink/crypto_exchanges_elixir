defmodule CryptoExchanges.KorbitAdapter do
  @moduledoc """
  An Adapter for Korbit

  Homepage: https://www.korbit.co.kr/
  API Docs: https://apidocs.korbit.co.kr/

  Country: Korea
  """
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.CryptoCurrency

  def coinlist do
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
