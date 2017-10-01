defmodule CryptoExchanges.PoloniexAdapterTest do
  use CryptoExchanges.AdapterCase

    alias CryptoExchanges.PoloniexAdapter

    describe "#get_currencies" do
        test "get the list" do
            use_cassette "poloniex#get_currencies" do
                assert PoloniexAdapter.get_currencies |> List.first == %CryptoExchanges.CryptoCurrency{active: false, symbol: "CNOTE"}
            end
        end
    end
end
