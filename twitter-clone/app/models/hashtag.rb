class Hashtag < ActiveRecord::Base
  has_many :taggings
end
