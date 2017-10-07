defmodule CryptoExchanges.BitstampAdapter do
  @moduledoc """
  An Adapter for Bitstamp

  Homepage: https://www.bitstamp.net/
  API Docs: https://www.bitstamp.net/api/

  Country: UK
  """
  use CryptoExchanges.Adapter

  def get_currencies do
    [
      %CryptoCurrency{symbol: "BTC"},
      %CryptoCurrency{symbol: "LTC"},
      %CryptoCurrency{symbol: "XRP"}
    ]
  end
end
