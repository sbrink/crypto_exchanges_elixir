defmodule CryptoExchanges.AdapterCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up an adapter.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
      import CryptoExchanges.AdapterCase

      alias CryptoExchanges.Schema.CryptoExchange
      alias CryptoExchanges.Schema.CryptoCurrency
    end
  end

  def assert_exchange_info(info) do
    assert info.__struct__ == CryptoExchanges.Schema.CryptoExchange
    assert info.name
    assert info.homepage_url
    assert info.api_docs_url
    assert info.country
    assert is_list(info.intervals)
  end
end
