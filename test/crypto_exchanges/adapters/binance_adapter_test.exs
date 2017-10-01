defmodule CryptoExchanges.BinanceAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.BinanceAdapter

  describe "#coinlist" do
    test "get the list" do
      assert BinanceAdapter.coinlist() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BTC"}
    end
  end
end
