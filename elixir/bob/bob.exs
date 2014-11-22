# Bob is a lackadaisical teenager. In conversation, his responses are very
# limited.
defmodule Teenager do
  def hey(input) do
    cond do
      # it's rude to say hey with silence
      String.strip(input) == ""
      -> "Fine. Be that way!"

      # it's a question if the last character is a question mark
      String.at(input, -1) == "?"
      -> "Sure."

      # it's only yelling if it's ALL CAPS and there are characters that can be
      # capitalized (i.e. if you can notice a difference after downcasing it)
      input == String.upcase(input) and input != String.downcase(input)
      -> "Woah, chill out!"

      true
      -> "Whatever."
    end
  end
end
