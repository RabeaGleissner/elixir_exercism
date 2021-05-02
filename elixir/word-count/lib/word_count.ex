defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  @tracker %{}

  def count(sentence) do
    sentence
    |> String.split(" ")
    |> Enum.map(fn word -> String.replace(word, ~r/([^\w\-])+/u, "") end)
    |> Enum.reject(fn word -> word == "" end)
    |> Enum.flat_map(fn word -> String.split(word, "_") end)
    |> Enum.map(&String.downcase/1)
    |> update_tracker(%{})
  end

  defp update_tracker([], tracker), do: tracker
  defp update_tracker([word | rest], tracker) do
    current_count = Map.get(tracker, word)
    new_count = if current_count, do: current_count + 1, else: 1
    update_tracker(rest, Map.put(tracker, word, new_count))
  end
end
