defmodule Yahtzee do
  def score_lower(dice) do
    %{
      "Three of a kind": three_of_a_kind(dice),
      "Four of a kind": four_of_a_kind(dice),
      "Full house": full_house(dice),
      "Small straight": small_straight(dice),
      "Large straight": large_straight(dice),
      "Yahtzee": yahtzee(dice),
      "Chance": chance(dice)
    }
  end

  def total_score(rounds) do
    total_score(rounds, [], 0)
  end

  defp total_score([], _used_categories, total), do: total

  defp total_score([round | rest], used_categories, total) do
    scores = score_lower(round)

    available =
      scores
      |> Enum.reject(fn {k, _v} -> k in used_categories end)

    {best_cat, best_score} =
      Enum.max_by(available, fn {_k, v} -> v end, fn -> {nil, 0} end)

    total_score(rest, [best_cat | used_categories], total + best_score)
  end



  defp three_of_a_kind(dice) do
    if(Enum.any?(Enum.frequencies(dice), fn {_k, v} -> v >= 3 end),
      do: Enum.sum(dice),
      else: 0
    )
  end

  defp four_of_a_kind(dice) do
    if(Enum.any?(Enum.frequencies(dice), fn {_k, v} -> v >= 4 end),
      do: Enum.sum(dice),
      else: 0
    )
  end

  defp full_house(dice) do
    freq = Enum.frequencies(dice) |> Map.values() |> Enum.sort()
    if freq == [2, 3], do: 25, else: 0
  end

  defp large_straight(dice) do
    sorted = Enum.uniq(dice) |> Enum.sort()
    if sorted == [1, 2, 3, 4, 5] or sorted == [2, 3, 4, 5, 6], do: 40, else: 0
  end

  defp small_straight(dice) do
    uniq = Enum.uniq(dice)
    straights = [
      [1, 2, 3, 4],
      [2, 3, 4, 5],
      [3, 4, 5, 6]
    ]

    if Enum.any?(straights, fn s -> Enum.all?(s, &(&1 in uniq)) end), do: 30, else: 0
  end

  defp yahtzee(dice) do
    if(Enum.uniq(dice) |> length() == 1, do: 50, else: 0)
  end

  defp chance(dice), do: Enum.sum(dice)
end
