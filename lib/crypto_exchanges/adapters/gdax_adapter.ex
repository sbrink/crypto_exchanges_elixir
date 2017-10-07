defmodule CryptoExchanges.GdaxAdapter do
  @moduledoc """
  An Adapter for Gdax
  """
  use CryptoExchanges.Adapter

  def get_info, do: %CryptoExchange{
    name: "Gdax",
    homepage_url: "https://www.gdax.com/",
    api_docs_url: "https://docs.gdax.com/",
    country: "Unknown",
    intervals: []
  }

  def get_currencies do
    api_get_currencies()
    |> Enum.map(&transform_currency/1)
  end

  def transform_currency(response) do
    %CryptoCurrency{
      active: true,
      symbol: response["id"]
    }
  end

    # Private functions
  @url "https://api.gdax.com/currencies"
  defp api_get_currencies do
    HTTPoison.get!(@url).body
    |> Poison.decode!
  end
end
