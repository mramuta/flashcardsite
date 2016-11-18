get '/users/new' do 
	erb :"/users/new"
end

post '/users' do
	user = User.new[params[:user]]
	if user.invalid?
		@error = user.errors.full_message
		return :"user/new"
	end
	user.save
	redirect '/sessions/new'

end