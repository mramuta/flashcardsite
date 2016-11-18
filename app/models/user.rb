class User < ActiveRecord::Base
  has_many :rounds
  has_many :guesses, through: :rounds
  has_many :decks, through: :rounds

  before_create :crypt_pass
  validates :username, :email, { presence: true, uniqueness: true }
  validates :email, { format: { with: /@\S*[.][a-z]{3}/} }
  validates :password, { presence: true, length: { in: 6..12 } }


  def self.authenticate(email, password)
    user = self.find_by(email:email)
    return user if user && BCrypt::Password.new(user.password) == password
  end

 protected
  def crypt_pass
      self.password = BCrypt::Password.create(self.password)
  end
end
