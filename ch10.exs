defmodule Ch10 do
  def all?([]), do: true
  def all?([], _), do: true
  def all?([ head | tail ], func), do: func.(head) && all? tail, func

  def each([], _), do: :ok
  def each([ head | tail ], func) do
    func.(head)
    each tail, func
  end

  def filter([], _), do: []
  def filter([ head | tail ], func) do
    if func.(head) do
      [ head ] ++ filter tail, func
    else
      [] ++ filter tail, func
    end
  end

  def split([], _), do: { [], [] }
  def split(list, x) when x >= length(list) do
    { list, [] }
  end
  def split(list, x) do
    _split(list, [], x)
  end
  defp _split([ head | tail ], acc, x) when x > 0 do
    _split(tail, acc ++ [ head ], x - 1)
  end
  defp _split(list, acc, 0), do: { acc, list }

  def take([], _), do: []
  def take(_, 0), do: []
  def take([ head | tail ], x) when x > 0 do
    [ head | take(tail, x - 1) ]
  end

  def flatten([]), do: []
  def flatten([ head | tail ]), do: flatten(head) ++ flatten(tail)
  def flatten(head), do: [ head ]

  def flatten2(list), do: _flatten2 list, []
  defp _flatten2([], result), do: Enum.reverse result
  defp _flatten2([ [ h | [] ] | tail ], result) do
    _flatten2 [ h | tail ], result
  end
  defp _flatten2([ [h | t ] | tail], result) do
    _flatten2 [ h, t | tail ], result
  end
  defp _flatten2([ head | tail ], result) do
    _flatten2 tail, [ head | result ]
  end

  # copy of span from ch7.exs
  def span(to, to), do: [ to ]
  def span(from, to) do
    [ from | span(from + 1, to) ]
  end

  def primes_to(n) do
    range = span(2, n)
    range -- (for a <- range, b <- range, a <= b, a * b <= n, do: a * b)
  end

  def orders_with_total(orders, tax_rates) do
    orders |> Enum.map(&add_total_to(&1, tax_rates))
  end

  def add_total_to(order = [ id: _, ship_to: state, net_amount: net ], tax_rates) do
    tax_rate = Keyword.get(tax_rates, state, 0)
    total = net + net * tax_rate
    Keyword.put(order, :total_amount, total)
  end
end

tax_rates = [ NC: 0.075, TX: 0.08 ]
orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount: 35.50 ],
  [ id: 125, ship_to: :TX, net_amount: 24.00 ],
  [ id: 126, ship_to: :TX, net_amount: 44.80 ],
  [ id: 127, ship_to: :NC, net_amount: 25.00 ],
  [ id: 128, ship_to: :MA, net_amount: 10.00 ],
  [ id: 129, ship_to: :CA, net_amount: 102.00 ],
  [ id: 130, ship_to: :NC, net_amount: 50.00 ]
]

IO.inspect Ch10.orders_with_total(orders, tax_rates)
