defmodule CryptoExchanges.Mixfile do
  use Mix.Project

  def project do
    [
      app: :crypto_exchanges,
      source_url: "https://github.com/sbrink/crypto_exchanges_elixir",
      version: "0.4.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description(),
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

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, ">= 0.0.0", only: [:dev, :test]},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:excoveralls, "~> 0.7", only: :test},
      {:exvcr, "~> 0.9", only: :test},
      {:httpoison, ">= 0.0.0"},
      {:mix_test_watch, "~> 0.3", only: :dev, runtime: false},
      {:poison, ">= 0.0.0"}
    ]
  end

  defp description do
    "A unified api for crypto exchanges."
  end

  defp package do
    [
      maintainers: ["Sascha Brink"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/sbrink/crypto_exchanges_elixir"}
    ]
  end
end
