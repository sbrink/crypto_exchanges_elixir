defmodule CryptoExchanges.BterAdapterTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias CryptoExchanges.BterAdapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "bter#coinlist" do
        assert BterAdapter.coinlist() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "ETH"}
      end
    end
  end
end