require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "flashcard_app"
)

class Deck < ActiveRecord::Base
  has_many :cards
end

class Card < ActiveRecord::Base
  belongs_to :deck
end

get "/" do
  @decks = Deck.all
  erb :index
end

get "/decks/:id" do
  @deck = Deck.find(params[:id])
  erb :deck
end

get "/decks/:id/cards" do
  @deck = Deck.find(params[:id])
  @cards = @deck.cards
  card = @cards.shuffle.first
  redirect("/decks/#{card.deck_id}/cards/#{card.id}")
end

get "/decks/:id/cards/:card_id" do
  @deck = Deck.find(params[:id])
  @card = Card.find(params[:card_id])
  erb :game
end

post "/decks/:id/cards/:card_id/answer" do
  user = params[:user]
  @card = Card.find(params[:card_id])
  @deck = Deck.find(params[:id])

  if user["back"].downcase == @card.back.downcase
    @user_answer = "You are correct."
  else
    @user_answer = "You are incorrect."
  end

  erb :answer
end
