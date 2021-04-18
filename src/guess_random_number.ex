defmodule GuessRandomNumber do

  @range 100

  def generate_random_number, do: :rand.uniform(@range)

  def evaluate_guess(guess, random_number) do
    cond do
      guess > random_number -> "lower"
      guess < random_number -> "higher"
      true -> "correct"
    end
  end

  def play_game(random_number, total_guesses \\ 1) do
    {guess, _} = IO.gets("Guess a number between 1 and #{@range}: ")
                 |> Integer.parse
    evaluation = evaluate_guess(guess, random_number)

    case evaluation == "correct" do
      false -> IO.puts(evaluation)
               play_game(random_number, total_guesses + 1)
      true -> total_guesses
    end
  end

  def play do
    IO.puts "starting game..."

    random_number = generate_random_number()
    guesses = play_game(random_number)

    IO.puts "You guessed the number in #{guesses} guesses! Number was #{random_number}"

  end

end

GuessRandomNumber.play()
