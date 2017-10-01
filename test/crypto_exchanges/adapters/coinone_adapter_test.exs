defmodule CryptoExchanges.CoinoneAdapterTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias CryptoExchanges.CoinoneAdapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "coinone#coinlist" do
        assert CoinoneAdapter.coinlist() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
