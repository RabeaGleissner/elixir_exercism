defmodule FreelancerRates do
  @monthly_billable_days 22

  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - (before_discount * discount / 100)
  end

  def monthly_rate(hourly_rate, discount) do
    daily_rate(hourly_rate) * @monthly_billable_days
    |> apply_discount(discount)
    |> ceil
    |> trunc
  end

  def days_in_budget(budget, hourly_rate, discount) do
    discounted_rate = daily_rate(hourly_rate)
                      |> apply_discount(discount)

    budget / discounted_rate
    |> Float.floor(1)
  end
end
