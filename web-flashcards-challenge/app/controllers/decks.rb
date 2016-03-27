get '/decks' do
  @decks = Deck.all
  erb :'/decks/index'
end

# get '/decks/new' do

# end

# post '/decks' do

# end

#  I am kind of iffy on these routes below. ----------------------------
get '/decks/:id/cards' do
  @deck = Deck.find(params[:deck_id])
  @cards = Card.where(deck_id: @deck.id)
  @cards.shuffle
  erb 'deck/play'
end

get '/decks/:deck_id/cards/:card_id' do

end

post '/decks/:deck_id/cards/:card_id' do

end

# get '/decks/:id/edit' do

# end

# patch '/decks/:id' do

# end

# delete '/decks/:id' do

# end
