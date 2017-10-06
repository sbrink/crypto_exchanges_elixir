defmodule CryptoExchanges.BitstampAdapter do
  @moduledoc """
  An Adapter for Bitstamp

  Homepage: https://www.bitstamp.net/
  API Docs: https://www.bitstamp.net/api/

  Country: UK
  """
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.Schema.CryptoCurrency

  def get_currencies do
    [
      %CryptoCurrency{symbol: "BTC"},
      %CryptoCurrency{symbol: "LTC"},
      %CryptoCurrency{symbol: "XRP"}
    ]
  end
end
