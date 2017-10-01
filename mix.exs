defmodule CryptoExchanges.Mixfile do
  use Mix.Project

  def project do
    [
      app: :crypto_exchanges,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        "coveralls": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
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
      {:credo, ">= 0.0.0", only: [:dev, :test]},
      {:excoveralls, "~> 0.7", only: :test},
      {:exvcr, "~> 0.9", only: :test},
      {:httpoison, ">= 0.0.0"},
      {:mix_test_watch, "~> 0.3", only: :dev, runtime: false},
      {:poison, ">= 0.0.0"}
    ]
  end

  defp package do
    [
      maintainers: ["Sascha Brink"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/sbrink/crypto_exchanges_elixir"}
    ]
  end
end
