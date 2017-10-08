defmodule CryptoExchanges.PoloniexAdapterTest do
  use CryptoExchanges.AdapterCase

  @adapter CryptoExchanges.PoloniexAdapter

  describe "#get_info" do
    test "returns an info struct" do
      assert_exchange_info @adapter.get_info()
    end
  end

  describe "#get_currencies" do
    test "get the list" do
      use_cassette "poloniex#get_currencies" do
        assert @adapter.get_currencies |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: false, symbol: "CNOTE"}
      end
    end
  end
end
