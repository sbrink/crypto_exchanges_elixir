defmodule CryptoExchanges.AdapterCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up an adapter.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney
    end
  end
end
