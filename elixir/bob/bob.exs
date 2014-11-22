defmodule Teenager do
  def hey(input) do
    cond do
      # a silent greeting makes a Teenager mad
      String.strip(input) == ""   -> "Fine. Be that way!"
      # Teenagers are not good at answering questions
      String.at(input, -1) == "?" -> "Sure."
      # Teenagers don't like being yelled at
      is_yelling?(input)          -> "Woah, chill out!"
      # Teenagers are apathetic toward all other things
      true                        -> "Whatever."
    end
  end

  # it's only yelling if it's ALL CAPS and there are characters that can be
  # capitalized (i.e. if you can notice a difference after downcasing it)
  defp is_yelling?(input) do
    input === String.upcase(input) and input !== String.downcase(input)
  end
end
