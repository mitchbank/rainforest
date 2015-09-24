# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
100.times do 
	Product.create(name: Faker::Commerce.product_name, price_in_cents: (Faker::Commerce.price * 100).to_i, description: Faker::Lorem.sentence)
end