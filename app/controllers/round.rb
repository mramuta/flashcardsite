get '/rounds/:id' do
  @round  = Round.find(session[:round_id])
  @guesses = @round.guesses
  @cards = @guesses.where(correct: true)

  erb :'round/show'
end

post '/rounds' do
  user = current_user
  deck_id = params[:deck_id]
  p deck_id
  if user
    round = Round.create(user_id: user.id, deck_id: deck_id)
  else
    round = Round.create(user_id: 999, deck_id: deck_id)
  end
  session[:round_id] = round.id
  redirect "/decks/#{deck_id}"
end

