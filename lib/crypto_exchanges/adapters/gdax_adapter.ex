defmodule CryptoExchanges.GdaxAdapter do
  @moduledoc """
  An Adapter for Gdax

  Homepage: https://www.gdax.com/
  API Docs: https://docs.gdax.com/

  Country: Unknown
  """
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.CryptoCurrency

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
