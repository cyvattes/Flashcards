get '/users' do

end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(params[:user])
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
  if user.authenticate(params[:password])
    session[:id] = user.id
    redirect "/users/#{user.id}/rounds"
  else
    redirect "/users/login_form"
  end
end


get '/users/:user_id/rounds' do
  @user = User.find(params[:user_id])
  if @user.id = session[:id]
    @rounds = Round.where(user_id: @user.id)
    erb :'users/user_stats'
  else
   "Access denied"
  end
end


get '/users/:id/rounds/:round_id' do

end

# get '/users/:id/edit' do

# end

# patch '/users/:id' do

# end

# delete '/users/:id' do

# end
