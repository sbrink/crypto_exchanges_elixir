defmodule CryptoExchanges.TestAdapter do
  @moduledoc """
  TestAdapter
  """
  use CryptoExchanges.Adapter

  def get_info, do: %CryptoExchange{
    name: "Test",
    homepage_url: "https://example.com/",
    api_docs_url: "https://example.com/api/",
    country: "World",
    intervals: []
  }

  def get_currencies do
    [
      %CryptoCurrency{symbol: "BTC"},
      %CryptoCurrency{symbol: "LTC"},
      %CryptoCurrency{symbol: "ETH"}
    ]
  end
end
