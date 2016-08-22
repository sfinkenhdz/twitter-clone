class AddPaperclipToTweet < ActiveRecord::Migration
  def change
    add_column :tweets, :image_file_name,    :string
    add_column :tweets, :image_content_type, :string
    add_column :tweets, :image_file_size,    :integer
    add_column :tweets, :image_updated_at,   :datetime
  end
end
