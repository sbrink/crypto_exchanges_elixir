defmodule CryptoExchanges.BittrexAdapter do
  @moduledoc """
  An Adapter for the Bittrex Exchange

  Homepage: https://bittrex.com/
  API Docs: https://bittrex.com/home/api

  Country: USA
  """
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.Schema.CryptoCurrency
  alias CryptoExchanges.Schema.CryptoMarket
  alias CryptoExchanges.Schema.CryptoCandle

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
  defp api_get_ticks(symbol1, symbol2, _interval, from) do
    params = "marketName=#{symbol1}-#{symbol2}&tickInterval=thirtyMin&_=#{from}"
    HTTPoison.get!("#{@url}?#{params}").body
    |> Poison.decode!
    |> get_in(["result"])
  end
end
