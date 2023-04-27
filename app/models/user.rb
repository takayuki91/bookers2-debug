class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_one_attached :profile_image
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  
  # フォローする側からのhas_manyであることをforeign_keyで明示
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォローされる側からのhas_manyであることをforeign_keyで明示
  has_many :reverse_of_relationships, class_name: "Ralationship", foreign_key: "followed_id", dependent: :destroy
  # 全員分のデータを取ってくるため
  has_many :followers, through: :relationships, source: :followed
  has_many :followeds, through: :reverse_of_relationships, source: :follower
  
  # あるユーザーがフォローされているか否かを判定するメソッドを定義
  def is_followed_by?(user)
    reverse_of_relationships.find_by(follower_id: user.id).present?
  end

  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
end
