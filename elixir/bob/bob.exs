defmodule Teenager do
  def hey(input) do
    cond do
      # silence is seen as an attack
      silence?(input)    -> "Fine. Be that way!"
      # questions are answered quickly, and with confidence
      question?(input)   -> "Sure."
      # a calm demeanor is encouraged
      is_yelling?(input) -> "Woah, chill out!"
      # general tolerance remains at an all time high
      true               -> "Whatever."
    end
  end

  defp silence?(input) do
      String.strip(input) === ""
  end

  defp question?(input) do
      String.ends_with?(input, "?")
  end

  # it's only yelling if it's ALL CAPS and there are characters that can be
  # capitalized (i.e. if you can notice a difference after downcasing it)
  defp is_yelling?(input) do
    input === String.upcase(input) and input !== String.downcase(input)
  end
end
