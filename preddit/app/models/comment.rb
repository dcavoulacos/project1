class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :comment
  has_many :comments
  has_many :votes
  # attr_accessible :content, :user_id, :post_id
end
