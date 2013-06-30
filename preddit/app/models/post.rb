class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :votes

	# def upvote_count
	#   votes.count(:conditions => "value = 1")
	# end

	# def downvote_count
	#   votes.count(:conditions => "value = 0")
	# end


end
