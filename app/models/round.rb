class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :guesses
  has_many :cards, through: :guesses

  def first_guess_correct
    guesses = self.guesses.order(:created_at)
    first_guess_correct = 0
    guessed_cards = []
    guesses.each do |guess|
      p guess.correct
      p guessed_cards
      if !guessed_cards.include?(guess.card)
        first_guess_correct += 1 if guess.correct
        guessed_cards << Card.find(guess.card_id)
      end
    end
    first_guess_correct
  end



end
