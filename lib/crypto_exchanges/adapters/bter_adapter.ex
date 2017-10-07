defmodule CryptoExchanges.BterAdapter do
  @moduledoc """
  An Adapter for Bter
  """
  use CryptoExchanges.Adapter

  def get_info, do: %CryptoExchange{
    name: "Bter",
    homepage_url: "https://bter.com/",
    api_docs_url: "https://bter.com/api2",
    country: "Unknown",
    intervals: []
  }

  def get_currencies do
    api_get_currencies()
    |> get_in(["data"])
    |> Enum.map(&transform_bter_currency/1)
    |> Enum.uniq_by(&(&1.symbol))
  end

  def transform_bter_currency(bter_currency) do
    %CryptoCurrency{
      active: true,
      symbol: bter_currency["symbol"]
    }
  end

  # Private functions
  @url "http://data.bter.com/api2/1/marketlist"
  defp api_get_currencies do
    HTTPoison.get!(@url).body
    |> Poison.decode!
  end
end
