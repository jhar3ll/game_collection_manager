class Genre < ApplicationRecord
 has_many :games

 scope :ordered_by_title, -> { order(title: :asc)}
end
