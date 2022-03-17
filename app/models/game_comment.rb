class GameComment < ApplicationRecord
# デフォルトの並び順を作成した日時(created_at)の降順で並び替え
  default_scope -> { order(created_at: :desc) }

  # アソシエーション
  belongs_to :user
  belongs_to :game

  validates :comment, presence: true

end
