defmodule CryptoExchanges.CoinoneAdapter do
  @moduledoc """
  An Adapter for Coinone

  Homepage: https://coinone.co.kr/
  API Docs: http://doc.coinone.co.kr/

  Country: Korea
  """
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.CryptoCurrency

  def coinlist do
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
