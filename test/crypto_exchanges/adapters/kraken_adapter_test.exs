defmodule CryptoExchanges.KrakenAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.KrakenAdapter

  describe "#get_currencies" do
    test "get the list" do
      use_cassette "kraken#get_currencies" do
        assert KrakenAdapter.get_currencies |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: true, symbol: "BCH"}
      end
    end
  end
end
