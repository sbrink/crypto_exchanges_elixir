defmodule CryptoExchanges.<%= scoped %>AdapterTest do
  use CryptoExchanges.AdapterCase

  alias CryptoExchanges.<%= scoped %>Adapter

  describe "#get_info" do
    test "returns an info struct" do
      info = <%= scoped %>.get_info()

      assert info.__struct__ == CryptoExchange
      assert info.name
      assert info.homepage_url
      assert info.api_docs_url
      assert info.country
      assert is_list(info.intervals)
    end
  end

  describe "#coinlist" do
    test "get the list" do
      use_cassette "<%= path %>#coinlist" do
        assert <%= scoped %>Adapter.coinlist() == []
      end
    end
  end
end
