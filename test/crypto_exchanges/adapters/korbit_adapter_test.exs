defmodule CryptoExchanges.KorbitAdapterTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias CryptoExchanges.KorbitAdapter

  describe "#coinlist" do
    test "get the list" do
      assert KorbitAdapter.coinlist() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BCH"}
    end
  end
end
