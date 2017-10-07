defmodule CryptoExchanges.KrakenAdapter do
  @moduledoc """
  An Adapter for the Kraken Exchange
  """
  use CryptoExchanges.Adapter

  def get_info, do: %CryptoExchange{
    name: "Kraken",
    homepage_url: "https://www.kraken.com/",
    api_docs_url: "https://www.kraken.com/en-us/help/api",
    country: "USA"
  }

  def get_currencies do
    api_public_assets()
    |> get_in(["result"])
    |> Enum.map(&transform_kraken_currency/1)
  end

  def transform_kraken_currency({_, kraken_currency}) do
    %CryptoCurrency{
      active: true,
      symbol: kraken_currency["altname"]
    }
  end

  # Private functions
  @url "https://api.kraken.com/0/public/Assets"
  defp api_public_assets do
    HTTPoison.get!(@url).body
    |> Poison.decode!
  end
end
