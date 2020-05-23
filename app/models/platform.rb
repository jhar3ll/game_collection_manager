class Platform < ApplicationRecord
    has_many :games

    def self.alpha
        order(:name)
     end 
end
