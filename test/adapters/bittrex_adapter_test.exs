defmodule CryptoExchanges.BittrexAdapterTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias CryptoExchanges.BittrexAdapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "bittrex#getmarkets" do
        assert BittrexAdapter.coinlist |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "LTC"}
      end
    end
  end
end
