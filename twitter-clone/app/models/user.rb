class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  has_many :follower_follows, foreign_key: :followed_id, class_name: "Following"
  has_many :followers, through: :follower_follows, source: :follower
  has_many :followed_follows, foreign_key: :follower_id, class_name: "Following"
  has_many :followeds, through: :followed_follows, source: :followed
  has_many :tweets, foreign_key: :creator_id
end
