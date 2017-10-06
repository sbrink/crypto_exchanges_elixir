defmodule CryptoExchanges.BittrexAdapter do
  @moduledoc """
  An Adapter for the Bittrex Exchange

  Homepage: https://bittrex.com/
  API Docs: https://bittrex.com/home/api

  Country: USA
  """
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.Schema.CryptoCurrency

  def get_currencies do
    api_get_markets()
    |> get_in(["result"])
    |> Enum.map(&transform_bittrex_currency/1)
    |> Enum.uniq_by(&(&1.symbol))
  end

  def transform_bittrex_currency(bittrex_currency) do
    %CryptoCurrency{
      active: true,
      symbol: bittrex_currency["MarketCurrency"]
    }
  end

  # Private functions
  @url "https://bittrex.com/api/v1.1/public/getmarkets"
  defp api_get_markets do
    HTTPoison.get!(@url).body
    |> Poison.decode!
  end
end
