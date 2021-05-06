defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """

  @arabic_with_roman %{
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I",
  }


  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    convert(number)
  end

  defp convert(number, converted \\"", keys \\ Map.keys(@arabic_with_roman) |> Enum.sort(&(&1 > &2)))
  defp convert(0, converted, _), do: converted
  defp convert(number, converted, ([highest | rest]) = keys) do
    if number >= highest do
      convert(number - highest, converted <> @arabic_with_roman[highest], keys)
    else
      convert(number, converted, rest)
    end
  end
end
