defmodule CryptoExchanges.<%= scoped %>AdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.<%= scoped %>Adapter

  describe "#coinlist" do
    test "get the list" do
      use_cassette "<%= path %>#coinlist" do
        assert <%= scoped %>Adapter.coinlist() == []
      end
    end
  end
end
