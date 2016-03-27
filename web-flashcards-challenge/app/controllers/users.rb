

get '/users' do

end

get '/users/new' do

  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
  user.password = params[:password]
  if user.save
    session[:id] = user.id
    redirect '/decks'
  else
    redirect '/users/new'
  end
end

# get '/users/:id' do

# end

get '/users/:id/rounds' do
  @card = Cards.where(session[:id] == user.id)
end

get '/users/:id/rounds/:round_id' do

end

# get '/users/:id/edit' do

# end

# patch '/users/:id' do

# end

# delete '/users/:id' do

# end
