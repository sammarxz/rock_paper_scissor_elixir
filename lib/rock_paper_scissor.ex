defmodule RockPaperScissor do
  alias RockPaperScissor.Hand

  @available_hands [:rock, :paper, :scissor]

  def play() do
    welcome_message()

    get_user_response()
    |> handle_user_response()
    |> match_hands()
  end

  defp welcome_message do
    IO.puts("Welcome to the Game!")
    IO.puts("What's your choice: ")
  end

  defp get_user_response do
    IO.gets("rock, paper or scissor?\n")
    |> String.trim()
  end

  defp handle_user_response(response) do
    case response do
      "rock" -> :rock
      "paper" -> :paper
      "scissor" -> :scissor
      _ -> :error
    end
  end

  defp match_hands(:error), do: IO.puts("Please, select only: rock, paper or scissor")

  defp match_hands(player) do
    player_hand = Hand.build(player)
    computer_hand = Hand.build(Enum.random(@available_hands))

    verify_result(player_hand, computer_hand)
  end

  defp verify_result(player, computer) do
    cond do
      player.name == computer.name ->
        IO.puts("Draw! Both chose #{player.name}")

      player.name in computer.lose ->
        IO.puts("You win! #{player.name} beats #{computer.name}")

      player.name in computer.win ->
        IO.puts("You lose! #{computer.name} beats #{player.name}")
    end
  end
end
