get '/sessions/new' do
	erb :'sessions/new'
end

post '/sessions' do
  if params[:username] && params[:pass]
    params[:username]
    user = User.authenticate(params[:username],params[:pass])
  end
  if user
    session[:user_id] = user.id
    redirect "/decks"
  end
  @error = "Invalid username/password combination."
  erb :'sessions/new'
end
	
delete '/sessions' do
	session[:user_id] = nil
	redirect '/'
end