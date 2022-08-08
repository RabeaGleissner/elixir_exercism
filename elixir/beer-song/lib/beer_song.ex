defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(0) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end

  def verse(number) do
    """
    #{number} #{format_bottle(number)} of beer on the wall, #{number} #{format_bottle(number)} of beer.
    #{second_line(number - 1)}
    """
  end

  defp second_line(0), do: "Take it down and pass it around, no more bottles of beer on the wall."
  defp second_line(number) do
    "Take one down and pass it around, #{number} #{format_bottle(number)} of beer on the wall."
  end

  defp format_bottle(amount) do
    amount
    |> case do
      1 -> "bottle"
      _ -> "bottles"
    end

  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0)
  def lyrics(range) do
    range
    |> Enum.map(&verse/1)
    |> Enum.join("\n")
  end
end
