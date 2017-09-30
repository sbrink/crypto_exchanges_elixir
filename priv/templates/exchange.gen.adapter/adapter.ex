defmodule CryptoExchanges.<%= scoped %>Adapter do
  @moduledoc """
  An Adapter for <%= scoped %>

  Homepage: https://example.com/
  API Docs: https://example.com/api

  Country: Unknown
  """
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.CryptoCurrency

  def coinlist do
    api_coinlist()
  end

  # Private functions
  @url "https://example.com/api"
  defp api_coinlist do
    HTTPoison.get!(@url).body
    |> Poison.decode!
  end
end
