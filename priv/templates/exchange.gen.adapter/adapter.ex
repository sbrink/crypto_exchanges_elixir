defmodule CryptoExchanges.<%= scoped %>Adapter do
  @moduledoc """
  An Adapter for <%= scoped %>

  Homepage: https://example.com/ TODO
  API Docs: https://example.com/api TODO

  Country: TODO
  """
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.CryptoCurrency

  def coinlist do
    api_coinlist()
  end

  # Private functions
  @url "https://example.com/api" # TODO
  defp api_coinlist do
    HTTPoison.get!(@url).body
    |> Poison.decode!
  end
end
