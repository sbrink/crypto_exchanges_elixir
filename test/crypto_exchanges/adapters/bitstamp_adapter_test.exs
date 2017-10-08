defmodule CryptoExchanges.BitstampAdapterTest do
  use CryptoExchanges.AdapterCase
  @adapter CryptoExchanges.BitstampAdapter

  describe "#get_info" do
    test "returns an info struct" do
      assert_exchange_info @adapter.get_info()
    end
  end

  describe "#get_currencies" do
    test "get the list" do
      currencies = @adapter.get_currencies()

      assert is_list(currencies)
      assert List.first(currencies) == %CryptoCurrency{active: true, symbol: "BTC"}
    end
  end
end
