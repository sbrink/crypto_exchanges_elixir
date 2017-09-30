defmodule CryptoExchanges.PoloniexAdapter do
  @moduledoc """
  An Adapter for the Poloniex Exchange

  Homepage: https://poloniex.com/
  API Docs: https://poloniex.com/support/api/

  Country: USA
  """
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.CryptoCurrency

  def coinlist do
    api_get_markets()
    |> Enum.map(&transform_poloniex_currency/1)
  end

  def transform_poloniex_currency({symbol, value}) do
    %CryptoCurrency{
      active: !convert_boolean(value["disabled"]) && !convert_boolean(value["delisted"]),
      symbol: symbol
    }
  end

  # Private functions
  @url "https://poloniex.com/public?command=returnCurrencies"
  defp api_get_markets do
    HTTPoison.get!(@url).body
    |> Poison.decode!
  end

  defp convert_boolean(0), do: false
  defp convert_boolean("0"), do: false
  defp convert_boolean("false"), do: false
  defp convert_boolean(false), do: false
  defp convert_boolean(1), do: true
  defp convert_boolean("1"), do: true
  defp convert_boolean("true"), do: true
  defp convert_boolean(true), do: true
  defp convert_boolean(_), do: false
end
