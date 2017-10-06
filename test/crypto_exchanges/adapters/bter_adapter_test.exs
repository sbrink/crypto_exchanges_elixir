defmodule CryptoExchanges.BterAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.BterAdapter

  describe "#get_currencies" do
    test "get the list" do
      use_cassette "bter#get_currencies" do
        assert BterAdapter.get_currencies() |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: true, symbol: "ETH"}
      end
    end
  end
end
