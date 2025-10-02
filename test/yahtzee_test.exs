defmodule YahtzeeTest do
  use ExUnit.Case

  test "Identify 'Three of a kind' with 4s" do
    assert %{"Three of a kind": 17} = Yahtzee.score_lower([2, 3, 4, 4, 4])
  end

  test "No three of a kind" do
    assert %{"Three of a kind": 0} = Yahtzee.score_lower([1, 2, 3, 4, 5])
  end
end
