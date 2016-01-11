defmodule Swapper do
  def swap([]), do: []
  def swap([ a, b | tail ]), do: [ b, a | swap tail ]
  def swap([ _ ]), do: raise "Can't swapa list with an odd number of elements"
end
