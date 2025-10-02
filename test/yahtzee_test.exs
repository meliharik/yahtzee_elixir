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

  # Part 4
  test "Identify 'Large straight'" do
    assert %{"Large straight": 40} = Yahtzee.score_lower([2, 3, 4, 5, 6])
    assert %{"Large straight": 40} = Yahtzee.score_lower([1, 2, 3, 4, 5])
  end

  test "Not a large straight" do
    assert %{"Large straight": 0} = Yahtzee.score_lower([1, 3, 4, 5, 6])
  end

  # Part 5
  test "Identify 'Small straight'" do
    assert %{"Small straight": 30} = Yahtzee.score_lower([2, 3, 2, 5, 4])
    assert %{"Small straight": 30} = Yahtzee.score_lower([2, 3, 3, 4, 5])
  end

  test "Not a small straight" do
    assert %{"Small straight": 0} = Yahtzee.score_lower([1, 1, 3, 5, 6])
  end

  # Part 6
  test "Identify 'Yahtzee'" do
    assert %{Yahtzee: 50} = Yahtzee.score_lower([2, 2, 2, 2, 2])
  end

  test "Not a Yahtzee" do
    assert %{Yahtzee: 0} = Yahtzee.score_lower([2, 2, 2, 2, 3])
  end

  # Part 7
  test "Identify 'Chance'" do
    assert %{Chance: 10} = Yahtzee.score_lower([1, 1, 2, 2, 4])
  end
end
