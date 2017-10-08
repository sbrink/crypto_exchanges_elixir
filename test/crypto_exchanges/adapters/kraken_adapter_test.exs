defmodule CryptoExchanges.KrakenAdapterTest do
  use CryptoExchanges.AdapterCase

  @adapter CryptoExchanges.KrakenAdapter

  describe "#get_info" do
    test "returns an info struct" do
      assert_exchange_info @adapter.get_info()
    end
  end

  describe "#get_currencies" do
    test "get the list" do
      use_cassette "kraken#get_currencies" do
        assert @adapter.get_currencies |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: true, symbol: "BCH"}
      end
    end
  end
end
