class Tweet < ActiveRecord::Base
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  belongs_to :creator, class_name: "User"
  has_many :taggings
  has_many :hashtags, through: :taggings
end
