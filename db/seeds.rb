# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

COLOR_KIND = [nil, 'pink', 'green', nil]

5.times do |i|
  customer = Customer.create(name: "Customer_#{i}")
end

20.times do |i|
  cab = Cab.create(position_x: rand(11...76), position_y: rand(11...76), kind: COLOR_KIND.sample)
end
