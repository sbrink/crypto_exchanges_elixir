defmodule CryptoExchanges.BittrexAdapter do
  @moduledoc """
  An Adapter for the Bittrex Exchange
  """
  use CryptoExchanges.Adapter

  def get_info, do: %CryptoExchange{
    name: "Bittrex",
    homepage_url: "https://bittrex.com/",
    api_docs_url: "https://bittrex.com/home/api",
    country: "USA"
  }

  def get_currencies do
    api_get_markets()
    |> Enum.map(&transform_bittrex_currency/1)
    |> Enum.uniq_by(&(&1.symbol))
  end

  def transform_bittrex_currency(bittrex_currency) do
    %CryptoCurrency{
      active: bittrex_currency["IsActive"],
      symbol: bittrex_currency["MarketCurrency"]
    }
  end

  def get_markets do
    api_get_markets()
    |> Enum.map(&transform_bittrex_market/1)
  end

  def transform_bittrex_market(bittrex_currency) do
    %CryptoMarket{
      active: bittrex_currency["IsActive"],
      symbol: bittrex_currency["MarketCurrency"],
      base_symbol: bittrex_currency["BaseCurrency"],
      name: bittrex_currency["MarketName"]
    }
  end

  def get_candles(symbol1, symbol2, interval, from) do
    candles = api_get_ticks(symbol1, symbol2, interval, from)

    candles
    |> Enum.map(&transform_bittrex_candle/1)
  end

  def transform_bittrex_candle(bittrex_candle) do
    {:ok, datetime, 0} = DateTime.from_iso8601("#{bittrex_candle["T"]}Z")

    %CryptoCandle{
      time: datetime,
      open: bittrex_candle["O"],
      high: bittrex_candle["H"],
      close: bittrex_candle["C"],
      low: bittrex_candle["L"],
      volume: bittrex_candle["BV"]
    }
  end

  # Private functions
  @url "https://bittrex.com/api/v1.1/public/getmarkets"
  defp api_get_markets do
    HTTPoison.get!(@url).body
    |> Poison.decode!
    |> get_in(["result"])
  end

  @url "https://bittrex.com/Api/v2.0/pub/market/GetTicks"
  defp api_get_ticks(symbol1, symbol2, interval, from) do
    params = "marketName=#{symbol1}-#{symbol2}&tickInterval=#{map_interval(interval)}&_=#{from}"
    HTTPoison.get!("#{@url}?#{params}").body
    |> Poison.decode!
    |> get_in(["result"])
  end

  def supported_intervals, do: [1, 5, 30, 60, 1440]

  defp map_interval(1), do: "oneMin"
  defp map_interval(5), do: "fiveMin"
  defp map_interval(30), do: "thirtyMin"
  defp map_interval(60), do: "hour"
  defp map_interval(1440), do: "day"
end
