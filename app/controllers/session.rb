get '/sessions/new' do
	erb :'sessions/new'
end

post '/sessions' do
  if params[:email] && params[:pass]
    params[:email]
    user = User.authenticate(params[:email],params[:pass])
  end
  if user
    session['user'] = user.id
    redirect "/users/#{user.id}"
  end
  @error = "Invalid email/password combination."
  erb :'sessions/new'
end
	
delete '/sessions/new' do
	sessions[:user] = nil
	redirect '/'
end