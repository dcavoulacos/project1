class AddUsersToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :user_id, index: true
  end
end
