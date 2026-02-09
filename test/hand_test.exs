defmodule RockPaperScissor.HandTest do
  use ExUnit.Case

  alias RockPaperScissor.Hand

  describe "build/1" do
    test "builds rock hand with correct win and lose" do
      hand = Hand.build(:rock)

      assert hand.name == :rock
      assert hand.win == [:scissor]
      assert hand.lose == [:paper]
    end

    test "builds paper hand with correct win and lose" do
      hand = Hand.build(:paper)

      assert hand.name == :paper
      assert hand.win == [:rock]
      assert hand.lose == [:scissor]
    end

    test "builds scissor hand with correct win and lose" do
      hand = Hand.build(:scissor)

      assert hand.name == :scissor
      assert hand.win == [:paper]
      assert hand.lose == [:rock]
    end

    test "returns a Hand struct" do
      assert %Hand{} = Hand.build(:rock)
    end

    test "raises on invalid hand" do
      assert_raise FunctionClauseError, fn ->
        Hand.build(:invalid)
      end
    end
  end
end
