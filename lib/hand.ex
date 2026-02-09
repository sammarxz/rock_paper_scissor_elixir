defmodule RockPaperScissor.Hand do
  @required_keys [:name, :win, :lose]

  @enforce_keys @required_keys

  defstruct @required_keys

  def build(:rock) do
    %RockPaperScissor.Hand{
      name: :rock,
      win: [:scissor],
      lose: [:paper]
    }
  end

  def build(:paper) do
    %RockPaperScissor.Hand{
      name: :paper,
      win: [:rock],
      lose: [:scissor]
    }
  end

  def build(:scissor) do
    %RockPaperScissor.Hand{
      name: :scissor,
      win: [:paper],
      lose: [:rock]
    }
  end
end
