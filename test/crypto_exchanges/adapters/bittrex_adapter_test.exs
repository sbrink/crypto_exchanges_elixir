defmodule CryptoExchanges.BittrexAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.BittrexAdapter

  describe "#get_currencies" do
    test "get the list" do
      use_cassette "bittrex#get_currencies" do
        assert BittrexAdapter.get_currencies |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: true, symbol: "LTC"}
      end
    end
  end

  describe "#get_markets" do
    test "get the list" do
      use_cassette "bittrex#get_markets" do
        assert BittrexAdapter.get_markets |> List.first == %CryptoExchanges.Schema.CryptoMarket{active: true, symbol: "LTC", base_symbol: "BTC", name: "BTC-LTC"}
      end
    end
  end

  describe "#get_candles" do
    test "get the list" do
      use_cassette "bittrex#get_candles" do
        {:ok, datetime, 0} = DateTime.from_iso8601("2017-08-28 14:30:00Z")
        # datetime = "blub"

        assert BittrexAdapter.get_candles("BTC", "ETH", 30, 1507378575615) |> List.first ==
          %CryptoExchanges.Schema.CryptoCandle{close: 0.07996,
             high: 0.08019086, low: 0.07950001, open: 0.07959001,
             time: datetime, volume: 144.62875528}
      end
    end
  end
end
