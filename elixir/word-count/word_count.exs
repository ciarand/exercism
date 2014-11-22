defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
      sentence |> normalize |> split_words |> count_words
  end

  defp normalize(string) do
      String.downcase(string)
  end

  defp split_words(sentence) do
      # \p{L} means all unicode letters
      Regex.scan(~r/[\p{L}0-9\-]+/u, sentence) |> List.flatten
  end

  defp count_words(words) do
      Enum.reduce(words, %{}, &add_word/2)
  end

  defp add_word(word, acc) do
      Dict.update(acc, word, 1, &(&1 + 1))
  end
end
