defmodule CryptoExchanges.GdaxAdapterTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias CryptoExchanges.GdaxAdapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "gdax#coinlist" do
        assert GdaxAdapter.coinlist() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
