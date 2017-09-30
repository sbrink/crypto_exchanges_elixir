defmodule CryptoExchanges.KrakenAdapterTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias CryptoExchanges.KrakenAdapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "kraken#getmarkets" do
        assert KrakenAdapter.coinlist |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BCH"}
      end
    end
  end
end
