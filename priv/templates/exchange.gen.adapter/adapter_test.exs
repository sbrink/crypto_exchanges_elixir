defmodule CryptoExchanges.<%= scoped %>AdapterTest do
  use ExUnit.Case
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias CryptoExchanges.<%= scoped %>Adapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "<%= path %>#coinlist" do
        assert <%= scoped %>Adapter.coinlist() == []
      end
    end
  end
end
