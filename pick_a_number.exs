defmodule Chop do
  def check(guess, actual, low.._) when guess > actual do
    check low + div(guess - 1 - low, 2), actual, low..(guess - 1)
  end
  def check(guess, actual, _..high) when guess < actual do
    check guess + div(high - guess - 1, 2), actual, (guess + 1)..high
  end
  def check(guess, actual, _) when guess == actual do
    IO.puts "The correct answer is #{guess}"
  end
  def guess(actual, r = _..high) do
    check div(high, 2), actual, r
  end
end
