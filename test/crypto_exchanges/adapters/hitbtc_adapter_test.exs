defmodule CryptoExchanges.HitbtcAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.HitbtcAdapter

  describe "#get_currencies" do
    test "get the list" do
      use_cassette "hitbtc#get_currencies" do
        assert HitbtcAdapter.get_currencies |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BCN"}
      end
    end
  end
end
