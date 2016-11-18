get '/decks' do
  @decks = Deck.all
  erb :'/decks/index'
end

get '/decks/:id' do
  @deck = Deck.find(params[:id]) # grab specific deck.
  @cards = @deck.cards.order('random()')
  erb :'decks/show'
end

