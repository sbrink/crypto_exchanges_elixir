defmodule CryptoExchanges.Adapter do
  @moduledoc """
  Behaviour for creating Crypto Exchange Adapters
  """
  @callback get_info() :: any

  @callback get_currencies() :: any

  # @callback get_markets() :: any

  defmacro __using__(_) do
    quote do
      @behaviour CryptoExchanges.Adapter

      alias CryptoExchanges.Schema.CryptoCurrency
      alias CryptoExchanges.Schema.CryptoMarket
      alias CryptoExchanges.Schema.CryptoCandle
      alias CryptoExchanges.Schema.CryptoExchange
    end
  end
end
