class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards
end
