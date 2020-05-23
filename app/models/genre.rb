class Genre < ApplicationRecord

    def self.alpha
        order(:title)
     end 
end
