defmodule Add do
  @base 2

  @doc """
  Adds 2 binary numbers

  ## Example

      iex> Add.sum(123, 11)
      ** (RuntimeError) Bad format

      iex> Add.sum(01, 10)
      11

      iex> Add.sum(11, 10)
      101
  """
  def sum(num1, num2) do
    num =
      zip(num_to_list(num1), num_to_list(num2))
      |> Enum.reduce({[], 0}, fn
        {d1, d2}, {result, carry} ->
          sum = d1 + d2 + carry

          {
            [Integer.mod(sum, @base) | result],
            Integer.floor_div(sum, @base)
          }
      end)
      |> case do
        {res, 0} -> res
        {res, x} -> [x | res]
      end

    [start | num] = num
    Enum.reduce(num, start, fn digit, acc -> digit + 10 * acc end)
  end

  defp num_to_list(num) do
    num
    |> Integer.to_charlist()
    |> Enum.reverse()
    |> Enum.map(fn
      x when x in 48..(47 + @base) -> x - 48
      _ -> raise "Bad format"
    end)
  end

  defp zip([x1 | l1], [x2 | l2]), do: [{x1, x2} | zip(l1, l2)]
  defp zip([x1 | l1], []), do: [{x1, 0} | zip(l1, [])]
  defp zip([], [x2 | l2]), do: [{0, x2} | zip([], l2)]
  defp zip([], []), do: []
end
