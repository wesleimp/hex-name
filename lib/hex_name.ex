defmodule HexName do
  @moduledoc false

  @doc """
  Search by package name and return if the name is available
  """
  def search(package) do
    HTTPoison.get("https://hex.pm/api/packages/#{package}")
    |> parse_response()
  end

  defp parse_response({:ok, %{status_code: 200}}), do: :unavailable
  defp parse_response({:ok, %{status_code: 404}}), do: :available
  defp parse_response(_), do: :unknown
end
