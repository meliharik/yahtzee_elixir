defmodule Yahtzee do
  def score_lower(dice) do
    %{
      "Three of a kind": three_of_a_kind(dice),
      "Four of a kind": four_of_a_kind(dice),
      "Full house": full_house(dice),
      "Large straight": large_straight(dice),
      "Small straight": small_straight(dice)
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

  defp large_straight(dice) do
    sorted = Enum.sort(Enum.uniq(dice))
    if sorted == [1,2,3,4,5] or sorted == [2,3,4,5,6], do: 40, else: 0
  end

  defp small_straight(dice) do
    uniq = Enum.sort(Enum.uniq(dice))
    straights = [[1,2,3,4], [2,3,4,5], [3,4,5,6]]
    if Enum.any?(straights, fn s -> Enum.all?(s, &(&1 in uniq)) end), do: 30, else: 0
  end
end
