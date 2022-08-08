defmodule Lasagna do
  def expected_minutes_in_oven(), do: 40
  def remaining_minutes_in_oven(minutes_cooked), do: expected_minutes_in_oven - minutes_cooked
  def preparation_time_in_minutes(layers), do: 2 * layers
  def total_time_in_minutes(layers, general_prep_time), do: preparation_time_in_minutes(layers) + general_prep_time
  def alarm, do: "Ding!"
end
