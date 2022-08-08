defmodule PhoneNumber do
  @doc """
  Remove formatting from a phone number if the given number is valid. Return an error otherwise.
  """
  @spec clean(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def clean(raw) do
    nanp = to_nanp(raw)
    length = String.length(nanp)
    cond do
      String.match?(nanp, ~r/^1/)         -> {:error, "area code cannot start with one"}
      String.match?(nanp, ~r/^0/)         -> {:error, "area code cannot start with zero"}
      String.match?(nanp, ~r/^\d{3}1/)    -> {:error, "exchange code cannot start with one"}
      String.match?(nanp, ~r/^\d{3}0/)    -> {:error, "exchange code cannot start with zero"}
      not String.match?(nanp, ~r/^\d+$/)  -> {:error, "must contain digits only"}
      length == 11                        -> {:error, "11 digits must start with 1"}
      length != 10                        -> {:error, "incorrect number of digits"}
      true                                -> {:ok, "#{nanp}"}
    end
  end

  defp to_nanp(raw) do
    raw
    |> String.replace_prefix("+", "")
    |> String.replace(~r/[\\ ()-.]|^1/, "")
  end
end
