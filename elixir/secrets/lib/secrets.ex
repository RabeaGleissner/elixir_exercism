defmodule Secrets do
  def secret_add(secret) do
    &(secret + &1)
  end

  def secret_subtract(secret) do
    &(&1 - secret)
  end

  def secret_multiply(secret) do
    &(secret * &1)
  end

  def secret_divide(secret) do
    &(&1 / secret)
    |> trunc
  end

  def secret_and(secret) do
    fn number -> Bitwise.&&&(number, secret) end
  end

  def secret_xor(secret) do
    fn number -> Bitwise.^^^(number, secret) end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn x ->
      secret_function2.(secret_function1.(x))
    end
    # Different ways of writing this:
    #
    # fn x ->
      # x
      # |> secret_function1.()
      # |> secret_function2.()
    # end
    # &secret_function2.(secret_function1.(&1))
  end
end
