class Relationship < ApplicationRecord
  
  # フォローするユーザーに結びつく
  belongs_to :follower, class_name: "User"
  
  # フォローされるユーザーに結びつく
  belongs_to :followed, class_name: "User"
  
end
