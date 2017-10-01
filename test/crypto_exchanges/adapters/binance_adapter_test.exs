defmodule CryptoExchanges.BinanceAdapterTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias CryptoExchanges.BinanceAdapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "binance#coinlist" do
        assert BinanceAdapter.coinlist() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
