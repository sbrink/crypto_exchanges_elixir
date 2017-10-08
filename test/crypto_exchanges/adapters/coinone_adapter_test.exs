defmodule CryptoExchanges.CoinoneAdapterTest do
  use CryptoExchanges.AdapterCase

  @adapter CryptoExchanges.CoinoneAdapter

  describe "#get_info" do
    test "returns an info struct" do
      assert_exchange_info @adapter.get_info()
    end
  end

  describe "#get_currencies" do
    test "get the list" do
      assert @adapter.get_currencies() |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: true, symbol: "BTC"}
    end
  end
end
