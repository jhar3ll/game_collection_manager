class Game < ApplicationRecord
  belongs_to :platform
  belongs_to :user
  
  has_many :ratings 
  has_many :users, through: :ratings
end
