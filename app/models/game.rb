class Game < ApplicationRecord
  belongs_to :platform
  belongs_to :user
  belongs_to :genre
  
  has_many :ratings, :dependent => :destroy
  has_many :users, through: :ratings, :dependent => :destroy

  validates :title, presence: true
  validates :title, uniqueness: { scope: [:platform, :genre], message: "is already in the list of games!"}

  scope :ordered_by_title, -> { order(title: :asc)}

  def self.search(search)
    if search
      game = Game.find_by(title: search)
      if game 
        where(id: game) 
      else
        Game.ordered_by_title
      end 
    else
      Game.ordered_by_title
  end
 end
end
