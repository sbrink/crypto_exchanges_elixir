defmodule CryptoExchanges.BinanceAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.BinanceAdapter

  describe "#get_info" do
    test "returns an info struct" do
      info = BinanceAdapter.get_info()

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
      assert BinanceAdapter.get_currencies() |> List.first == %CryptoCurrency{active: true, symbol: "BTC"}
      assert BinanceAdapter.get_currencies() |> List.first == %CryptoCurrency{active: true, symbol: "BTC"}
    end
  end
end
