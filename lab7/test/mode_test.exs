defmodule ModeTest do
  use ExUnit.Case
  doctest Mode

  describe "mode " do
    import Mode

    @doc """
    Simple list test
    """
    test "simple 1" do
      assert mode([1, 1, 2]) == 1
    end

    @doc """
    Simple list test
    """
    test "simple 2" do
      assert mode([2, 1, 2]) == 2
    end

    @doc """
    Simple list test
    """
    test "simple 3" do
      assert mode([2, 2, 2]) == 2
    end

    @doc """
    Complex list test
    """
    test "complex 1" do
      assert mode([1, 1, 2, 2]) == 1
    end

    @doc """
    Complex list test
    """
    test "complex 2" do
      assert mode([1, 2, 1, 2, 3, 2, 3, 3]) == 2
    end

    @doc """
    `Keyword` test
    """
    test "keyword" do
      assert mode(a: 1, b: 3, a: 4, a: 1) == {:a, 1}
    end

    @doc """
    `Map` test
    """
    test "map" do
      map = %{a: 1, b: 2, c: 3}
      assert mode(map) == map |> Enum.to_list() |> hd()
    end
  end
end
