defmodule Poli do
  def poli(x, [arg | pol]), do: x * poli(x, pol) + arg
  def poli(x, []), do: x

  def a_pol(x, [a, b | tail]), do: x * a + a_pol(x, [b | tail])
  def a_pol(_x, [a]), do: a
  def a_pol(_x, []), do: 0
end
