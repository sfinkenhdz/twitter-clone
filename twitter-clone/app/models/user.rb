class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
