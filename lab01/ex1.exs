defmodule Ex1 do
  def mode(arr) do
    [{_, max} | _] =
      common =
      arr
      |> Enum.reduce(%{}, &Map.put(&2, &1, Map.get(&2, &1, 0) + 1))
      |> Enum.sort(fn {_, x}, {_, y} -> x >= y end)

    most_comon =
      Enum.filter(common, fn {_, x} -> x == max end)
      |> Enum.map(fn {v, _} -> v end)

    Enum.find(arr, &(&1 in most_comon))
  end
end
