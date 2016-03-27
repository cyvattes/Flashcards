get '/decks' do
  @decks = Deck.all
  erb :'/decks/index'
end

# get '/decks/new' do

# end

# post '/decks' do

# end

#  I am kind of iffy on these routes below. ----------------------------
get '/decks/:deck_id/cards' do
  @deck = Deck.find(params[:deck_id])
  @deck.new_deck if @deck.cards == nil
  @card = @deck.pick_a_card
  if @card == 'game over'
    erb :'/decks/results' 
  end
  erb :'/decks/play'
end

post '/decks/:deck_id/cards' do
  deck = Deck.find(params[:deck_id])
  deck.submit_answer(params[:answer])
  redirect '/decks/:deck_id/cards'
end

# get '/decks/:id/edit' do

# end

# patch '/decks/:id' do

# end

# delete '/decks/:id' do

# end
