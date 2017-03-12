# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'random_data'

5.times do
    user = User.new(
        username: RandomData.random_space_username,
        email: RandomData.random_space_email, 
        password: 'teatea', 
        password_confirmation: 'teatea'
    )
    user.skip_confirmation!
    user.save!
end

standard_user = User.new(
    username: 'standard_user',
    email: 'standard@user.test', 
    password: 'teatea', 
    password_confirmation: 'teatea',
    role: 'standard'
)
standard_user.skip_confirmation!
standard_user.save!

premium_user = User.new(
    username: 'premium_user',
    email: 'premium@user.test', 
    password: 'teatea', 
    password_confirmation: 'teatea',
    role: 'premium'
)
premium_user.skip_confirmation!
premium_user.save!

admin_user = User.new( 
    username: 'admin_user',
    email: 'admin@user.test', 
    password: 'teatea', 
    password_confirmation: 'teatea',
    role: 'admin'
)
admin_user.skip_confirmation!
admin_user.save!

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
