defmodule MyList do
  def reduce([], acc, _), do: acc
  def reduce([ head | tail ], acc, func) do
    reduce tail, func.(head, acc), func
  end
end
