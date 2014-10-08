class Cards
  attr_reader :front
  attr_reader :back

  def initialize(front, back)
    @front = front
    @back = back
  end

end

class Decks
  attr_reader :name

  def initialize(cards,name)
    @the_cards = cards
    @name = name
  end

  def get_the_deck_now
    @the_cards.shuffle.each do |blobby|
      print "#{blobby.front} is? "
      user_answer = gets.chomp    
      if user_answer == blobby.back
        puts "You are correct!"
      else
        puts "I'm sorry, but the answer is #{blobby.back}"
      end
    end
  end

end

class Flashcardgame

  def initialize(decks)
    @decks = decks
  end

  def play
    welcome_banner
    @decks.each do |what_deck|
      puts "#{what_deck.name}"
    end
    ask_flash_question
    puts "Do you want to play again, yes or no?"
    answer = gets.chomp.downcase[0]
    if answer == "y"
      play
    end
  end
  
  def welcome_banner
    msg = "Hello, This is the Flash Card Game!"
    puts msg
    puts "-" * msg.length
    puts "Which Deck would you like to try?"
  end

  def ask_flash_question
    deck_answer = gets.chomp
    @decks.each do |blobby|
      if deck_answer == blobby.name
        puts "ok we are ready to analyze the deck"
        blobby.get_the_deck_now
        break
      end
    end
  end

end

adam_cards = [Cards.new("hello", "yo")]
adam_cards << Cards.new("goodbye", "peace")
adam_cards << Cards.new("apple", "yum")

spanish_cards = [Cards.new("verde", "green")]
spanish_cards << Cards.new("blanco", "white")
spanish_cards << Cards.new("roja", "red")

many_decks = [Decks.new(adam_cards, "adam")]
many_decks << Decks.new(spanish_cards, "spanish")

game = Flashcardgame.new(many_decks)

game.play 
