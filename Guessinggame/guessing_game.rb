# Guessing Game by AK 09-22-14

class Gamestats

  def initialize
    @total_wins = 0
  end

  def win
    @total_wins = @total_wins + 1
  end

end

class Game

  def initialize
    @total_guesses = 0
    @total_rounds = 1
    @stats = Gamestats.new
  end

  def play
    display_welcome_message
    the_random_number
    capture_guess
    checking_game_answer
    play_game_again
  end

  def display_welcome_message
    welcome_message = "Hi, Welcome to the Guessing Game"
    puts welcome_message
    puts "-" * welcome_message.size
    puts "Here is the game:  Guess a number between 1 and 10."
  end

  def the_random_number
    @random_number = rand(10) + 1
  end

  def capture_guess
    @guess = gets.chomp.to_i
  end

  def checking_game_answer

    counter = 0
    guessed_the_answer = false

    while counter != 5 && !guessed_the_answer
      if @guess == @random_number
        puts "Correct!"
        @total_wins = @stats.win
        guessed_the_answer = true
      elsif counter == 4
        puts "I'm sorry but you lost :("
      else
        puts "Incorrect, please guess again:"
        capture_guess
      end
      @total_guesses += 1
      counter = counter + 1
    end

  end

  def play_game_again

    puts "#{@total_rounds} Rounds  #{@total_guesses} Guesses"
    puts "Would you like to play again (y\/n)?"
    again_answer = gets.chomp

    if again_answer[0].downcase == "y"
      @total_rounds = @total_rounds + 1
      play
    else
      guess_per_round = @total_guesses.to_f / @total_rounds.to_f
      puts "The total number of wins is: #{@total_wins} per #{@total_rounds} rounds."
      puts "The guesses per round ratio is: #{guess_per_round}."
    end

  end

end

adam = Game.new
adam.play

