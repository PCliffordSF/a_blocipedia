# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 5.times do
   User.create!(
   email:    Faker::Internet.email,
   password: Faker::Code.ean
   )
 end
 
 users = User.all
  
 50.times do
   Wiki.create!(
     user:   users.sample,
     title:  Faker::StarWars.vehicle,
     body:   Faker::Lorem.paragraph(2, false, 4)
   )
 end
  
  puts "#{User.count} users created"
  puts "#{Wiki.count} wikis created"
