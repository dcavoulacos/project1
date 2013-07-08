class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :comment

  validates :user_id, :uniqueness => { :scope => [:post_id, :comment_id] }
end

