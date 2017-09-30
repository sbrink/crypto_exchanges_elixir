defmodule CryptoExchanges.PoloniexAdapterTest do
    use ExUnit.Case
    use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

    alias CryptoExchanges.PoloniexAdapter

    describe "#coinlist" do
        test "get the list" do
        use_cassette "poloniex#getmarkets" do
            assert PoloniexAdapter.coinlist == %CryptoExchanges.CryptoCurrency{active: true, symbol: "LTC"}
        end
        end
    end
end