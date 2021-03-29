defmodule HexName.MixProject do
  use Mix.Project

  def project do
    [
      app: :hex_name,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  defp escript do
    [
      main_module: HexName.CLI,
      name: "hex-name"
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"}
    ]
  end
end
