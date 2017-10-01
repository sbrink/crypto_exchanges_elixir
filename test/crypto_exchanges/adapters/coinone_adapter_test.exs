defmodule CryptoExchanges.CoinoneAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.CoinoneAdapter

  describe "#get_currencies" do
    test "get the list" do
      assert CoinoneAdapter.get_currencies() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BTC"}
    end
  end
end
