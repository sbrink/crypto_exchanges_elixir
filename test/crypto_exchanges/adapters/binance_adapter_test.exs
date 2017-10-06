defmodule CryptoExchanges.BinanceAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.BinanceAdapter

  describe "#get_currencies" do
    test "get the list" do
      assert BinanceAdapter.get_currencies() |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: true, symbol: "BTC"}
    end
  end
end
