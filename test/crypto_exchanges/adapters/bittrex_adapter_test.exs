defmodule CryptoExchanges.BittrexAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.BittrexAdapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "bittrex#coinlist" do
        assert BittrexAdapter.coinlist |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "LTC"}
      end
    end
  end
end
