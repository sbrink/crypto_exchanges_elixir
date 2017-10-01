defmodule CryptoExchanges.HitbtcAdapterTest do
  use CryptoExchanges.AdapterCase

    alias CryptoExchanges.HitbtcAdapter

    describe "#coinlist" do
        test "get the list" do
            use_cassette "hitbtc#coinlist" do
                assert HitbtcAdapter.coinlist |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BCN"}
            end
        end
    end
end
