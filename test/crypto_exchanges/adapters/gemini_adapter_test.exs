defmodule CryptoExchanges.GeminiAdapterTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias CryptoExchanges.GeminiAdapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "gemini#coinlist" do
        assert GeminiAdapter.coinlist() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
