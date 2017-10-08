defmodule CryptoExchanges.KrakenAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.KrakenAdapter

  describe "#get_info" do
    test "returns an info struct" do
      info = KrakenAdapter.get_info()

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
      use_cassette "kraken#get_currencies" do
        assert KrakenAdapter.get_currencies |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: true, symbol: "BCH"}
      end
    end
  end
end
