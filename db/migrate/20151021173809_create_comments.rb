class CreateComments < ActiveRecord::Migration #this whole migration creates a comments table
  def change
    create_table :comments do |t|
    	t.text :message #added fields we want to keep track of
    	t.string :rating

    	t.integer :user_id
    	t.integer :place_id

      	t.timestamps #adds 'created_at' and 'updated_at'
    end

    add_index :comments, [:user_id, :place_id] #added indexes to make it easier to search for 'user id' in db
    add_index :comments, :place_id #adds columns to database
  end
end
