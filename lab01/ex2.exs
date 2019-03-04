defmodule Ex2 do
  def sum(num1, num2) do
    num =
      zip(num_to_list(num1), num_to_list(num2))
      |> Enum.reduce({[], 0}, fn
        {d1, d2}, {result, carry} ->
          case d1 + d2 + carry do
            0 -> {[0 | result], 0}
            1 -> {[1 | result], 0}
            2 -> {[0 | result], 1}
            3 -> {[1 | result], 1}
          end
      end)
      |> case do
        {res, 0} -> res
        {res, 1} -> [1 | res]
      end

    [start | num] = num
    Enum.reduce(num, start, fn digit, acc -> digit + 10 * acc end)
  end

  defp num_to_list(num) do
    num
    |> Integer.to_charlist()
    |> Enum.reverse()
    |> Enum.map(fn
      48 -> 0
      49 -> 1
      _ -> raise "Bad format"
    end)
  end

  defp zip([x1 | l1], [x2 | l2]), do: [{x1, x2} | zip(l1, l2)]
  defp zip([x1 | l1], []), do: [{x1, 0} | zip(l1, [])]
  defp zip([], [x2 | l2]), do: [{0, x2} | zip([], l2)]
  defp zip([], []), do: []
end
