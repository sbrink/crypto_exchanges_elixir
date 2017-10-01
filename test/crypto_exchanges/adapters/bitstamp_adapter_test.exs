defmodule CryptoExchanges.BitstampAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.BitstampAdapter

  describe "#get_currencies" do
    test "get the list" do
      use_cassette "bitstamp#get_currencies" do
        assert BitstampAdapter.get_currencies() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
