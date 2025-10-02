defmodule Yahtzee do
  def score_lower(dice) do
    %{
      "Three of a kind": three_of_a_kind(dice),
      "Four of a kind": four_of_a_kind(dice),
      "Full house": full_house(dice)
    }
  end

  defp three_of_a_kind(dice) do
    if Enum.any?(Enum.frequencies(dice), fn {_k, v} -> v >= 3 end) do
      Enum.sum(dice)
    else
      0
    end
  end

  defp four_of_a_kind(dice) do
    if Enum.any?(Enum.frequencies(dice), fn {_k, v} -> v >= 4 end) do
      Enum.sum(dice)
    else
      0
    end
  end

  defp full_house(dice) do
    counts = Enum.frequencies(dice) |> Map.values() |> Enum.sort()
    if counts == [2, 3], do: 25, else: 0
  end
end
