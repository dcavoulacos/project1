class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string  :email
		t.string  :username
		t.references :posts
      t.timestamps
    end
  end
end
