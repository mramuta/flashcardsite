get '/decks' do
  @decks = Deck.all
  erb :'/decks/index'
end

get '/decks/:id' do
  @deck = Deck.find(params[:id]) # grab specific deck.
  round_id = session[:round_id]
  @round = Round.find(round_id)
  @cards = @deck.cards.order('random()').select do |card|
    card.guesses.where(round_id: round_id, correct: true).empty?
  end
  if @cards.empty?
    redirect "/rounds/#{round_id}"
  else
    erb :'decks/show'
  end
end


