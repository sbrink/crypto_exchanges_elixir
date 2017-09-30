defmodule CryptoExchanges.PoloniexAdapterTest do
    use ExUnit.Case
    use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

    alias CryptoExchanges.PoloniexAdapter

    describe "#coinlist" do
        test "get the list" do
            use_cassette "poloniex#getmarkets" do
                assert PoloniexAdapter.coinlist |> List.first == %CryptoExchanges.CryptoCurrency{active: false, symbol: "CNOTE"}
            end
        end
    end
end
