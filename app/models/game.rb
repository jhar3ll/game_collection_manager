class Game < ApplicationRecord
  belongs_to :platform
  belongs_to :user
  belongs_to :genre
  
  has_many :ratings 
  has_many :users, through: :ratings
end
