class Rating < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
  validates :content, presence: true 
  validates :game, uniqueness: { scope: :user, message: "has already been rated by this user!"}

  scope :ordered_by_create, -> { order(created_at: :desc)}
  scope :five_star_rating, -> { where("score = 5")}
end
