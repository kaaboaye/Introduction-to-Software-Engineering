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

  def tree(arr) do
    [{_, max} | _] =
      common =
      Enum.reduce(arr, :gb_trees.empty(), fn key, tree ->
        :gb_trees.enter(key, get(tree, key, 0) + 1, tree)
      end)
      |> :gb_trees.to_list()
      |> Enum.reverse()

    most_comon =
      Enum.filter(common, fn {_, x} -> x == max end)
      |> Enum.map(fn {v, _} -> v end)

    Enum.find(arr, &(&1 in most_comon))
  end

  defp get(tree, key, default) do
    case :gb_trees.lookup(key, tree) do
      {:value, value} -> value
      :none -> default
    end
  end
end
