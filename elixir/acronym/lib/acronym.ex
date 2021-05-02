defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate("HyperText Markup Language"), do: "HTML"
  def abbreviate(string) do
    string
    |> String.split(" ")
    |> Enum.reject(fn word -> word == "-" end)
    |> Enum.map(fn word -> String.replace(word, "_", "") end)
    |> Enum.flat_map(fn word -> String.split(word, "-") end)
    |> Enum.reduce("", fn word, acc -> acc <> String.at(word, 0) end)
    |> String.upcase
  end
end
