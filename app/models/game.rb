class Game < ApplicationRecord

  # アソシエーション
  belongs_to :user
  has_many :game_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # バリデーション
  validates :title, presence: true
  validates :body, presence: true
  validates :star, presence: true


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
