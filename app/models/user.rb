class User < ApplicationRecord
    has_many :ratings
    has_many :rated_games, through: :ratings source:game
    has_many :games
end
