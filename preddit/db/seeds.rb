# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
me = User.create!(username: "raph", email: "raphael.leung@yale.edu", first_name: "Raph", last_name: "Leung", password: "blah1234")

5.times do
	Post.create!(title: "Google", link: "http://www.google.com", user: me)
end

Comment.create!(content: "Comment1", user:me, post_id:1)