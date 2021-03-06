defmodule CryptoExchanges.GeminiAdapter do
  @moduledoc """
  An Adapter for Gemini
  """
  use CryptoExchanges.Adapter

  def get_info, do: %CryptoExchange{
    name: "Gemini",
    homepage_url: "https://gemini.com/",
    api_docs_url: "https://docs.gemini.com/rest-api/",
    country: "USA",
    intervals: []
  }

  def get_currencies do
    api_get_currencies()
    |> Enum.map(&transform_gemini_currency/1)
    |> List.flatten
    |> Enum.uniq_by(&(&1.symbol))
  end

  def transform_gemini_currency(gemini_currency) do
    {first, second} = get_currencies_from_pair(gemini_currency)

    [
      %CryptoCurrency{
        active: true,
        symbol: first
      },
      %CryptoCurrency{
        active: true,
        symbol: second
      }
    ]
  end

  def get_currencies_from_pair(pair) do
    pair
    |> String.upcase
    |> String.split_at(3)
  end

  # Private functions
  @url "https://api.gemini.com/v1/symbols"
  defp api_get_currencies do
    HTTPoison.get!(@url).body
    |> Poison.decode!
  end
end
