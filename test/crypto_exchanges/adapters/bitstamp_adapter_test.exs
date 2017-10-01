defmodule CryptoExchanges.BitstampAdapterTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias CryptoExchanges.BitstampAdapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "bitstamp#coinlist" do
        assert BitstampAdapter.coinlist() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
