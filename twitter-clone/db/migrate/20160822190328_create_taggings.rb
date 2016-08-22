class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tweet_id
      t.integer :hashtag_id

      t.timestamps null: false
    end
    add_index :taggings, [:tweet_id, :hashtag_id]
  end
end