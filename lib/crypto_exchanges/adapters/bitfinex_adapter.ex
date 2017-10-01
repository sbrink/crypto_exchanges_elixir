defmodule CryptoExchanges.BitfinexAdapter do
  @moduledoc """
  An Adapter for the Bitfinex Exchange

  Homepage: https://www.bitfinex.com/
  API Docs: https://docs.bitfinex.com/docs

  Country: China
  """
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.CryptoCurrency

  def get_currencies do
    api_get_symbols_details()
    |> Enum.map(&transform_bitfinex_currency/1)
    |> List.flatten
    |> Enum.uniq_by(&(&1.symbol))
  end

  def transform_bitfinex_currency(bitfinex_currency) do
    {first, second} = get_currencies_from_pair(bitfinex_currency["pair"])

    [
      %CryptoCurrency{
        active: true,
        symbol: symbol_mapping(first)
      },
      %CryptoCurrency{
        active: true,
        symbol: symbol_mapping(second)
      }
    ]
  end

  def get_currencies_from_pair(pair) do
    pair
    |> String.upcase
    |> String.split_at(3)
  end

  @doc "Bitfinex shortens some currency symbols (e.g. DASH)"
  def symbol_mapping("DSH"), do: "DASH"
  def symbol_mapping(symbol), do: symbol

  # Private functions
  @url "https://api.bitfinex.com/v1/symbols_details"
  defp api_get_symbols_details do
    HTTPoison.get!(@url).body
    |> Poison.decode!
  end
end
