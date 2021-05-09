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
    |> track_occurences
    |> encode_string
  end

  defp encode_string(map) do
    Enum.reduce(map, "", fn ({letter, occurance}, acc) ->
      if occurance > 1, do: acc <> to_string(occurance) <> letter, else: acc <> letter
    end)
  end

  # Maybe use list of tuples instead of map??
  #tracker = [
    #{"W", 12},
    #{"B", 1},
    #{"W", 15},
    #{"X", 3},
  #]

  defp track_occurences(split_string, tracker \\ [])
  defp track_occurences([], tracker), do: tracker
  defp track_occurences([letter | [second_letter | rest]], tracker) do
    if letter == second_letter do
    end
    track_occurences(rest, Map.update(map, letter, 1, &(&1 + 1)))
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
  end
end
