class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps null: false
    end
      add_index :followings, [:follower_id, :followed_id]
  end
end

