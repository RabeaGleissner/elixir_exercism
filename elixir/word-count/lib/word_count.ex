defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  @tracker %{}

  def count(sentence) do
    sentence
    |> String.downcase
    |> String.replace(~r/,|!|&|@|\$|%|\^|:/i, "")
    |> String.split(" ", trim: true)
    |> Enum.flat_map(fn word -> String.split(word, "_") end)
    |> update_tracker
  end

  defp update_tracker(sentence, tracker \\ %{})
  defp update_tracker([], tracker), do: tracker
  defp update_tracker([word | rest], tracker) do
    update_tracker(rest, Map.update(tracker, word, 1, &(&1 + 1)))
  end
end
