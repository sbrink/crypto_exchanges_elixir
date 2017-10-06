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
end
