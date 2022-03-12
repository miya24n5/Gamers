class Relationship < ApplicationRecord
  
  # belongs_to :userで書くとどっちがどっちかわからなくなるからカラム名で、プラスclass_nameでuserモデルを読む
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  
end
