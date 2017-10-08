defmodule CryptoExchanges.HitbtcAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.HitbtcAdapter

  describe "#get_info" do
    test "returns an info struct" do
      info = HitbtcAdapter.get_info()

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
      use_cassette "hitbtc#get_currencies" do
        assert HitbtcAdapter.get_currencies |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: true, symbol: "BCN"}
      end
    end
  end
end
