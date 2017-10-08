defmodule CryptoExchanges.<%= scoped %>AdapterTest do
  use CryptoExchanges.AdapterCase
  @adapter CryptoExchanges.<%= scoped %>Adapter

  describe "#get_info" do
    test "returns an info struct" do
      assert_exchange_info @adapter.get_info()
    end
  end

  describe "#coinlist" do
    test "get the list" do
      use_cassette "<%= path %>#coinlist" do
        assert @adapter.coinlist() == []
      end
    end
  end
end
