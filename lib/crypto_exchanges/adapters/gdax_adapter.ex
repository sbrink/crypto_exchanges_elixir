defmodule CryptoExchanges.GdaxAdapter do
  @moduledoc """
  An Adapter for Gdax

  Homepage: https://www.gdax.com/
  API Docs: https://api.gdax.com/currencies

  Country: Unknown
  """
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.CryptoCurrency

  def coinlist do
    api_coinlist()
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
  defp api_coinlist do
    HTTPoison.get!(@url).body
    |> Poison.decode!
  end
end
