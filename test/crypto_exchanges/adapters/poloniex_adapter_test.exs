defmodule CryptoExchanges.PoloniexAdapterTest do
  use CryptoExchanges.AdapterCase

    alias CryptoExchanges.PoloniexAdapter

    describe "#coinlist" do
        test "get the list" do
            use_cassette "poloniex#coinlist" do
                assert PoloniexAdapter.coinlist |> List.first == %CryptoExchanges.CryptoCurrency{active: false, symbol: "CNOTE"}
            end
        end
    end
end
