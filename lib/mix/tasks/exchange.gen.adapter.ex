defmodule Mix.Tasks.Exchange.Gen.Adapter do
  @moduledoc """
  Generates an exchange adapter.

      mix exchange.gen.adapter MyExchange

  Accepts the exchange name for the adapter

  The generated files will contain:

    * an adapter in lib/crypto_exchanges/adapters
    * an adapter_test in test/crypto_exchanges/adapters
  """
  use Mix.Task

  @doc false
  def run(args) do
    [exchange_name] = validate_args!(args)

    binding = [
      path: Macro.underscore(exchange_name)
    ]

    copy_templates "priv/templates/exchange.gen.adapter", binding, [
      {"adapter.ex",       "lib/crypto_exchanges/adapters/#{binding[:path]}_adapter.ex"},
      {"adapter_test.exs", "test/crypto_exchanges/adapters/#{binding[:path]}_adapter_test.exs"},
    ]

    Mix.shell.info """
      Adapter generated
    """
  end

  @spec raise_with_help() :: no_return()
  defp raise_with_help do
    Mix.raise """
    mix exchange.gen.adapter expects an exchange name:

        mix exchange.gen.adapter MyExchange
    """
  end

  defp validate_args!(args) do
    unless length(args) == 1 do
      raise_with_help()
    end
    args
  end

  defp copy_templates(root, binding, mappings) when is_list(mappings) do
    for {source_file_path, target} <- mappings do
      source = Path.join(root, source_file_path)
      Mix.Generator.create_file(target, EEx.eval_file(source, binding))
    end
  end
end
