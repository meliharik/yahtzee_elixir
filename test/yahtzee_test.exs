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

  # Part 3
  test "Identify 'Full house'" do
    assert %{"Full house": 25} = Yahtzee.score_lower([2, 2, 5, 5, 5])
  end

  test "Not a full house" do
    assert %{"Full house": 0} = Yahtzee.score_lower([2, 2, 2, 4, 5])
  end
end
