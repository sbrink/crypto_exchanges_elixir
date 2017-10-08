defmodule CryptoExchanges.GdaxAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.GdaxAdapter

  describe "#get_info" do
    test "returns an info struct" do
      info = GdaxAdapter.get_info()

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
      use_cassette "gdax#get_currencies" do
        assert GdaxAdapter.get_currencies() |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
