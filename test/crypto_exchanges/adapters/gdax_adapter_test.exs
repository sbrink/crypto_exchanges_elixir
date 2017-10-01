defmodule CryptoExchanges.GdaxAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.GdaxAdapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "gdax#coinlist" do
        assert GdaxAdapter.coinlist() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
