defmodule CryptoExchanges.BitfinexAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.BitfinexAdapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "bitfinex#coinlist" do
        assert BitfinexAdapter.coinlist |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
