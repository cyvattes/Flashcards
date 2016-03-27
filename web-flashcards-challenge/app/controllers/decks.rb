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
    round = Round.create(deck_id: params[:deck_id], user_id: session[:id])
  else
    round = Round.create(deck_id: params[:deck_id])
  end
  redirect "/decks/#{round.deck_id}/rounds/#{round.id}"
end
#  I am kind of iffy on these routes below. ----------------------------
get '/decks/:deck_id/rounds/:round_id' do
  @round = Round.find(params[:round_id])
  @deck = Deck.find(params[:deck_id])
  @cards = Card.where(deck_id: @deck.id).to_a
  @current_card = @cards.sample
  @guesses = Guess.where(round_id: @round.id).to_a
  @guesses.each do |guess|
    if guess.card_id == @current_card.id
      redirect "/decks/#{@deck.id}/rounds/#{@round.id}"
    end
  end

  # @deck = Deck.find(params[:deck_id])
  # @deck.new_deck if @deck.cards == nil
  # @card = @deck.pick_a_card
  # if @card == 'game over'
  #   erb :'/decks/results'
  # end
  erb :'/decks/play'
end

post '/decks/:deck_id/rounds/:round_id/cards/:card_id' do
  p params
  @card = Card.find(params[:card_id])
  @correct = (params[:answer] == @card.correct_answer)
  @guess = Guess.create(correct?: @correct, card_id: @card.id, round_id: params[:round_id])
  redirect "/decks/#{params[:deck_id]}/rounds/#{params[:round_id]}"
end

# get '/decks/:id/edit' do

# end

# patch '/decks/:id' do

# end

# delete '/decks/:id' do

# end
