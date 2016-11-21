get '/users/new' do
	erb :"/users/new"
end

post '/users' do
	user = User.new(params[:user])
	if user.invalid?
		@error = user.errors.full_messages
		return erb :"users/new"
	end
	user.save
	redirect '/sessions/new'
end

get '/users/:id' do
	@user = User.find(params[:id])
	@decks = @user.decks
	@deck_ids = @decks.map{|deck|deck.id}.uniq
	erb :"/users/show"
end

get '/users/:id/edit' do
	# The page to get to editing your profile
	# Have :erb for updating fields on the page and then updating with the put below
end


put '/users/:id' do
	# This will allow users to update their profile
		# -name, email?
		# - reset their score!
		# need to use post in the form field, use the hidden input type with the method put
end

