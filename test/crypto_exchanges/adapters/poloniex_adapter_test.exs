defmodule CryptoExchanges.PoloniexAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.PoloniexAdapter

  describe "#get_info" do
    test "returns an info struct" do
      info = PoloniexAdapter.get_info()

      assert info.__struct__ == CryptoExchange
      assert info.name
      assert info.homepage_url
      assert info.api_docs_url
      assert info.country
      assert is_list(info.intervals)
    end
  end

  describe "#get_currencies" do
    test "get the list" do
      use_cassette "poloniex#get_currencies" do
        assert PoloniexAdapter.get_currencies |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: false, symbol: "CNOTE"}
      end
    end
  end
end
