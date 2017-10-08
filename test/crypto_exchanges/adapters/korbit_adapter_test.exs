defmodule CryptoExchanges.KorbitAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.KorbitAdapter

  describe "#get_info" do
    test "returns an info struct" do
      info = KorbitAdapter.get_info()

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
      assert KorbitAdapter.get_currencies() |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: true, symbol: "BCH"}
    end
  end
end
