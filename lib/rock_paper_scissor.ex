defmodule RockPaperScissor do
  alias RockPaperScissor.Hand

  @available_hands [:rock, :paper, :scissor]

  def play do
    welcome_message()

    get_user_response()
    |> handle_user_response()
    |> match_hands()
    |> print_result()
  end

  defp welcome_message do
    IO.puts("Welcome to the Game!")
    IO.puts("What's your choice: ")
  end

  defp get_user_response do
    IO.gets("rock, paper or scissor?\n")
    |> String.trim()
  end

  defp handle_user_response("rock"), do: {:ok, :rock}
  defp handle_user_response("paper"), do: {:ok, :paper}
  defp handle_user_response("scissor"), do: {:ok, :scissor}
  defp handle_user_response(_), do: {:error, :invalid_choice}

  defp match_hands({:error, _}), do: {:error, "Please, select only: rock, paper or scissor"}

  defp match_hands({:ok, player}) do
    player_hand = Hand.build(player)
    computer_hand = Hand.build(Enum.random(@available_hands))

    verify_result(player_hand, computer_hand)
  end

  defp verify_result(%{name: same}, %{name: same}), do: {:draw, same}

  defp verify_result(player, computer) do
    if player.name in computer.lose,
      do: {:win, player.name, computer.name},
      else: {:lose, player.name, computer.name}
  end

  defp print_result({:error, message}), do: IO.puts(message)
  defp print_result({:draw, hand}), do: IO.puts("Draw! Both chose #{hand}")
  defp print_result({:win, p, c}), do: IO.puts("You win! #{p} beats #{c}")
  defp print_result({:lose, p, c}), do: IO.puts("You lose! #{c} beats #{p}")
end
