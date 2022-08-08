defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 -> if legacy?, do: :unknown, else: :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 -> if legacy?, do: :unknown, else: :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    cond do
      level == 6 and not legacy? -> :dev2
      level == 4 -> :ops
      level == 5 and not legacy? -> :ops
      legacy? and level in [6, 0, 5] -> :dev1
      true -> false
    end

  end
end
