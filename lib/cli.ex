defmodule HexName.CLI do
  @moduledoc false

  @strict [help: :boolean, version: :boolean]
  @aliases [h: :help, v: :version]
  @version "0.1.0"

  def main(args) do
    case OptionParser.parse(args, strict: @strict, aliases: @aliases) do
      {_, [package], _} ->
        HexName.search(package)
        |> print()

      {[version: true], _, _} ->
        print(:version)

      {[help: true], _, _} ->
        print(:help)

      {_, _, _} ->
        print(:help)
    end
  end

  defp print(:available), do: print(:available, :green)
  defp print(:unavailable), do: print(:unavailable, :light_red)
  defp print(:unknown), do: print(:unknown)
  defp print(:version), do: IO.puts("hex-name v#{@version}")

  defp print(:help) do
    IO.puts("""

    Usage: hex-name <PACKAGE>

    Check whether a hex name is available on hex.pm

    Options:
      -h --help       Print help
      -v, --version   Print version

    """)
  end

  defp print(status, color \\ :default) do
    status
    |> Atom.to_string()
    |> String.capitalize()
    |> colorize(color)
    |> IO.puts()
  end

  defp colorize(text, color) do
    IO.ANSI.format([color, text, :reset], true)
  end
end
