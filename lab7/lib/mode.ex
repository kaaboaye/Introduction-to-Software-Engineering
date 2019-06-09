defmodule Mode do
  @doc """
  Calculates mode

  This function can take as an argument any object which implements `Enumerable` protocol.
  However in the case of `Map` it will always return first entry due to their specification.

  ## Examples

  Find mode in given list

      iex> Mode.mode([1, 2, 3, 2])
      2

  From set of the most popular values returns first in given list

      iex> Mode.mode([1, 1, 1, 2, 2, 2])
      1

  Basic example from specification

      iex> Mode.mode([1, 2, -1, 1, 2, 3, 1])
      1

  Complex example from specification with

      iex> Mode.mode([1, 2, 1, 2, 3, 2, 3, 3])
      2

  It works with multiple types

      iex> Mode.mode(["a", 'b', 1, 'b', "a"])
      "a"

  It supports `Keyword` lists

      iex> Mode.mode(a: 1, b: 2, a: 2, a: 2)
      {:a, 2}

  For `Map` always returns first element

      iex> map = %{a: 1, b: 2, c: 3}
      iex> Mode.mode(map) == map |> Enum.to_list() |> hd()
      true

  Argument has to implement `Enumerable` protocol

      iex> Mode.mode(123)
      ** (Protocol.UndefinedError) protocol Enumerable not implemented for 123. This protocol is implemented for: HashSet, Range, Map, Function, List, Stream, Date.Range, HashDict, GenEvent.Stream, MapSet, File.Stream, IO.Stream
  """
  @spec mode(list) :: any
  def mode(arr) do
    [{_, max} | _] =
      common =
      arr
      |> Enum.reduce(%{}, &Map.put(&2, &1, Map.get(&2, &1, 0) + 1))
      |> Enum.sort(fn {_, x}, {_, y} -> x >= y end)

    most_common =
      Enum.filter(common, fn {_, x} -> x == max end)
      |> Enum.map(fn {v, _} -> v end)

    Enum.find(arr, &(&1 in most_common))
  end
end
