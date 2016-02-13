defmodule Ch11 do
  def printable?(head)
  when head >= ' ' and head <= '~' do
    true
  end
  def printable?([ head | tail ])
  when head >= ' ' and head <= '~' do
    printable? tail
  end
  def printable?(_), do: false

  def better_printable(sqs), do: Enum.all? sqs, fn ch -> ch in ?\s..?~ end

  def anagram?(word1, word2), do: Enum.sort(word1) == Enum.sort(word2)

  def calculate(str) do
    chunked = Enum.chunk_by(Enum.filter(str, &(&1 != 32)), &(&1 in '+-/*'))
    _calculate chunked
  end
  defp _calculate([ a, '+', b ]), do: List.to_integer(a) + List.to_integer(b)
  defp _calculate([ a, '-', b ]), do: List.to_integer(a) - List.to_integer(b)
  defp _calculate([ a, '*', b ]), do: List.to_integer(a) * List.to_integer(b)
  defp _calculate([ a, '/', b ]), do: List.to_integer(a) / List.to_integer(b)

  def center(list) do
    max_length = String.length(Enum.max_by(list, &String.length/1))
    mapped = Enum.map list, fn el ->
      String.rjust(el, String.length(el) + div(max_length - String.length(el), 2))
    end
    mapped |> Enum.each(&IO.puts/1)
  end

  def capitalize_sentences(sentences) do
    String.split(sentences, ". ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(". ")
  end
end
