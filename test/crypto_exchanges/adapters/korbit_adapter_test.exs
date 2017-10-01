defmodule CryptoExchanges.KorbitAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.KorbitAdapter

  describe "#get_currencies" do
    test "get the list" do
      assert KorbitAdapter.get_currencies() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BCH"}
    end
  end
end
