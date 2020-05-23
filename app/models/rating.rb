class Rating < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :score, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than: 6}
  validates :content, presence: true 
  validates :game, uniqueness: { scope: :user, message: "has already been rated by this user!"}

  def self.alpha
    order(score: :desc)
 end 
end
