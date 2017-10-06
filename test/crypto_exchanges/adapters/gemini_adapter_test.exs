defmodule CryptoExchanges.GeminiAdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.GeminiAdapter

  describe "#get_currencies" do
    test "get the list" do
      use_cassette "gemini#get_currencies" do
        assert GeminiAdapter.get_currencies() |> List.first == %CryptoExchanges.Schema.CryptoCurrency{active: true, symbol: "BTC"}
      end
    end
  end
end
