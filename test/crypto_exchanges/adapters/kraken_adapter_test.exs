defmodule CryptoExchanges.KrakenAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.KrakenAdapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "kraken#coinlist" do
        assert KrakenAdapter.coinlist |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BCH"}
      end
    end
  end
end
