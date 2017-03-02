# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'random_data'
user = User.new(
    email: RandomData.random_space_email, 
    password: 'testes', 
    password_confirmation: 'testes'
)
user.skip_confirmation!
user.save!

# 5.times do
#     user = User.new(
#         email: RandomData.random_space_email, 
#         password: 'testes', 
#         password_confirmation: 'testes'
#     )
#     user.skip_confirmation!
#     user.save!
# end
users = User.all

50.times do 
    Wiki.create!(
        title: RandomData.random_space_sentence,
        body: RandomData.random_space_paragraph,
        private: false,
        user: users.sample
    )
end
    
puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
