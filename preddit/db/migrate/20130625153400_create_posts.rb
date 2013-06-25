class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
   	  t.integer :user_id
      t.string :title
      t.string :link
      t.references :user
      t.timestamps
    end
  end
end
