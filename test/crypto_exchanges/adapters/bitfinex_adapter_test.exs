defmodule CryptoExchanges.BitfinexAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.BitfinexAdapter

  describe "#get_currencies" do
    test "get the list" do
      use_cassette "bitfinex#get_currencies" do
        assert BitfinexAdapter.get_currencies |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
