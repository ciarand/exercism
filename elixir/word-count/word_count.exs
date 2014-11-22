defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
      String.downcase(sentence)
        |> String.replace([",", "_", "!", ":", "@", "&", "$", "%", "^"], " ")
        |> String.split()
        |> Enum.reject(fn(x) -> x == "" end)
        |> Enum.reduce(%{}, fn(x, acc) ->
            Dict.put(acc, x, Dict.get(acc, x, 0) + 1)
        end)
  end
end
