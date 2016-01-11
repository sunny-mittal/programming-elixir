defmodule Ch7 do
  def sum([]), do: 0
  def sum([ head | tail ]), do: head + sum tail

  def map([], _), do: []
  def map([ head | tail ], func) do
    [ func.(head) | map(tail, func) ]
  end

  def mapsum(list, func) do
    map(list, func) |> sum
  end

  def my_max(list), do: _my_max(list, 0)

  defp _my_max([], cur_max), do: cur_max
  defp _my_max([ head | tail ], cur_max) when head <= cur_max do
    _my_max tail, cur_max
  end
  defp _my_max([ head | tail ], cur_max) when head > cur_max do
    _my_max tail, head
  end

  def caesar([], _), do: ''
  def caesar([ head | tail ], n) when head + n <= ?z do
    [ head + n | caesar(tail, n) ]
  end
  def caesar([ head | tail ], n) do
    [ head + n - 26 | caesar(tail, n) ]
  end
end

defmodule MyList do
  def span(to, to), do: [ to ]
  def span(from, to) do
    [ from | span(from + 1, to) ]
  end
end
