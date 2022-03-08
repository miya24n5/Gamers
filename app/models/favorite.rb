class Favorite < ApplicationRecord
  
  # アソシエーション
  belongs_to :user
  
end
