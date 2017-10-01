# crypto_exchanges elixir

[![license](https://img.shields.io/github/license/mashape/apistatus.svg)](https://github.com/sbrink/crypto_exchanges_elixir/blob/master/LICENSE)
[![Build Status](https://travis-ci.org/sbrink/crypto_exchanges_elixir.svg?branch=master)](https://travis-ci.org/sbrink/crypto_exchanges_elixir)
[![Coverage Status](https://coveralls.io/repos/github/sbrink/crypto_exchanges_elixir/badge.svg?branch=master)](https://coveralls.io/github/sbrink/crypto_exchanges_elixir?branch=master)

## Creating a new adapter

```bash
mix exchange.gen.adapter MyExchange
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `crypto_exchanges` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:crypto_exchanges, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/crypto_exchanges](https://hexdocs.pm/crypto_exchanges).

## License

MIT © Sascha Brink
