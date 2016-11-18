get '/rounds/new' do
	erb :"/rounds/new"
end

post '/rounds' do
	
	round = Round.create(params[:user])
	user.save
	redirect '/sessions/new'
end