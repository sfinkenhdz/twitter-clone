class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :null => false
      t.string :crypted_password
      t.string :salt
      t.string  :full_name, :null => false
      t.string  :username, :null => false
      t.string  :image_url

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end