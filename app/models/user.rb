class User < ApplicationRecord
    validates :username, uniqueness: true, presence: true
    has_many :ratings
    has_many :games, through: :ratings


    has_secure_password

    def self.create_by_facebook_omniauth(auth)
     self.find_or_create_by(username: auth[:info][:email]) do |u|
        u.password = SecureRandom.hex
    end 
  end 
end
