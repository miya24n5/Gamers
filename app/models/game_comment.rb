class GameComment < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  belongs_to :game
  
end
