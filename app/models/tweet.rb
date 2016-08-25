class Tweet < ActiveRecord::Base
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  validates :content, presence: true
  validates :content, length: { maximum: 140 }
  belongs_to :creator, class_name: "User"
  has_many :taggings
  has_many :hashtags, through: :taggings

  def find_hashtag
    @hashtags = self.content.scan(/[#]\w*/)
  end

  def increment_hashtag
    find_hashtag
    @hashtags.each do |tag|
      found_tag = Hashtag.find_by(name: tag)
      if found_tag == nil
        Hashtag.create(name: tag, count: 1)
      else
        found_tag.increment(:count)
        found_tag.save
      end
    end

  end

end

