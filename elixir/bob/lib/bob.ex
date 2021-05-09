defmodule Bob do
  def hey(input) do
    trimmed_input = String.trim(input)
    cond do
      silent?(trimmed_input) -> "Fine. Be that way!"
      shouting_question?(trimmed_input) -> "Calm down, I know what I'm doing!"
      general_shouting?(trimmed_input) -> "Whoa, chill out!"
      exclamation?(trimmed_input) -> "Whatever."
      question?(trimmed_input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp silent?(input), do: input == ""
  defp shouting_question?(input), do: general_shouting?(input) and question?(input)
  defp general_shouting?(input) do
    input == String.upcase(input) and String.upcase(input) != String.downcase(input)
  end
  defp exclamation?(input), do: String.ends_with?(input, "!")
  defp question?(input), do: String.ends_with?(input, "?")
  defp no_letters?(input), do: String.upcase(input) == String.downcase(input)
end
