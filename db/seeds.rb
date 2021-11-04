# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

City.destroy_all
# User.destroy_all
# Gossip.destroy_all
# Tag.destroy_all
# GossipTag.destroy_all
#PrivateMessage.destroy_all
#RecipientsMessage.destroy_all


# 10 villes
# 10 Tags
cities_array = [{name: "PARIS" , zip_code: "75000"}, {name: "TOULOUSE" , zip_code: "31000"}, {name: "NICE" , zip_code: "06000"}, {name: "NANTES" , zip_code: "44000"}, {name: "STRASBOURG" , zip_code: "67000"}, {name: "MONPELLIER" , zip_code: "34000"}, {name: "BORDEAUX" , zip_code: "33000"}, {name: "LILLE" , zip_code: "59000"}, {name: "RENNES" , zip_code: "35000"}, {name: "AMIENS" , zip_code: "80000"}]
#tag_array = ["#TropMarant","#Lol","#Lucie","#Jaime","JeNeSaisPasQuoiMettre","#Tag","#Francis","#Smile","#Caca","#Love"]

cities_array.each_with_index do |city_to_save, index|
    City.create(city_to_save)
    puts "#{index} city créées"
end

# tag_array.each_with_index do |tag , index|
#     Tag.create(name: tag)
#     puts "#{index} tags créées"
# end

# 10.times do 
#     User.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , email: Faker::Internet.email, description: Faker::Lorem.words(number: 5).join(" "), age: Faker::Number.within(range: 16..100),city: City.all[rand(0..9)] )
#     puts "new user"
# end

# 20.times do 
#     Gossip.create(content: Faker::Lorem.words(number: 7).join(" "), user: User.all[rand(0..9)], title: Faker::Lorem.words(number: 3).join(" "))
#     puts "new Gossip"
# end

# Gossip.all.each_with_index do |gossip_to_tag, index|
#     GossipTag.create(gossip: gossip_to_tag, tag: Tag.all[rand(0..9)])
#     GossipTag.create(gossip: gossip_to_tag, tag: Tag.all[rand(0..9)])
#     puts "#{index * 2} associations gossip tag créées"
# end

