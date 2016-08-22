class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :creator_id
      t.string  :content, null: false, limit: 140
      t.integer :retweet_count
      t.integer :like_count

      t.timestamps null: false
    end
    add_index :tweets, :creator_id
  end
end

