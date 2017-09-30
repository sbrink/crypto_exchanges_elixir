defmodule CryptoExchanges.Mixfile do
  use Mix.Project

  def project do
    [
      app: :crypto_exchanges,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      preferred_cli_env: [
        "vcr": :test,
        "vcr.delete": :test,
        "vcr.check": :test,
        "vcr.show": :test
      ],
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:exvcr, "~> 0.9", only: :test},
      {:httpoison, ">= 0.0.0"},
      {:poison, ">= 0.0.0"}
    ]
  end
end
