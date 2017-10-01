defmodule CryptoExchanges.GeminiAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.GeminiAdapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "gemini#coinlist" do
        assert GeminiAdapter.coinlist() |> List.first == %CryptoExchanges.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
