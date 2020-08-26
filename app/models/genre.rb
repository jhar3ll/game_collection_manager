class Genre < ApplicationRecord
 has_many :games

    def self.alpha
        order(:title)
     end 
end
