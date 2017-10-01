defmodule CryptoExchanges.CoinoneAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.CoinoneAdapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "coinone#coinlist" do
        assert CoinoneAdapter.coinlist() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
