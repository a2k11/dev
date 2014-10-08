class GuessingGame
  ROUNDS = 5

  def initialize
    @total_guess_count = 0
    @wins = 0
  end

  def play
    welcome_banner
    ROUNDS.times do
      round = Round.new
      round.play
      @total_guess_count = @total_guess_count + round.guesses_for_round
      if round.guessed_correctly?
        @wins += 1
      end
    end
    exit_banner
  end

  private

  def welcome_banner
    msg = "Welcome to our Game"
    puts msg
    puts "-" * msg.length
  end

  def exit_banner
    puts "Thanks for playing!"
    puts "Here are your wins: #{@wins}"
    puts "Your average guesses per round are: #{@total_guess_count/ROUNDS.to_f}"
  end
end

class Round
  def initialize
    @number = generate_random_number
    @guess_count = 0
  end

  def play
    3.times do
      @guess_count = @guess_count + 1
      get_guess
      if guessed_correctly?
        break
      end
    end
    print_results
  end

  def guesses_for_round
    @guess_count
  end

  def guessed_correctly?
    @guess == @number
  end

  private

  def generate_random_number
    rand(10) + 1
  end

  def get_guess
    print "Make a guess between 1 and 10 > "
    @guess = gets.chomp.to_i
  end

  def print_results
    if guessed_correctly?
      puts "Hurray!"
    else
      puts "Doh, #{@number} oh no!"
    end
  end
end

hullabaloo = GuessingGame.new
hullabaloo.play