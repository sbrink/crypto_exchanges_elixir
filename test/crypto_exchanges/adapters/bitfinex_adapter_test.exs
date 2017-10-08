defmodule CryptoExchanges.BitfinexAdapterTest do
  use CryptoExchanges.AdapterCase
  @adapter CryptoExchanges.BitfinexAdapter

  describe "#get_info" do
    test "returns an info struct" do
      assert_exchange_info @adapter.get_info()
    end
  end

  describe "#get_currencies" do
    test "get the list" do
      use_cassette "bitfinex#get_currencies" do
        currencies = @adapter.get_currencies()

        assert is_list(currencies)
        assert List.first(currencies) == %CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
