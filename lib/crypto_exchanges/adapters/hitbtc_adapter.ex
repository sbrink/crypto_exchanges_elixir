defmodule CryptoExchanges.HitbtcAdapter do
  @moduledoc """
  An Adapter for the Hitbtc Exchange

  Homepage: https://hitbtc.com/
  API Docs: https://hitbtc.com/api

  Country: UK
  """
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.CryptoCurrency

  def coinlist do
    api_get_markets()
    |> get_in(["symbols"])
    |> Enum.map(&transform_hitbtc_currency/1)
    |> Enum.uniq_by(&(&1.symbol))
  end

  def transform_hitbtc_currency(hitbtc_currency) do
    %CryptoCurrency{
      active: true,
      symbol: hitbtc_currency["commodity"]
    }
  end

  # Private functions
  @url "https://api.hitbtc.com/api/1/public/symbols"
  defp api_get_markets do
    HTTPoison.get!(@url).body
    |> Poison.decode!
  end
end
