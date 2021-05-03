defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    build_list(list, fun, [], &keep_action/2)
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    build_list(list, fun, list, &discard_action/2)
  end


  defp build_list([], _, results_list, _), do: results_list
  defp build_list([head | rest], fun, results_list, action) do
    updated_results_list = if fun.(head), do: action.(results_list, head), else: results_list
    build_list(rest, fun, updated_results_list, action)
  end

  defp keep_action(results_list, head), do: results_list ++ [head]
  defp discard_action(results_list, head), do: results_list -- [head]
end
