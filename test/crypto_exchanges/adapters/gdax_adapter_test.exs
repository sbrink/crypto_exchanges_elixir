defmodule CryptoExchanges.GdaxAdapterTest do
  use CryptoExchanges.AdapterCase

  @adapter CryptoExchanges.GdaxAdapter

  describe "#get_info" do
    test "returns an info struct" do
      assert_exchange_info @adapter.get_info()
    end
  end

  describe "#get_currencies" do
    test "get the list" do
      use_cassette "gdax#get_currencies" do
        assert @adapter.get_currencies() |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
