defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, &anagram?(base, &1))
    # Leaving this commented to remind myself how function capturing works
    # Enum.filter(candidates, fn candidate -> anagram?(base, candidate) end)
  end

  defp anagram?(base, candidate) do
    if String.downcase(base) === String.downcase(candidate), do: false,
      else: to_list(base) == to_list(candidate)
  end

  defp to_list(word), do: word |> String.downcase |> String.graphemes |> Enum.sort
end
