get '/users' do

end

get '/users/new' do

  erb :'users/new'
end

post '/users' do
  user = User.create(params[:user])
  session[:id] = user.id
  redirect '/decks'
end

# get '/users/:id' do

# end

get '/users/:id/rounds' do

end

get '/users/:id/rounds/:round_id' do

end

# get '/users/:id/edit' do

# end

# patch '/users/:id' do

# end

# delete '/users/:id' do

# end
