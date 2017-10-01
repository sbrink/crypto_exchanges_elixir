defmodule CryptoExchanges.KorbitAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.KorbitAdapter

  describe "#coinlist" do
    test "get the list" do
      assert KorbitAdapter.coinlist() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BCH"}
    end
  end
end
