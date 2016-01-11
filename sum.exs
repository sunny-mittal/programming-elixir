defmodule MyList do
  def sum([], total), do: total
  def sum([ head | tail ], total), do: sum tail, head + total
end

IO.puts MyList.sum [ 1, 2, 3, 4 ], 0
