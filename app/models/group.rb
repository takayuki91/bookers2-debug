class Group < ApplicationRecord
  # 架空のowner
  belongs_to :owner, class_name: 'User'
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, source: :user

  validates :name, presence: true
  validates :introduction, presence: true
  # attachment :image, destroy: false
  has_one_attached :image

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end
  
  
end
