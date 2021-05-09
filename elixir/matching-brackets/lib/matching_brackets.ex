defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """

  @matching_pairs %{
    "[" => "]",
    "{" => "}",
    "(" => ")",
  }

  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    str
    |> String.split("", trim: true)
    |> matching?
  end


  defp matching?(characters, tracker \\ {:ok, []})
  defp matching?(_, {:error, _}), do: false
  defp matching?([], {:ok, unclosed_brackets}), do: length(unclosed_brackets) == 0
  defp matching?([character | rest], {:ok, unclosed_brackets}) do
    cond do
      opening_bracket?(character) ->
        matching?(rest, {:ok, List.insert_at(unclosed_brackets, 0, character)})
      closing_bracket?(character) ->
        {first_bracket, remaining_unclosed_brackets} = List.pop_at(unclosed_brackets, 0)
        if matching_pair?(first_bracket, character) do
          matching?(rest, {:ok, remaining_unclosed_brackets})
        else
          matching?(rest, {:error, remaining_unclosed_brackets})
        end
      true ->
        matching?(rest, {:ok, unclosed_brackets})
    end
  end

  defp matching_pair?(opening_bracket, closing_bracket) do
    Map.get(@matching_pairs, opening_bracket) == closing_bracket
  end

  defp opening_bracket?(character) do
    Enum.member?(Map.keys(@matching_pairs), character)
  end

  defp closing_bracket?(character) do
    Enum.member?(Map.values(@matching_pairs), character)
  end
end
