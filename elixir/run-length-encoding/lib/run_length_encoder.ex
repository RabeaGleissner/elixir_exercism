defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.split("", trim: true)
    |> add_to_map
    |> encode_string
  end

  defp encode_string(map) do
    Enum.reduce(map, "", fn ({letter, occurance}, acc) ->
      if occurance > 1, do: acc <> to_string(occurance) <> letter, else: acc <> letter
    end)
  end

  defp add_to_map(split_string, map \\ %{})
  defp add_to_map([], map), do: map
  defp add_to_map([letter | rest], map) do
    add_to_map(rest, Map.update(map, letter, 1, &(&1 + 1)))
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
  end
end
