class Card
  attr_reader :front

  def initialize(front, back)
    @front = front
    @back = back
  end

  def play
    get_input
    check_back
  end

  private

  def check_back
    if answered_correctly?
      puts "Hooray!"
    else
      puts "I'm sorry, it was actually #{@back}"
    end
  end

  def get_input
    print "What is the answer for: #{front} > "
    @answer = gets.chomp
  end

  def answered_correctly?
    @answer == @back
  end
end

class Deck
  attr_reader :name, :cards

  def initialize(name, cards)
    @name = name
    @cards = cards
  end

  def play
    cards.shuffle.each do |card|
      card.play
    end
  end

  def to_s
    @name
  end
end

class FlashcardGame
  def initialize(decks)
    @decks = decks
  end

  def play
    welcome_banner
    loop do
      choice = get_choice
      if choice == "exit"
        break
      end

      found_deck = get_deck(choice)

      if found_deck
        found_deck.play
      end
    end
  end

  private

  def welcome_banner
    puts "Welcome to Flash Card Game"
    puts "---"
    puts "translate the front of the card correctly"
  end

  def get_choice
    puts "pick a deck"
    puts @decks.join(", ")
    print "Deck > "
    gets.chomp
  end

  def get_deck(choice)
    @decks.find do |deck|
      deck.name == choice
    end
  end
end

class DeckReader
  def initialize(file)
    @filename = File.open(file, "r") 
  end

  def decks
    deck_ammount =  @filename.gets.to_i
    deck_ammount.times.map do |decks|
      deck_name = @filename.gets.chomp
      Deck.new(deck_name, cards_from_file)
    end
  end

  private

  def cards_from_file
    @filename.gets.to_i.times.map do 
      front = @filename.gets.chomp
      back = @filename.gets.chomp
      Card.new(front, back)
    end
  end
end

deck_reader = DeckReader.new("decks.txt")
decks = deck_reader.decks

game = FlashcardGame.new(decks)
game.play
