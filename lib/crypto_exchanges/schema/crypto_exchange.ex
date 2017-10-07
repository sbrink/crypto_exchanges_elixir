defmodule CryptoExchanges.Schema.CryptoExchange do
  @moduledoc """
  Stores information about an exchange
  """
  @enforce_keys [:name, :homepage_url, :api_docs_url, :country, :intervals]
  defstruct [:name, :homepage_url, :api_docs_url, :country, :intervals]
end
