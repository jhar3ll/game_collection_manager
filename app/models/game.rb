class Game < ApplicationRecord
  belongs_to :platform
  belongs_to :user
  belongs_to :genre
  
  has_many :ratings, :dependent => :destroy
  has_many :users, through: :ratings, :dependent => :destroy

  validates :title, presence: true
  validate :not_duplicate

    def not_duplicate
      if Game.find_by(title: title, platform_id: platform_id)
        errors.add(:title, "already exists!")
    end
   end 
end
