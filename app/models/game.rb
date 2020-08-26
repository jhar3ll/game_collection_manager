class Game < ApplicationRecord
  belongs_to :platform
  belongs_to :user
  belongs_to :genre
  
  has_many :ratings, :dependent => :destroy
  has_many :users, through: :ratings, :dependent => :destroy

  validates :title, presence: true
  validates :title, uniqueness: { scope: [:platform, :genre], message: "is already in the list of games!"}

    #GENRES = ["fps", "action", "adventure", "shooting", "battle royale", "fighting", "sports", "puzzle", "RPG", "racing"]
    #PLATFORMS = ["nintendo", "PC", "xbox", "playstation"]

   # def not_duplicate
      #if Game.find_by(title: title, platform_id: platform_id)
        #errors.add(:title, "already exists!")
   # end
  # end 

  def self.search(search)
    if search 
      game = Game.find_by(title: search)
      if game 
        self.where(game_id: game)
      else 
        Game.all
      end 
    else 
      Game.all
    end
  end 

   def self.alpha
    order(:title)
 end 
end
