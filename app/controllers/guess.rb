
post '/guesses' do
  card_id = params[:card_id]
  deck_id = params[:deck_id]
  card = Card.find(card_id)
  answer = params[:answer]
  round_id = session[:round_id]
  correct =(card.answer == answer)
  Guess.create(correct: correct, round_id: round_id, card_id: card_id)
  redirect "/decks/#{deck_id}"
end
