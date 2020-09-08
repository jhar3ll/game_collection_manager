class Platform < ApplicationRecord
    has_many :games

    scope :ordered_by_name, -> { order(name: :asc)}
end
