defmodule SpaceAge do
  @type planet ::
  :mercury
  | :venus
  | :earth
  | :mars
  | :jupiter
  | :saturn
  | :uranus
  | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  @orbital_periods %{
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }

  def age_on(planet, seconds) do
    calculate_age(planet, seconds)
  end

  defp calculate_age(:earth, seconds), do: seconds / 31557600
  defp calculate_age(planet, seconds) do
    calculate_age(:earth, seconds)
    |> age_for_planet(planet)
  end

  defp age_for_planet(earth_years, planet) do
    earth_years / Map.get(@orbital_periods, planet)
  end
end
