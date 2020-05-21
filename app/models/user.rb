class User < ApplicationRecord
    
    validates :username, uniqueness: true, presence: true
    has_many :ratings
    has_many :games, through: :ratings


    has_secure_password
end
