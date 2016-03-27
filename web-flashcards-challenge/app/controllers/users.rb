get '/users' do

end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(user_name: params[:user_name], password: params[:password])
  if user.save
    session[:id] = user.id
    redirect '/decks'
  else
    redirect '/users/new'
  end
end

get '/users/login_form' do
  erb :'/users/login'
end

post '/users/login' do
  user = User.find_by(user_name: params[:username])
  if user.user_name && user.password == params[:password]
    redirect "/users/#{user.id}/rounds"
  else
    redirect "/users/login_form"
  end
end


get '/users/:id/rounds' do
  "it works"
end

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
