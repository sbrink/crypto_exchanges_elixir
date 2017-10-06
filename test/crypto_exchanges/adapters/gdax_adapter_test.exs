defmodule CryptoExchanges.GdaxAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.GdaxAdapter

  describe "#get_currencies" do
    test "get the list" do
      use_cassette "gdax#get_currencies" do
        assert GdaxAdapter.get_currencies() |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
