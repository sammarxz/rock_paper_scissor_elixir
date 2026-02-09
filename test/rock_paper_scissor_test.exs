defmodule RockPaperScissorTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  describe "play/0" do
    test "prints error message for invalid input" do
      output = capture_io([input: "banana\n"], fn ->
        RockPaperScissor.play()
      end)

      assert output =~ "Please, select only: rock, paper or scissor"
    end

    test "prints result for rock input" do
      output = capture_io([input: "rock\n"], fn ->
        RockPaperScissor.play()
      end)

      assert output =~ "Welcome to the Game!"
      assert output =~ "rock" or output =~ "Draw"
    end

    test "prints result for paper input" do
      output = capture_io([input: "paper\n"], fn ->
        RockPaperScissor.play()
      end)

      assert output =~ "Welcome to the Game!"
      assert output =~ "paper" or output =~ "Draw"
    end

    test "prints result for scissor input" do
      output = capture_io([input: "scissor\n"], fn ->
        RockPaperScissor.play()
      end)

      assert output =~ "Welcome to the Game!"
      assert output =~ "scissor" or output =~ "Draw"
    end

    test "result is always win, lose or draw" do
      output = capture_io([input: "rock\n"], fn ->
        RockPaperScissor.play()
      end)

      assert output =~ "win!" or output =~ "lose!" or output =~ "Draw!"
    end
  end
end
