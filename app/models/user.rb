class User < ActiveRecord::Base
  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :decks, through: :rounds


  validates :username, :email, { presence: true, uniqueness: true }
  validates :email, { format: { with: /@\S*[.][a-z]{3}/} }
  validates :password, { presence: true, length: { in: 6..12 } }
end
