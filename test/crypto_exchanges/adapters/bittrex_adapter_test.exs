defmodule CryptoExchanges.BittrexAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.BittrexAdapter

  describe "#get_currencies" do
    test "get the list" do
      use_cassette "bittrex#get_currencies" do
        assert BittrexAdapter.get_currencies |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "LTC"}
      end
    end
  end
end
