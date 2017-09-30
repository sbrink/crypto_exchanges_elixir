defmodule CryptoExchanges.BittrexAdapter do
  @behaviour CryptoExchanges.Adapter

  alias CryptoExchanges.CryptoCurrency

  def coinlist do
    get_markets_from_bittrex_api()
    |> get_in(["result"])
    |> Enum.map(fn(bittrex_currency) ->
      %CryptoCurrency{
        active: true,
        symbol: bittrex_currency["MarketCurrency"]
      }
    end)
    |> Enum.uniq_by(fn(crypto_currency) -> crypto_currency.symbol end)
  end

  @url "https://bittrex.com/api/v1.1/public/getmarkets"
  def get_markets_from_bittrex_api do
    HTTPoison.get!(@url).body
    |> Poison.decode!
  end
end
