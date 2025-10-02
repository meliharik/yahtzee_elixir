defmodule YahtzeeTest do
  use ExUnit.Case

  # Part 1
  test "Identify 'Three of a kind' with 4s" do
    assert %{"Three of a kind": 17} = Yahtzee.score_lower([2, 3, 4, 4, 4])
  end

  test "No three of a kind" do
    assert %{"Three of a kind": 0} = Yahtzee.score_lower([1, 2, 3, 4, 5])
  end

  # Part 2
  test "Identify 'Four of a kind'" do
    assert %{"Four of a kind": 24} = Yahtzee.score_lower([5, 5, 5, 5, 4])
  end

  test "No four of a kind" do
    assert %{"Four of a kind": 0} = Yahtzee.score_lower([1, 2, 3, 3, 4])
  end
end
mix test   # patlar
git add .
git commit -m "Four of a kind - failing"
yahtzee.ex
defmodule Yahtzee do
  def score_lower(dice) do
    %{
      "Three of a kind": three_of_a_kind(dice),
      "Four of a kind": four_of_a_kind(dice)
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
end