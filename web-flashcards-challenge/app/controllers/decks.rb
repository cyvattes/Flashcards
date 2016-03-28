get '/decks' do
  @decks = Deck.all
  erb :'/decks/index'
end

# get '/decks/new' do

# end

# post '/decks' do

# end

post '/decks/:deck_id' do
  if session[:id]
    round = Round.create(deck_id: params[:deck_id], user_id: session[:id], score: 0)
  else
    round = Round.create(deck_id: params[:deck_id], score: 0)
  end
  redirect "/decks/#{round.deck_id}/rounds/#{round.id}"
end

#  I am kind of iffy on these routes below. ----------------------------
get '/decks/:deck_id/rounds/:round_id' do
  @round = Round.find(params[:round_id])
  @deck = Deck.find(params[:deck_id])
  cards = Card.where(deck_id: @deck.id).to_a
  # @current_card = cards.sample
  @guesses = Guess.where(round_id: @round.id).to_a
  cards_guessed = Guess.where(round_id: @round.id).pluck(:card_id).to_a
  p cards_guessed
  p cards
  cards.delete_if {|card| cards_guessed.include?(card.id)}
  p cards.length
  if cards.length == 0
    redirect :'/decks/results'
  end
  @current_card = cards.pop
  erb :'/decks/play'
end

post '/decks/:deck_id/rounds/:round_id/cards/:card_id' do
  @round = Round.find(params[:round_id])
  @card = Card.find(params[:card_id])
  @correct = (params[:answer] == @card.correct_answer)
  @guess = Guess.create(correct?: @correct, card_id: @card.id, round_id: params[:round_id])
  if @correct == true
    @round.score += 1
  end
  redirect "/decks/#{params[:deck_id]}/rounds/#{params[:round_id]}"
end

get '/decks/results' do
  @rounds = Round.all.to_a
  @round = @rounds.last
  @guesses = Guess.where(round_id: @round.id)
  @deck = Deck.find(@round.deck_id)
  erb :'/decks/results'
end
# get '/decks/:id/edit' do

# end

# patch '/decks/:id' do

# end

# delete '/decks/:id' do

# end
